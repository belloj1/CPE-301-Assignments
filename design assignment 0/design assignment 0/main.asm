;
; design assignment 0.asm
;
; Created: 2/15/2016 2:43:09 PM
; Author : Boba Fett
;


; Replace with your application code
start:
    ldi r16, 30		;stores the decimal value 30 into register 16
	ldi r17, 34		;stores the decimal value 34 into register 17
	add r16, r17	;adds r17 to r16 and stores value in r16 now equal to 62
	ldi r17, 45		;stores decimal value 45 into r17
	add r16, r17	;adds r17 to r16 and stores value in r16 now equal to 112
	brvs l1			;branch to l1 if overflow bit v in status register is high
	ldi r17, 42		;stores decimal value 42 into r17
	add r16, r17	;adds r17 to r16 and stores value in r16 now equal to 155
	brvs l1			;branch to l1 if overflow bit v in status register is high
	ldi r17, 50		;stores decimal value 50 into r17
	add r16, r17	;adds r17 to r16 and stores value in r16 now equal to 189
	brvs l1			;branch to l1 if overflow bit v in status register is high
	cbi portb,2		;clear bit in port b position 2
	rjmp l2			;If the sum produces an overflow set PORTB.2 pin = HIGH else PORTB.2 pin = LOW
	l1:
	sbi portb, 2	;sets port b pin 2 high
	rjmp l1			;keeps looping l1 to keep port b pin 2 high
	l2:	
	nop
	