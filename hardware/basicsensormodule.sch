EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 6050 4000 1350 1250
U 5AABFC1B
F0 "CANBUS" 60
F1 "canbus.sch" 60
F2 "SI" I L 6050 4300 60 
F3 "SO" O L 6050 4200 60 
F4 "CS" I L 6050 4400 60 
F5 "SCK" I L 6050 4100 60 
F6 "INT" O L 6050 4500 60 
F7 "GND" O R 7400 4150 60 
F8 "VCC" I R 7400 4050 60 
F9 "CAN_H" B R 7400 4250 60 
F10 "CAN_L" B R 7400 4350 60 
$EndSheet
$Sheet
S 4350 3600 1150 1150
U 5AACA401
F0 "MCU" 60
F1 "atmega328p.sch" 60
F2 "SPI_MISO" I R 5500 4200 60 
F3 "SPI_MOSI" O R 5500 4300 60 
F4 "MCP_INT" I R 5500 4500 60 
F5 "VCC" I L 4350 3900 60 
F6 "GND" O L 4350 4100 60 
F7 "SPI_SCK" O R 5500 4100 50 
F8 "MCP_SS" O R 5500 4400 50 
F9 "PD2" O L 4350 4350 50 
F10 "PD3" O L 4350 4425 50 
F11 "ADC0" I L 4350 4500 50 
F12 "ADC1" I L 4350 4575 50 
F13 "ADC2" I L 4350 4650 50 
$EndSheet
$Sheet
S 7750 2950 1050 500 
U 5AACFFEF
F0 "POWER SUPPLY" 60
F1 "supplies.sch" 60
F2 "GND" O R 8800 3250 60 
F3 "+5V_OUT" O L 7750 3250 60 
F4 "+18V_IN" I R 8800 3150 60 
F5 "+18V_OUT" I L 7750 3150 60 
$EndSheet
$Sheet
S 9400 3100 600  450 
U 5AAD16DD
F0 "CANBUS CONN" 60
F1 "canbus_connector.sch" 60
F2 "CAN_H" B L 9400 3350 60 
F3 "CAN_L" B L 9400 3450 60 
F4 "CAN_18V" O L 9400 3150 60 
F5 "CAN_GND" B L 9400 3250 60 
$EndSheet
Wire Wire Line
	6050 4500 5500 4500
Wire Wire Line
	6050 4400 5500 4400
Wire Wire Line
	6050 4200 5500 4200
Wire Wire Line
	6050 4100 5500 4100
Wire Wire Line
	5500 4300 6050 4300
Text Label 5650 4300 0    60   ~ 0
MOSI
Text Label 5650 4200 0    60   ~ 0
MISO
Text Label 5650 4100 0    60   ~ 0
SCK
Wire Wire Line
	8800 3250 9000 3250
Wire Wire Line
	9400 3350 9100 3350
Wire Wire Line
	9100 3350 9100 4250
Wire Wire Line
	9100 4250 7400 4250
Wire Wire Line
	7400 4350 9200 4350
Wire Wire Line
	9200 4350 9200 3450
Wire Wire Line
	9200 3450 9400 3450
Wire Wire Line
	9000 3250 9000 4150
Wire Wire Line
	9000 4150 7600 4150
Connection ~ 9000 3250
Wire Wire Line
	7750 3250 7550 3250
Wire Wire Line
	7550 3250 7550 3800
Wire Wire Line
	7550 4050 7400 4050
Wire Wire Line
	7600 4150 7600 4550
Connection ~ 7600 4150
Wire Wire Line
	7600 4150 7400 4150
Wire Wire Line
	7400 3700 7400 3800
Wire Wire Line
	7400 3800 7550 3800
Connection ~ 7550 3800
Wire Wire Line
	7550 3800 7550 4050
$Comp
L basicsensormodule-rescue:MountingHole-Mechanical H104
U 1 1 5BE9AF15
P 1250 5625
F 0 "H104" H 1350 5675 50  0000 L CNN
F 1 "MountingHole" H 1350 5625 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1250 5625 50  0001 C CNN
F 3 "~" H 1250 5625 50  0001 C CNN
	1    1250 5625
	1    0    0    -1  
$EndComp
$Comp
L basicsensormodule-rescue:MountingHole-Mechanical H103
U 1 1 5BE9BC53
P 1250 5425
F 0 "H103" H 1350 5475 50  0000 L CNN
F 1 "MountingHole" H 1350 5425 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1250 5425 50  0001 C CNN
F 3 "~" H 1250 5425 50  0001 C CNN
	1    1250 5425
	1    0    0    -1  
