LIST P=16F877A
#INCLUDE <P16F877A.INC>
__config H'3F31'

SAYAC EQU 0X23
SURE EQU 0X24

ORG 0X00
GOTO anaprogram

ORG 0X04
KESME
BANKSEL PIR1
BTFSS PIR1,TMR1IF
RETFIE
INCF SAYAC
MOVF SAYAC,W
SUBWF SURE,W          ;
BTFSS STATUS,Z
GOTO BITIR
CLRF SAYAC
INCF PORTB

BITIR
BANKSEL TMR1L
MOVLW 0X3C
MOVWF TMR1H
MOVLW 0XB0
MOVWF TMR1L

BCF PIR1,TMR1IF
RETFIE

anaprogram
BSF STATUS,RP0
MOVLW 0X06
MOVWF ADCON1
MOVLW 0XCF
MOVWF TRISA
BANKSEL TRISB
CLRF TRISB
CLRF TRISC

BANKSEL PORTB
CLRF SAYAC
CLRF PORTB
CLRF PORTA
CLRF PORTC
MOVLW d'10'
MOVWF SURE


BANKSEL T1CON   ;TM1L TM1H HEPSI BUNLARIN SIFIRINCI BANKDA
MOVLW B'00010001' ;PRESCALER 1:2 SECILDI TMR1=ON YAPILDI
MOVWF T1CON

BANKSEL TMR1H
MOVLW 0X3C			;HEPSI BANK1DE
MOVWF TMR1H
MOVLW 0XB0
MOVWF TMR1L		;

BANKSEL PIR1
BCF PIR1,TMR1IF		;TMR1IF CLEARLA

BANKSEL PIE1
BSF PIE1,TMR1IE
BSF INTCON,GIE
BSF INTCON,PEIE

KESMEBEKLE
BTFSC PORTA,0
GOTO ARTIR
BTFSC PORTA,1
GOTO AZALT
GOTO KESMEBEKLE


ARTIR
CLRF SAYAC
MOVF SURE,W
MOVWF PORTC
MOVF SURE,W
BTFSC SURE,4
GOTO KESMEBEKLE
INCF SURE
GOTO DONGU1



AZALT
CLRF SAYAC
MOVF SURE,W
MOVWF PORTC
MOVLW D'5'
SUBWF SURE,W
BTFSC STATUS,C
GOTO AZALT2
MOVLW D'5'
MOVWF SURE
GOTO KESMEBEKLE

AZALT2
DECF SURE
GOTO DONGU2

DONGU1
BTFSS PORTA,0
GOTO KESMEBEKLE
GOTO DONGU1

DONGU2
BTFSS PORTA,1
GOTO KESMEBEKLE
GOTO DONGU2


END










