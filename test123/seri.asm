INCLUDE <P16F877A.INC>
goto anaprogram
org 0x04
kesme
retfie

anaprogram
banksel INTCON
BSF INTCON,GIE
BSF INTCON,PEIE
BANKSEL RCSTA
MOVLW B'10010000'
MOVWF RCSTA
BANKSEL PIE1
BSF PIE1,TXIE
BANKSEL TXSTA
MOVLW B'00100100'
MOVWF TXSTA
BANKSEL SPBRG
MOVLW D'25'
MOVWF SPBRG

a
movlw 'e'
banksel TXREG
MOVWF TXREG

movlw 'n'
banksel TXREG
MOVWF TXREG

movlw 'a'
banksel TXREG
MOVWF TXREG

movlw 's'
banksel TXREG
MOVWF TXREG


d

goto d



END