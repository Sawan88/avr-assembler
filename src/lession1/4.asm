.DEVICE ATtiny2313A

; Config PORTB and PORTD for output
SER r16 ; set 0xff
OUT $11,r16
OUT $17,r16 

LDI r19, 0x00
RCALL EEPROM_read
MOV r4, r20

LDI r19, 0x01
RCALL EEPROM_read
MOV r5, r20

LDI r19, 0x02

loop:
RCALL EEPROM_read

SER r30
SER r31

ROL r20
BRCC next_0
CBR r30, 0x1
next_0:

ROL r20
BRCC next_1
CBR r30, 0x2
next_1:

ROL r20
BRCC next_2
CBR r30, 0x4
next_2:

ROL r20
BRCC next_3
CBR r30, 0x8
next_3:

ROL r20
BRCC next_4
CBR r30, 0x10
next_4:

ROL r20
BRCC next_5
CBR r31, 0x1
next_5:

ROL r20
BRCC next_6
CBR r31, 0x2
next_6:

ROL r20
BRCC next_7
CBR r31, 0x4
next_7:

RCALL set_and_sleepdyn

INC r19
CPI r19, 128
BRNE loop
LDI r19, 0x02

RJMP loop

#include "common.inc"

