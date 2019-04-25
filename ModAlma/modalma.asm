#INCLUDE <P16F877A.INC>

a_sayi EQU 0x25
b_sayi EQU 0x26
kalan EQU 0x27

ORG 0X00

GOTO anaprogram

ORG 0X04

kesme
retfie

anaprogram
MOVLW D'29'
MOVWF a_sayi
MOVLW D'5'
MOVWF b_sayi
BSF STATUS,C
CLRW 

LOOP
MOVF b_sayi,w
SUBWF a_sayi,f
BTFSC STATUS,C
GOTO TUT
GOTO YAZDIR

TUT
MOVF a_sayi,0
MOVWF kalan
GOTO LOOP



YAZDIR
MOVF kalan,0
MOVWF PORTB
NOP
NOP
END