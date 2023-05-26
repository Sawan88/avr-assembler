.DEVICE ATtiny2313A

; Configure controler
SER r16
CLR r17
OUT 0x11, r16
OUT 0x17, r16

loop:

; turn on
LDI r30, 0xfa
OUT 0x12, r30
LDI r31, 0xf5
OUT 0x18, r31

Delay_1sec:
    LDI r20, 8
Delay1:
    LDI r21, 125
Delay2:
    LDI r22, 250
Delay3:
DEC r22
NOP
BRNE Delay3

DEC r21
BRNE Delay2

DEC r20
BRNE Delay1
    
;turn off
LDI r30, 0xfd
OUT 0x12, r30
LDI r31, 0xea
OUT 0x18, r31

Delay_2sec:
    LDI r23, 8
Delay4:
    LDI r24, 125
Delay5:
    LDI r25, 250
Delay6:
DEC r25
NOP
BRNE Delay6

DEC r24
BRNE Delay5

DEC r23
BRNE Delay4

;LDI r16, 0xfc
;OUT 0x12, r16

NOP
RJMP loop
;avrdude -p t2313 -c usbasp -U flash:w:1.hex:i
