sleep:

POP r24 	; rcall sleep
POP r25		; 0
POP r26		; 2
POP r27		; 125

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
	
	push r27
	push r26
	push r25
	push r24
		RET
