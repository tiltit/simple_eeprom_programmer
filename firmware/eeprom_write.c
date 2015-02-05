/**
 * Reads and writes flash eeproms sutch as the 28B256
 *
 * Pinout
 * RD 0..7	->	Data 0..7
 * RB 0..7	->	Address 0..7
 * RA 0..5	->	Address 8..13
 * RC 1 	->	Address 14
 * RC 3 	->	OE
 * RC 2 	->	CE
 * RC 4		->	WE
**/

#define __16f877
#include "pic/pic16f877a.h"
#include "tsmtypes.h"

// Set the __CONFIG word:
//Uint16 at 0x2007  __CONFIG = CONFIG_WORD;

#ifndef KHZ
#define KHZ	20000
#endif

#define TX_PORT	6
#define RX_PORT	7
#define TX_BIT	(1<<TX_PORT)
#define RX_BIT	(1<<RX_PORT)

#define	BAUD	9600
#define BAUD_HI	1


#if	(BAUD_HI == 1)
#define	BAUD_FACTOR	(16L*BAUD)
#else
#define	BAUD_FACTOR	(64L*BAUD)
#endif
#define SPBRG_VALUE	(unsigned char)(((KHZ*1000L)-BAUD_FACTOR)/BAUD_FACTOR)

uint8_t uart_input_buffer[16];

uint8_t hexchar[16] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}; 

void delay_100us() 
{
	volatile int i;
	for(i=0;i!=35;++i);
}

void uart_print(char *str)
{
	uint8_t i = 0;
	while(str[i] != '\0') {
		while(!TRMT);	// Wait until we're free to transmit
			TXREG=str[i];	// Transmit
		i++;
	}
}

void uart_print_char(char c)
{
	while(!TRMT);	// Wait until we're free to transmit
		TXREG=c;	// Transmit
}

void set_oe(uint8_t val)
{
	if(val)
		PORTC |= (1 << 3);
	else
		PORTC &= ~(1 << 3);
}

void set_ce(uint8_t val)
{
	if(val)
		PORTC |= (1 << 2); // Set output enable high
	else
		PORTC &= ~(1 << 2); // Set output enable low
}

void set_we(uint8_t val)
{
	if(val)
		PORTC |= (1 << 4); // Set write enable high
	else
		PORTC &= ~(1 << 4); // Set write enable low
}

void int2hex(uint8_t val, char *lv, char *hv)
{
	*lv = 0;
	*hv = 0;
	*lv = hexchar[val & 0x0F];
	*hv = hexchar[(val >> 4) & 0x0F];
}

uint8_t hex2int(char hv, char lv, uint8_t *val) 
{
	*val = 0;

	switch(hv) {
		case '0': break;
		case '1': *val += 16; break;
		case '2': *val += 32; break;
		case '3': *val += 48; break;
		case '4': *val += 64; break;
		case '5': *val += 80; break;
		case '6': *val += 96; break;
		case '7': *val += 112; break;
		case '8': *val += 128; break;
		case '9': *val += 144; break;
		case 'A': *val += 160; break;
		case 'B': *val += 176; break;
		case 'C': *val += 192; break;
		case 'D': *val += 208; break;
		case 'E': *val += 224; break;
		case 'F': *val += 240; break;
		default:
			uart_print("er2");
			return 0;
	}

	switch(lv) {
		case '0': break;
		case '1': *val += 1; break;
		case '2': *val += 2; break;
		case '3': *val += 3; break;
		case '4': *val += 4; break;
		case '5': *val += 5; break;
		case '6': *val += 6; break;
		case '7': *val += 7; break;
		case '8': *val += 8; break;
		case '9': *val += 9; break;
		case 'A': *val += 10; break;
		case 'B': *val += 11; break;
		case 'C': *val += 12; break;
		case 'D': *val += 13; break;
		case 'E': *val += 14; break;
		case 'F': *val += 15; break;
		default:
			uart_print("er2");
			return 0;
	}

	return 1;
}

