INCLUDE<P16F877A.INC>

ORG 0X04
goto anaprogram


anaprogram
BANKSEL TRISB
CLRF TRISB
BANKSEL TRISA

MOVLW D'255'
MOVWF TRISA
BANKSEL PORTB
CLRF PORTB

BANKSEL INTCON
BSF INTCON,GIE
BSF INTCON,PEIE

MOVLW B'01000000'
MOVWF ADCON1

BANKSEL ADCON0
MOVLW B'00011001'
MOVWF ADCON0
BSF ADCON0,GO

DONGU
BTFSC ADCON0,GO
GOTO DONGU
GOTO OKUYAZ

OKUYAZ
BANKSEL ADRESH
MOVF ADRESH,W
MOVWF PORTB
BANKSEL ADCON0
BSF ADCON0,GO
GOTO DONGU



END