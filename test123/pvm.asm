INCLUDE <P16F877A.INC>
ORG 0X00
goto anaprogram
org 0x04
kesme
retfie
anaprogram
BANKSEL TRISC
CLRF TRISC
BANKSEL PIE1
BSF PIE1,TMR2IE
BANKSEL PR2
MOVLW D'49'
MOVWF PR2
BANKSEL CCPR1L
MOVLW D'25'
MOVWF CCPR1L
BANKSEL CCP1CON
MOVLW B'00001100'
MOVWF CCP1CON
BANKSEL T2CON
MOVLW D'7'
MOVWF T2CON
banksel INTCON
BSF INTCON,GIE
BSF INTCON,PEIE
a

goto a
END