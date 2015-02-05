EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:pic16f877a
LIBS:ftdi_conector
LIBS:eeprom_programer-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RAM_32KO U2
U 1 1 53FA7A21
P 6650 4800
F 0 "U2" H 6800 5700 70  0000 C CNN
F 1 "28256" H 6950 3700 60  0000 C CNN
F 2 "Sockets_DIP:DIP-28__600" H 6650 4800 60  0001 C CNN
F 3 "" H 6650 4800 60  0000 C CNN
	1    6650 4800
	1    0    0    -1  
$EndComp
$Comp
L pic16f877a U1
U 1 1 53FA7B47
P 2975 3400
F 0 "U1" H 2375 1100 60  0000 C CNN
F 1 "pic16f877a" H 2500 5450 60  0000 C CNN
F 2 "Sockets_DIP:DIP-40__600" H 2950 4350 60  0001 C CNN
F 3 "" H 2950 4350 60  0000 C CNN
	1    2975 3400
	1    0    0    -1  
$EndComp
$Comp
L FTDI_CONECTOR CN1
U 1 1 53FA7C19
P 6825 1750
F 0 "CN1" H 6900 1275 60  0000 C CNN
F 1 "FTDI_CONECTOR" H 6725 2175 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 6825 1750 60  0001 C CNN
F 3 "" H 6825 1750 60  0000 C CNN
	1    6825 1750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR01
U 1 1 53FA7C96
P 6375 1850
F 0 "#PWR01" H 6375 1940 20  0001 C CNN
F 1 "+5V" H 6375 1940 30  0000 C CNN
F 2 "" H 6375 1850 60  0000 C CNN
F 3 "" H 6375 1850 60  0000 C CNN
	1    6375 1850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR02
U 1 1 53FA7CAA
P 6375 2050
F 0 "#PWR02" H 6375 2050 30  0001 C CNN
F 1 "GND" H 6375 1980 30  0001 C CNN
F 2 "" H 6375 2050 60  0000 C CNN
F 3 "" H 6375 2050 60  0000 C CNN
	1    6375 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	6525 2050 6375 2050
Wire Wire Line
	6525 1850 6375 1850
Wire Wire Line
	6525 1625 6375 1625
Wire Wire Line
	6525 1750 6375 1750
Text GLabel 6375 1625 0    60   Input ~ 0
TX
Text GLabel 6375 1750 0    60   Input ~ 0
RX
Text GLabel 3925 4150 2    50   Input ~ 0
TX
Text GLabel 3925 4275 2    50   Input ~ 0
RX
$Comp
L GND #PWR03
U 1 1 53FA7D4C
P 1800 2300
F 0 "#PWR03" H 1800 2300 30  0001 C CNN
F 1 "GND" H 1800 2230 30  0001 C CNN
F 2 "" H 1800 2300 60  0000 C CNN
F 3 "" H 1800 2300 60  0000 C CNN
	1    1800 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 2300 1950 2300
Wire Wire Line
	1950 2450 1875 2450
Wire Wire Line
	1875 2450 1875 2300
Connection ~ 1875 2300
$Comp
L +5V #PWR04
U 1 1 53FA7D64
P 1800 1900
F 0 "#PWR04" H 1800 1990 20  0001 C CNN
F 1 "+5V" H 1800 1990 30  0000 C CNN
F 2 "" H 1800 1900 60  0000 C CNN
F 3 "" H 1800 1900 60  0000 C CNN
	1    1800 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 1900 1950 1900
Wire Wire Line
	1950 2050 1875 2050
Wire Wire Line
	1875 2050 1875 1900
Connection ~ 1875 1900
$Comp
L SW_PUSH SW1
U 1 1 53FA7D86
P 2250 1000
F 0 "SW1" H 2400 1110 50  0000 C CNN
F 1 "SW_PUSH" H 2250 920 50  0000 C CNN
F 2 "Puch_button_TH:Puch_button_TH" H 2250 1000 60  0001 C CNN
F 3 "" H 2250 1000 60  0000 C CNN
	1    2250 1000
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 53FA7D9A
P 1500 1550
F 0 "R1" V 1580 1550 40  0000 C CNN
F 1 "10K" V 1507 1551 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 1430 1550 30  0001 C CNN
F 3 "" H 1500 1550 30  0000 C CNN
	1    1500 1550
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR05
U 1 1 53FA7DAC
P 1100 1550
F 0 "#PWR05" H 1100 1640 20  0001 C CNN
F 1 "+5V" H 1100 1640 30  0000 C CNN
F 2 "" H 1100 1550 60  0000 C CNN
F 3 "" H 1100 1550 60  0000 C CNN
	1    1100 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 1000 2725 1000