$EndComp
$Comp
L basicsensormodule-rescue:MountingHole-Mechanical H102
U 1 1 5BE9BC79
P 1250 5225
F 0 "H102" H 1350 5275 50  0000 L CNN
F 1 "MountingHole" H 1350 5225 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1250 5225 50  0001 C CNN
F 3 "~" H 1250 5225 50  0001 C CNN
	1    1250 5225
	1    0    0    -1  
$EndComp
$Comp
L basicsensormodule-rescue:MountingHole-Mechanical H101
U 1 1 5BE9BC9F
P 1250 5025
F 0 "H101" H 1350 5075 50  0000 L CNN
F 1 "MountingHole" H 1350 5025 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1250 5025 50  0001 C CNN
F 3 "~" H 1250 5025 50  0001 C CNN
	1    1250 5025
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3250 9400 3250
$Comp
L power:GND #PWR0103
U 1 1 5BE8F87F
P 7600 4550
F 0 "#PWR0103" H 7600 4300 50  0001 C CNN
F 1 "GND" H 7650 4350 50  0000 C CNN
F 2 "" H 7600 4550 50  0001 C CNN
F 3 "" H 7600 4550 50  0001 C CNN
	1    7600 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5BE8FCAE
P 7400 3700
F 0 "#PWR0105" H 7400 3550 50  0001 C CNN
F 1 "+5V" H 7450 3900 50  0000 C CNN
F 2 "" H 7400 3700 50  0001 C CNN
F 3 "" H 7400 3700 50  0001 C CNN
	1    7400 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5CB14A9F
P 4175 3875
F 0 "#PWR0102" H 4175 3725 50  0001 C CNN
F 1 "+5V" H 4225 4075 50  0000 C CNN
F 2 "" H 4175 3875 50  0001 C CNN
F 3 "" H 4175 3875 50  0001 C CNN
	1    4175 3875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5CB14AC2
P 4225 4100
F 0 "#PWR0106" H 4225 3850 50  0001 C CNN
F 1 "GND" H 4275 3950 50  0000 C CNN
F 2 "" H 4225 4100 50  0001 C CNN
F 3 "" H 4225 4100 50  0001 C CNN
	1    4225 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4225 4100 4350 4100
Wire Wire Line
	4350 3900 4175 3900
Wire Wire Line
	4175 3900 4175 3875
Wire Wire Line
	4350 4350 4025 4350
Wire Wire Line
	4350 4425 4025 4425
Wire Wire Line
	4350 4500 4025 4500
Wire Wire Line
	4350 4575 4025 4575
Wire Wire Line
	4350 4650 4025 4650
Wire Wire Line
	3000 5125 3225 5125
Wire Wire Line
	3000 5175 3225 5175
Wire Wire Line
	3000 5225 3225 5225
Text Label 4025 4500 0    50   ~ 0
ADC0
Text Label 4025 4575 0    50   ~ 0
ADC1
Text Label 4025 4650 0    50   ~ 0
ADC2
Text Label 3225 5125 2    39   ~ 0
ADC0
Text Label 3225 5175 2    39   ~ 0
ADC1
Text Label 3225 5225 2    39   ~ 0
ADC2
$Comp
L power:GND #PWR0101
U 1 1 5E2BFE73
P 3200 5425
F 0 "#PWR0101" H 3200 5175 50  0001 C CNN
F 1 "GND" H 3205 5252 50  0000 C CNN
F 2 "" H 3200 5425 50  0001 C CNN
F 3 "" H 3200 5425 50  0001 C CNN
	1    3200 5425
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5425 3200 5425
$Comp
L power:GND #PWR0104
U 1 1 5E2C105B
P 3350 4950
F 0 "#PWR0104" H 3350 4700 50  0001 C CNN
F 1 "GND" H 3355 4777 50  0000 C CNN
F 2 "" H 3350 4950 50  0001 C CNN
F 3 "" H 3350 4950 50  0001 C CNN
	1    3350 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4925 3350 4925
Wire Wire Line
	3350 4925 3350 4950
