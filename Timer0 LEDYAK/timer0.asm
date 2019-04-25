LIST P=16F877A
#INCLUDE <P16F877A.INC>
__config H'3F31'

SAYAC EQU 0X25 
ORG 0X00
GOTO anaprogram


ORG 0X04
KESME
BTFSS INTCON,TMR0IF
retfie
INCF SAYAC,F
MOVLW d'250'
SUBWF SAYAC,W
BTFSS STATUS,C
GOTO BITIR
CLRF SAYAC
INCF PORTB
GOTO BITIR




BITIR
MOVLW d'6'
MOVWF TMR0
BCF INTCON,TMR0IF
RETFIE



anaprogram
BANKSEL TRISB
CLRF TRISB
BANKSEL PORTB
CLRF PORTB
CLRF SAYAC
BANKSEL OPTION_REG
MOVLW B'11010011'
MOVWF OPTION_REG
BANKSEL PORTB
BCF PORTB,0
MOVLW D'6'
MOVWF TMR0
BSF INTCON,TMR0IE
BSF INTCON,GIE

SONSUZ
GOTO SONSUZ
END