Wire Wire Line
	1750 1550 1950 1550
Wire Wire Line
	1850 1550 1850 1000
Wire Wire Line
	1850 1000 1950 1000
Connection ~ 1850 1550
Wire Wire Line
	1250 1550 1100 1550
$Comp
L CRYSTAL X1
U 1 1 53FA7E0E
P 1550 2850
F 0 "X1" H 1550 3000 60  0000 C CNN
F 1 "20Mhz" H 1550 2700 60  0000 C CNN
F 2 "Crystals:Crystal_HC50-U_Vertical" H 1550 2850 60  0001 C CNN
F 3 "" H 1550 2850 60  0000 C CNN
	1    1550 2850
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 53FA7E22
P 1075 2550
F 0 "C1" H 1075 2650 40  0000 L CNN
F 1 "22p" H 1081 2465 40  0000 L CNN
F 2 "Discret:C2" H 1113 2400 30  0001 C CNN
F 3 "" H 1075 2550 60  0000 C CNN
	1    1075 2550
	0    1    1    0   
$EndComp
$Comp
L C C2
U 1 1 53FA7E34
P 1075 3150
F 0 "C2" H 1075 3250 40  0000 L CNN
F 1 "22p" H 1081 3065 40  0000 L CNN
F 2 "Discret:C2" H 1113 3000 30  0001 C CNN
F 3 "" H 1075 3150 60  0000 C CNN
	1    1075 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	875  2550 775  2550
Wire Wire Line
	775  2550 775  3150
Wire Wire Line
	775  3150 875  3150
Wire Wire Line
	1275 3150 1750 3150
Wire Wire Line
	1275 2550 1750 2550
Wire Wire Line
	1750 2550 1750 2725
Wire Wire Line
	1750 2725 1950 2725
Connection ~ 1550 2550
Wire Wire Line
	1750 3150 1750 2925
Wire Wire Line
	1750 2925 1950 2925
Connection ~ 1550 3150
Wire Wire Line
	5950 4000 5800 4000
Wire Wire Line
	5950 4100 5800 4100
Wire Wire Line
	5950 4200 5800 4200
Wire Wire Line
	5950 4300 5800 4300
Wire Wire Line
	5950 4400 5800 4400
Wire Wire Line
	5950 4500 5800 4500
Wire Wire Line
	5950 4600 5800 4600
Wire Wire Line
	5950 4700 5800 4700
Wire Wire Line
	5950 4800 5800 4800
Wire Wire Line
	5950 4900 5800 4900
Wire Wire Line
	5950 5000 5800 5000
Wire Wire Line
	5950 5100 5800 5100
Wire Wire Line
	5950 5200 5800 5200
Wire Wire Line
	5950 5300 5800 5300
Wire Wire Line
	5950 5400 5800 5400
Wire Wire Line
	5950 5600 5800 5600
Wire Wire Line
	5950 5700 5800 5700
Wire Wire Line
	5950 5800 5800 5800
Wire Wire Line
	7350 4000 7500 4000
Wire Wire Line
	7350 4100 7500 4100
Wire Wire Line
	7350 4200 7500 4200
Wire Wire Line
	7350 4300 7500 4300
Wire Wire Line
	7350 4400 7500 4400
Wire Wire Line
	7350 4500 7500 4500
Wire Wire Line
	7350 4600 7500 4600
Wire Wire Line
	7350 4700 7500 4700
$Comp
L +5V #PWR06
U 1 1 53FA8456
P 6650 3825
F 0 "#PWR06" H 6650 3915 20  0001 C CNN
F 1 "+5V" H 6650 3915 30  0000 C CNN
F 2 "" H 6650 3825 60  0000 C CNN
F 3 "" H 6650 3825 60  0000 C CNN
	1    6650 3825
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 53FA8461
P 6650 6000
F 0 "#PWR07" H 6650 6000 30  0001 C CNN
F 1 "GND" H 6650 5930 30  0001 C CNN
F 2 "" H 6650 6000 60  0000 C CNN
F 3 "" H 6650 6000 60  0000 C CNN
	1    6650 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 5850 6650 6000
Wire Wire Line
	6650 3950 6650 3825