$Comp
L power:GND #PWR0108
U 1 1 5E2C222B
P 3300 4725
F 0 "#PWR0108" H 3300 4475 50  0001 C CNN
F 1 "GND" H 3305 4552 50  0000 C CNN
F 2 "" H 3300 4725 50  0001 C CNN
F 3 "" H 3300 4725 50  0001 C CNN
	1    3300 4725
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4725 3300 4725
$Comp
L power:GND #PWR0109
U 1 1 5E2C32F5
P 3200 4525
F 0 "#PWR0109" H 3200 4275 50  0001 C CNN
F 1 "GND" H 3205 4352 50  0000 C CNN
F 2 "" H 3200 4525 50  0001 C CNN
F 3 "" H 3200 4525 50  0001 C CNN
	1    3200 4525
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4525 3000 4525
$Comp
L power:GND #PWR0110
U 1 1 5E2C5054
P 3150 4275
F 0 "#PWR0110" H 3150 4025 50  0001 C CNN
F 1 "GND" H 3155 4102 50  0000 C CNN
F 2 "" H 3150 4275 50  0001 C CNN
F 3 "" H 3150 4275 50  0001 C CNN
	1    3150 4275
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4275 3150 4275
$Comp
L ZCS:ZCS U1
U 1 1 5E2A8757
P 2650 3325
F 0 "U1" H 2783 3490 50  0000 C CNN
F 1 "ZCS" H 2783 3399 50  0000 C CNN
F 2 "KicadZeniteSolarLibrary18:ZCS18" H 2650 3325 50  0001 C CNN
F 3 "" H 2650 3325 50  0001 C CNN
	1    2650 3325
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5E2C63ED
P 3100 3725
F 0 "#PWR0111" H 3100 3475 50  0001 C CNN
F 1 "GND" H 3105 3552 50  0000 C CNN
F 2 "" H 3100 3725 50  0001 C CNN
F 3 "" H 3100 3725 50  0001 C CNN
	1    3100 3725
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3725 3000 3725
Wire Wire Line
	3000 3725 3000 3675
Connection ~ 3000 3725
Connection ~ 3000 3675
Wire Wire Line
	3000 3675 3000 3625
Wire Wire Line
	3000 3625 3100 3625
Wire Wire Line
	3100 3625 3100 3525
Wire Wire Line
	3100 3525 3000 3525
Connection ~ 3000 3625
Wire Wire Line
	3000 3425 3000 3475
Connection ~ 3000 3525
Connection ~ 3000 3475
Wire Wire Line
	3000 3475 3000 3525
$Comp
L power:+5V #PWR0112
U 1 1 5E2CA718
P 3225 3550
F 0 "#PWR0112" H 3225 3400 50  0001 C CNN
F 1 "+5V" H 3275 3750 50  0000 C CNN
F 2 "" H 3225 3550 50  0001 C CNN
F 3 "" H 3225 3550 50  0001 C CNN
	1    3225 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3225 3575 3225 3550
Wire Wire Line
	3000 3575 3225 3575
$Comp
L power:VCC #PWR0113
U 1 1 5E2CC152
P 7400 2875
F 0 "#PWR0113" H 7400 2725 50  0001 C CNN
F 1 "VCC" H 7417 3048 50  0000 C CNN
F 2 "" H 7400 2875 50  0001 C CNN
F 3 "" H 7400 2875 50  0001 C CNN
	1    7400 2875
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3150 9400 3150
Wire Wire Line
	7400 3150 7750 3150
Wire Wire Line
	7400 2875 7400 3150
$Comp
L power:VCC #PWR0114
U 1 1 5E2CF1D4
P 3100 3300
F 0 "#PWR0114" H 3100 3150 50  0001 C CNN
F 1 "VCC" H 3117 3473 50  0000 C CNN
F 2 "" H 3100 3300 50  0001 C CNN
F 3 "" H 3100 3300 50  0001 C CNN
	1    3100 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3300 3100 3375
Wire Wire Line
	3100 3375 3000 3375
Text Label 4025 4350 0    50   ~ 0
PD2
Text Label 4025 4425 0    50   ~ 0
PD3
Text Label 3275 3825 0    50   ~ 0
PD2
Wire Wire Line
	3275 3825 3000 3825
Text Label 3425 3875 0    50   ~ 0
PD3
Wire Wire Line
	3425 3875 3000 3875
NoConn ~ 3000 3925
NoConn ~ 3000 3975
NoConn ~ 3000 4025
NoConn ~ 3000 4075
NoConn ~ 3000 4125
NoConn ~ 3000 4175
NoConn ~ 3000 4225
NoConn ~ 3000 4375
NoConn ~ 3000 4425
NoConn ~ 3000 4475
NoConn ~ 3000 4625
NoConn ~ 3000 4675
NoConn ~ 3000 4825
NoConn ~ 3000 4875
NoConn ~ 3000 5025
NoConn ~ 3000 5075
NoConn ~ 3000 5275
NoConn ~ 3000 5325
NoConn ~ 3000 5375
Text Notes 950  6350 0    394  ~ 79
WARNING: PWM PIN NO CONECTED\n
$EndSCHEMATC