void set_address(uint16_t address)
{
	static uint8_t lb, hb;
	lb = (address & 0x00FF);
	hb = ((address >> 8) & 0x00FF);

	PORTB = lb;
	PORTA &= ~(0b00111111);
	PORTA |= (hb & 0b00111111);

	if(hb & 0b01000000) {
		PORTC |= (1 << 1);
	} else {
		PORTC &= ~(1 << 1);
	}
}

uint8_t read_address(uint16_t address)
{
	uint8_t val = 0;
	//static uint8_t lb, hb;
	static uint8_t delay;

	//lb = (address & 0x00FF);
	//hb = ((address >> 8) & 0x00FF);

	TRISD = 0xFF; // Set SET PORTD to all inputs

	set_ce(0);
	set_oe(0);
	set_address(address);
	//delay_100us();
	
	set_oe(1);
	//delay_100us();
	set_oe(0);

	val = PORTD;
	return val;
	
}

void write_address(uint16_t address, uint8_t val)
{
	TRISD = 0x00; // Set SET PORTD to all outputs
	set_ce(0);
	PORTE |= (1<<0);
	set_address(address);
	PORTD = val;
	set_oe(0);
	set_we(0);
	delay_100us();
	set_oe(1);
	set_we(1);
	PORTE &= ~(1<<0);
}

uint8_t got_line( void )
{
	static uint16_t address = 0;
	static uint8_t hb, lb, value;

	if(uart_input_buffer[0] == ':') { // We have a command
		switch(uart_input_buffer[1]) {
			case 'r':  // Read commad
				/**
				 * Command Example:
				 * Read to address 10
				 * :r000A\r\n
				 **/
				hex2int(uart_input_buffer[2],uart_input_buffer[3],&hb);
				hex2int(uart_input_buffer[4],uart_input_buffer[5],&lb);
				address = (uint16_t)(hb << 8) | lb;
				value = read_address(address);
				int2hex(value, &lb, &hb);
				uart_print_char(hb);
				uart_print_char(lb);
				//uart_print_char(value);
				uart_print_char('\r');
				uart_print_char('\n');

				break;
			case 'w': //Write command
				/**
				 * Command Example:
				 * Write 1 to address 10
				 * :w000A,01\r\n
				 **/
				hex2int(uart_input_buffer[2],uart_input_buffer[3],&hb);
				hex2int(uart_input_buffer[4],uart_input_buffer[5],&lb);
				address = (uint16_t)(hb << 8) | lb;
				hex2int(uart_input_buffer[7],uart_input_buffer[8],&value);
				write_address(address,value);
				break;
			case 't': //Test
				uart_print("ok\r\n");
				break;
			default:
				uart_print("er1");
				return 0;
		}
	}
	return 1;
}

void main(void)
{
	static uint8_t c;
	static uint8_t i = 0;

	//TRISC=TX_BIT|RX_BIT;	// These need to be 1 for USART to work
	//TRISC &= ~(1<<3);
	TRISC = 0b11000000;

	SPBRG=SPBRG_VALUE;	// Baud Rate register, calculated by macro
	BRGH=BAUD_HI;

	SYNC=0;			// Disable Synchronous/Enable Asynchronous
	SPEN=1;			// Enable serial port
	TXEN=1;			// Enable transmission mode
	CREN=1;			// Enable reception mode

	TRISA = 0b00000000; // Set PORTA outputs
	TRISB = 0x00; // Set PORTB to all outputs
	TRISD = 0xFF; // Set PORTD to all inputs

	TRISE &= ~(1<<0);


	OPTION_REG &= ~(1<<7);

	set_oe(1);
	set_ce(1);
	set_we(1);

	PORTC |= (1 << 2); // Set CE high

	uart_print("hi\r\n");


	while(1)
	{
		while(!RCIF);	// Wait until data recieved
		c=RCREG;
		if(c!='\n') {
			if(c=='\r')
				uart_input_buffer[i] = '\0';
			else
				uart_input_buffer[i] = c;
			i++;
			i%=16;
		} else {
			got_line();
			//uart_print(uart_input_buffer);
			i=0;
		}
	}
}