Text GLabel 5800 4000 0    50   Input ~ 0
A0
Text GLabel 5800 4100 0    50   Input ~ 0
A1
Text GLabel 5800 4200 0    50   Input ~ 0
A2
Text GLabel 5800 4300 0    50   Input ~ 0
A3
Text GLabel 5800 4400 0    50   Input ~ 0
A4
Text GLabel 5800 4500 0    50   Input ~ 0
A5
Text GLabel 5800 4600 0    50   Input ~ 0
A6
Text GLabel 5800 4700 0    50   Input ~ 0
A7
Text GLabel 5800 4800 0    50   Input ~ 0
A8
Text GLabel 5800 4900 0    50   Input ~ 0
A9
Text GLabel 5800 5000 0    50   Input ~ 0
A10
Text GLabel 5800 5100 0    50   Input ~ 0
A11
Text GLabel 5800 5200 0    50   Input ~ 0
A12
Text GLabel 5800 5300 0    50   Input ~ 0
A13
Text GLabel 5800 5400 0    50   Input ~ 0
A14
Text GLabel 5800 5600 0    50   Input ~ 0
CE
Text GLabel 5800 5700 0    50   Input ~ 0
OE
Text GLabel 5800 5800 0    50   Input ~ 0
WE
Text GLabel 7500 4000 2    50   Input ~ 0
D0
Text GLabel 7500 4100 2    50   Input ~ 0
D1
Text GLabel 7500 4200 2    50   Input ~ 0
D2
Text GLabel 7500 4300 2    50   Input ~ 0
D3
Text GLabel 7500 4400 2    50   Input ~ 0
D4
Text GLabel 7500 4500 2    50   Input ~ 0
D5
Text GLabel 7500 4600 2    50   Input ~ 0
D6
Text GLabel 7500 4700 2    50   Input ~ 0
D7
Text GLabel 3925 4450 2    50   Input ~ 0
D0
Text GLabel 3925 4575 2    50   Input ~ 0
D1
Text GLabel 3925 4700 2    50   Input ~ 0
D2
Text GLabel 3925 4825 2    50   Input ~ 0
D3
Text GLabel 3925 4950 2    50   Input ~ 0
D4
Text GLabel 3925 5075 2    50   Input ~ 0
D5
Text GLabel 3925 5200 2    50   Input ~ 0
D6
Text GLabel 3925 5325 2    50   Input ~ 0
D7
Text GLabel 3925 2350 2    50   Input ~ 0
A0
Text GLabel 3925 2475 2    50   Input ~ 0
A1
Text GLabel 3925 2600 2    50   Input ~ 0
A2
Text GLabel 3925 2725 2    50   Input ~ 0
A3
Text GLabel 3925 2850 2    50   Input ~ 0
A4
Text GLabel 3925 2975 2    50   Input ~ 0
A5
Text GLabel 3925 3100 2    50   Input ~ 0
A6
Text GLabel 3925 3225 2    50   Input ~ 0
A7
Text GLabel 3925 1550 2    50   Input ~ 0
A8
Text GLabel 3925 1675 2    50   Input ~ 0
A9
Text GLabel 3925 1800 2    50   Input ~ 0
A10
Text GLabel 3925 1925 2    50   Input ~ 0
A11
Text GLabel 4400 2050 2    50   Input ~ 0
A12
Text GLabel 3925 2175 2    50   Input ~ 0
A13
Text GLabel 3925 3525 2    50   Input ~ 0
A14
Text GLabel 3925 3775 2    50   Input ~ 0
OE
Text GLabel 3925 3650 2    50   Input ~ 0
CE
Text GLabel 3925 3900 2    50   Input ~ 0
WE
$Comp
L LED D1
U 1 1 53FA87EC
P 4625 6175
F 0 "D1" H 4625 6275 50  0000 C CNN
F 1 "LED" H 4625 6075 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 4625 6175 60  0001 C CNN
F 3 "" H 4625 6175 60  0000 C CNN
	1    4625 6175
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 53FA87FE
P 4375 5475
F 0 "R2" V 4455 5475 40  0000 C CNN
F 1 "1K" V 4382 5476 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4305 5475 30  0001 C CNN
F 3 "" H 4375 5475 30  0000 C CNN
	1    4375 5475
	0    1    1    0   
$EndComp
Wire Wire Line
	4625 5475 4625 5975
Wire Wire Line
	3925 5475 4125 5475
$Comp
L GND #PWR08
U 1 1 53FA88C3
P 4625 6550
F 0 "#PWR08" H 4625 6550 30  0001 C CNN
F 1 "GND" H 4625 6480 30  0001 C CNN
F 2 "" H 4625 6550 60  0000 C CNN
F 3 "" H 4625 6550 60  0000 C CNN
	1    4625 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 6375 4625 6550
