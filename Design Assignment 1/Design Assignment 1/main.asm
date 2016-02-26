;
; Design Assignment 1.asm
;
; Created: 2/25/2016 9:31:14 PM
; Author : Boba Fett
;


; Replace with your application code
start:						;Beginning of task A
   ldi r16, high(RAMEND)	;loading high byte of Ramend pointer to r16
   ldi r17, low(RAMEND)		;loading low byte of ramend pointer to r17
   lsr r16					;Shift r16 right loading LSB value to C in status register
   ror r17					;Shift r17 right loding value in C register to MSB in r17 This completes 2 byte division by 2
   mov zh, r16				;Copy value in r16 to high portion of Z register
   mov zl, r17				;Copy value in r17 to low portion of Z register
   ldi r18, 25				;load value of 25 to r18
  
   store25:					;label to begin loop to store 25 values in SRAM
   st z+, r17				;post increment Z after storing value in r17 to SRAM at pointer Z
   mov r17, zl				;put incremented value of Z low to r17
   subi r18, 1				;subtract 1 from r18
   cpi r18, 0				;compare value in r18 to 0
   brne store25				;branch to store25 if r18 is not equal to 0
							;End of Task A
  
;Beginning of Task B						 
   mov yh, zh				;copy contents of z high to y high to leave z unchanged
   mov yl, zl				;copy contents of z low to y low to leave z unchanged
   ldi r18, 25				;loading r18 with 25 to use as loop counter
  
   sram_for_7:				;loop to cycle y pointer to go through SRAM locations
   ld r25, -y				;pre decrement y to propery cycle through stack and load value of contents into r25
   mov r19, r25				;copy r25 to r19 to leave original number unchanged
  
   div7:
   subi r19,7
   cpi r19,7
   brge div7
   cpi r19, 0
   breq add_7s
   subi r18, 1
   cpi r18,0
   brne sram_for_7

   add_7s:
   ;if we made it here, R25 is div by 7 and we should add it to R20:R21
