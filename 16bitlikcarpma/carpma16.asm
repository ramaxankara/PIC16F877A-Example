LIST P=16F877A
#INCLUDE <P16F877A.INC>
__config H'3F31'


sayi1 EQU 0X23
sayi2 EQU 0X24
sayilow EQU 0x25
sayihigh EQU 0X26
bool EQU 0X27


ORG 0X00
goto anaprogram

ORG 0X04

kesme
retfie


anaprogram
BSF STATUS,RP0 
MOVLW 0X06
MOVWF ADCON1	;Burada porta giri� yapt�k;
MOVLW 0XCF
MOVWF TRISA

BANKSEL TRISB	;Burada portb yi c�k�s yapt�k
CLRF TRISB

BANKSEL PORTB	; Portb yi temizledik
CLRF PORTB

MOVLW D'75'
MOVWF sayi1
MOVLW D'33'
MOVWF sayi2
BCF STATUS,C
CLRF sayilow
CLRF sayihigh
CLRF bool
CLRW

TOPLAMA	
ADDWF sayi1,w
DECFSZ sayi2,f				;burada once sayiyi topluoz 
GOTO TASMA				;sonra tasma varmi kontrol edioz
MOVWF sayilow
GOTO SONTASMA


TASMA
BTFSS STATUS,C
GOTO TOPLAMA
INCF sayihigh     ;burada her tasmada sayihigh art�yoruz
BCF STATUS,C
GOTO TOPLAMA

SONTASMA
BTFSS STATUS,C		;Burada say� bittimi ve tasma varsa onun kontrolunu yap�yoruz
GOTO YAZDIR			
INCF sayihigh		; sayihigh art�yoruz
GOTO YAZDIR

YAZDIR
BTFSS PORTA,0	
GOTO YAZDIR
INCF bool
GOTO SEC


SEC
BTFSS bool,0		;Burada say� tekse highi yak 
GOTO  LOWYAK		;�iftse low u yak
GOTO H�GHYAK


LOWYAK
MOVF sayilow,w
MOVWF PORTB
GOTO DONGU

H�GHYAK
MOVF sayihigh,w
MOVWF PORTB
GOTO DONGU


DONGU
BTFSS PORTA,0		;burada el butonda bas�l� kald�g� surece ledler yans�n
GOTO YAZDIR
GOTO DONGU

END

