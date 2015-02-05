/**
 * eeprom_program
 *
 * Small tool to program data into an eeprom like the 28C256
 * using the a programmer bassed araound the 16F877A
 *
 * Required arguments are the input binary file and the output
 * serial port
 * ex: eeprom_program -p /dev/ttyUSB0 -i messymonitor.rom
 */

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <stdint.h>
#include <getopt.h>
#include <time.h> 

int tty_fd;
uint8_t remote_pending = 0;

int uart_init(unsigned char *device)
{
		struct termios tio;
		struct termios stdio;

		memset(&tio,0,sizeof(tio));
		tio.c_iflag=0;
		tio.c_oflag=0;
		// 8n1, see termios.h for more information
		tio.c_cflag=CS8|CREAD|CLOCAL;
		tio.c_lflag=0;
		tio.c_cc[VMIN]=1;
		tio.c_cc[VTIME]=5;

		tty_fd=open(device, O_RDWR | O_NONBLOCK);
		// 115200 baud
		cfsetospeed(&tio,B9600);            
		cfsetispeed(&tio,B9600);

		tcsetattr(tty_fd,TCSANOW,&tio);
		return 0;
}

int uart_close() {
		close(tty_fd);
		return 0;
}

int uart_read(unsigned char *s)
{
		unsigned char c;
		int count = 0;
		while (read(tty_fd,&c,1)>0) {
				s[count] = c;
				count++;
		}
		return count;
}

int uart_write(uint8_t *s, uint8_t size)
{
		return write(tty_fd,s,size);
}

int uart_write_string(uint8_t *s)
{
	return write(tty_fd,s,strlen(s));
}

int main(int argc,char** argv)
{
	unsigned char s[1024];
	int size, i;
	uint8_t line[1000];
	uint8_t line_index = 0;

	int c;
	int aflag = 0;
	int bflag = 0;
	char *input_filename = NULL;
	char *serial_port = NULL;

	FILE *input_file;
	uint64_t file_length;

	uint8_t *input_file_buffer;

	int test_nbr_args = 0;

	while ((c = getopt (argc, argv, "i:p:")) != -1) {
		switch (c)
		{
			case 'i':
				input_filename = optarg;
				test_nbr_args++;
				printf("%s\n", input_filename);
			break;
			case 'p':
				serial_port = optarg;
				test_nbr_args++;
				printf("%s\n", serial_port);
			break;
			case '?':
				if ( (optopt == 'i') || (optopt == 'p'))
					fprintf (stderr, "Option -%c requires an argument.\n", optopt);
				else if (isprint (optopt))
					fprintf (stderr, "Unknown option `-%c'.\n", optopt);
				else
					fprintf (stderr, "Unknown option character `\\x%x'.\n", optopt);
					return 1;
			default:
				abort ();
		}
	}

	if(test_nbr_args != 2) {
		printf("Usage: eeprom_program -i inputfile.bin -s /dev/ttyUSB0\n");
		return 1;
	}

	input_file = fopen(input_filename,"rb");
	if (!input_file)
	{
		printf("Unable to open file %s", input_filename);
		return 1;
	}
	
	//Get file length
	fseek(input_file, 0, SEEK_END);
	file_length=ftell(input_file);
	fseek(input_file, 0, SEEK_SET);
	input_file_buffer=(uint8_t *)malloc(file_length+1);

	fread(input_file_buffer, file_length, 1, input_file);
	fclose( input_file );

	for(i=0;i!=file_length;i++) {
		printf("%02X ", input_file_buffer[i]);
	}
	printf("\n");

	uart_init(serial_port);
	do {
		uart_write_string(":t\r\n");
		printf("Sent t:\n");
		sleep(1);
		size = uart_read(s);
		if (size>0) {
			for(i=0;i!=size;++i) {
				switch(s[i]) {
					case '\r': 
						line[line_index++] = '\0'; 
						break;
					case '\n':  
						line_index = 0;
						break;
					default :
						line[line_index++] = s[i];
						break;
				}
			}
			printf("%s\n", line);
		}
	}  while (strcmp("ok", line) != 0);
	// We are now in sync

	
	for(i=0;i!=file_length;++i) {
		//printf("%02X ", input_file_buffer[i]);
		uint16_t address = i;
		uint8_t data = input_file_buffer[i];
		sprintf(s,":w%02X%02X,%02X\r\n", (uint8_t)(address >> 8), (uint8_t)(address), data );
		printf("%s", s);
		uart_write_string(s);
		usleep(10000);
	}

	printf("closing\n");
	uart_close();
	usleep(1000000);
	return EXIT_SUCCESS;
}
