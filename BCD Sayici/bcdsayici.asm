#INCLUDE <P16F877A.INC>

ORG 0X00
goto anaprogram

ORG 0X04

kesme
retfie

anaprogram
BSF STATUS,RP0 ;1 BANKA GE�T�K
MOVLW 0X06
MOVWF ADCON1
MOVLW 0xCF
MOVWF TRISA

BANKSEL TRISB
CLRF TRISB ;PORTB Y� CIKIS YAPTIK
BANKSEL PORTB
CLRF PORTB

D�ZEN
BTFSS PORTA,0
GOTO KONTROL
GOTO DOKUZMU


DOKUZMU
MOVLW D'9'
SUBWF PORTB,0
BTFSS STATUS,Z
GOTO ARTIR
MOVLW D'0'
MOVWF PORTB
GOTO DONGU


ARTIR
INCF PORTB,1
GOTO DONGU
 

DONGU
BTFSS PORTA,0   ;Burda butona bas�l� kalma s�resi oldugunca art�r�lan
GOTO D�ZEN		;de�er kalacak ��nk� komut mikro saniyeler ile i�leniyor
GOTO DONGU 		;bu y�zden bekleme olmas� laz�m

KONTROL
BTFSS PORTA,1
GOTO D�ZEN
GOTO SIFIRMI


SIFIRMI
BTFSC PORTB,0
GOTO AZALT
BTFSC PORTB,1
GOTO AZALT
BTFSC PORTB,2
GOTO AZALT
BTFSC PORTB,3
GOTO AZALT
MOVLW D'9'
MOVWF PORTB
GOTO DONGU2

AZALT
DECF PORTB,1
GOTO DONGU2


DONGU2
BTFSS PORTA,1
GOTO D�ZEN
GOTO DONGU2



END




