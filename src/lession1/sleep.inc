sleep:

PUSH r21
PUSH r22
PUSH r23
PUSH r26
PUSH r27
PUSH r30
PUSH r31

IN r30, 0x3d
CLR r31

LDD r26, Z+10
LDD r27, Z+11

	MOV		r21,	r26		; One clock cycle;
sleep_1:
	MOV		r22,	r27		; One clock cycle;
sleep_2:
	LDI		r23,	250		; One clock cycle;
sleep_3:
	DEC		r23					; One clock cycle;
	NOP							; One clock cycle;
	BRNE	sleep_3				; Two clock cycles when jumping to sleep_3, 1 clock when continuing to DEC;

	DEC		r22					; One clock cycle;
	BRNE	sleep_2				; Two clock cycles when jumping to sleep_2, 1 clock when continuing to DEC;

	DEC		r21					; One clock cycle;
	BRNE	sleep_1				; Two clock cycles when jumping to Delay1, 1 clock when continuing to RET;

LDD r21, Z+8
STD Z+10, r21
LDD r21, Z+9
STD Z+11, r21
LDD r21, Z+7
STD Z+9, r21


POP r31
POP r30
POP r27
POP r26
POP r23
POP r22
POP r21
POP r21
POP r21

RET
