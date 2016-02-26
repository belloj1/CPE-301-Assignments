;
; Design Assignment 1.asm
;
; Created: 2/25/2016 9:31:14 PM
; Author : Boba Fett
;


; Replace with your application code
start:
   ldi r16, high(RAMEND)
   ldi r17, low(RAMEND)
   lsr r16
   ror r17
   mov zh, r16
   mov zl, r17
   ldi r18, 25
   store25:
   st z+, r17
   mov r17, zl
   subi r18, 1
   cpi r18, 0
   brne store25

   
   mov yh, zh
   mov yl, zl
   ldi r18, 25
   sram_for_7:
   ld r25, -y
   mov r19, r25
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