$Comp
L CP1 C3
U 1 1 53FA89CF
P 8950 1725
F 0 "C3" H 9000 1825 50  0000 L CNN
F 1 "470uf" H 9000 1625 50  0000 L CNN
F 2 "Capacitors_Elko_ThroughHole:Elko_vert_DM8_RM3-5" H 8950 1725 60  0001 C CNN
F 3 "" H 8950 1725 60  0000 C CNN
	1    8950 1725
	1    0    0    -1  
$EndComp
$Comp
L CP1 C4
U 1 1 53FA89E1
P 9450 1725
F 0 "C4" H 9500 1825 50  0000 L CNN
F 1 "4.7uf" H 9500 1625 50  0000 L CNN
F 2 "Capacitors_Elko_ThroughHole:Elko_vert_DM5_RM2_CopperClear" H 9450 1725 60  0001 C CNN
F 3 "" H 9450 1725 60  0000 C CNN
	1    9450 1725
	1    0    0    -1  
$EndComp
$Comp
L CP1 C5
U 1 1 53FA89EC
P 9875 1725
F 0 "C5" H 9925 1825 50  0000 L CNN
F 1 "4.7uf" H 9925 1625 50  0000 L CNN
F 2 "Capacitors_Elko_ThroughHole:Elko_vert_DM5_RM2_CopperClear" H 9875 1725 60  0001 C CNN
F 3 "" H 9875 1725 60  0000 C CNN
	1    9875 1725
	1    0    0    -1  
$EndComp
$Comp
L CP1 C6
U 1 1 53FA89F7
P 10275 1725
F 0 "C6" H 10325 1825 50  0000 L CNN
F 1 "4.7uf" H 10325 1625 50  0000 L CNN
F 2 "Capacitors_Elko_ThroughHole:Elko_vert_DM5_RM2_CopperClear" H 10275 1725 60  0001 C CNN
F 3 "" H 10275 1725 60  0000 C CNN
	1    10275 1725
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 1925 10275 1925
Connection ~ 9450 1925
Connection ~ 9875 1925
Wire Wire Line
	8950 1525 10275 1525
Connection ~ 9450 1525
Connection ~ 9875 1525
Wire Wire Line
	9650 1525 9650 1250
Connection ~ 9650 1525
Wire Wire Line
	9650 1925 9650 2200
Connection ~ 9650 1925
$Comp
L GND #PWR09
U 1 1 53FA8C2C
P 9650 2200
F 0 "#PWR09" H 9650 2200 30  0001 C CNN
F 1 "GND" H 9650 2130 30  0001 C CNN
F 2 "" H 9650 2200 60  0000 C CNN
F 3 "" H 9650 2200 60  0000 C CNN
	1    9650 2200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 53FA8C37
P 9650 1250
F 0 "#PWR010" H 9650 1340 20  0001 C CNN
F 1 "+5V" H 9650 1340 30  0000 C CNN
F 2 "" H 9650 1250 60  0000 C CNN
F 3 "" H 9650 1250 60  0000 C CNN
	1    9650 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 53FA8FBC
P 2725 1000
F 0 "#PWR011" H 2725 1000 30  0001 C CNN
F 1 "GND" H 2725 930 30  0001 C CNN
F 2 "" H 2725 1000 60  0000 C CNN
F 3 "" H 2725 1000 60  0000 C CNN
	1    2725 1000
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR012
U 1 1 53FA918E
P 625 2825
F 0 "#PWR012" H 625 2825 30  0001 C CNN
F 1 "GND" H 625 2755 30  0001 C CNN
F 2 "" H 625 2825 60  0000 C CNN
F 3 "" H 625 2825 60  0000 C CNN
	1    625  2825
	0    1    1    0   
$EndComp
Wire Wire Line
	625  2825 775  2825
Connection ~ 775  2825
Wire Wire Line
	3925 2050 4400 2050
Wire Wire Line
	4275 2050 4275 2200
Connection ~ 4275 2050
$Comp
L R R3
U 1 1 53FB51E6
P 4275 2450
F 0 "R3" V 4355 2450 40  0000 C CNN
F 1 "1K" V 4282 2451 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4205 2450 30  0001 C CNN
F 3 "" H 4275 2450 30  0000 C CNN
	1    4275 2450
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR013
U 1 1 53FB51F1
P 4275 2825
F 0 "#PWR013" H 4275 2915 20  0001 C CNN
F 1 "+5V" H 4275 2915 30  0000 C CNN
F 2 "" H 4275 2825 60  0000 C CNN
F 3 "" H 4275 2825 60  0000 C CNN
	1    4275 2825
	-1   0    0    1   
$EndComp
Wire Wire Line
	4275 2700 4275 2825
$EndSCHEMATC
