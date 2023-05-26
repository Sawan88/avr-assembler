.DEVICE ATtiny2313A

; Configure PORTB and PORTD for output
SER r16
CLR r17
OUT 0x11, r16
OUT 0x17, r16

loop:
; blink diodes 0,2,4,6
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
    
; blink diodes 1,3,5,7
LDI r30, 0xfd
OUT 0x12, r30
LDI r31, 0xea
OUT 0x18, r31

Delay_2sec:
    LDI r20, 8
Delay4:
    LDI r21, 125
Delay5:
    LDI r22, 250
Delay6:
DEC r22
NOP
BRNE Delay6

DEC r21
BRNE Delay5

DEC r20
BRNE Delay4

NOP
RJMP loop
