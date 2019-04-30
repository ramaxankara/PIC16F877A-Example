#INCLUDE<P16F877A.INC>

ZAMAN1 EQU 0X20
ZAMAN2 EQU 0X21
SAYAC EQU 0X23
SN EQU 0X24
DK EQU 0X25
SAAT EQU 0X26
SNBIRLER EQU 0X27
SNONLAR EQU 0X28
DKBIRLER EQU 0X29
DKONLAR EQU 0X2A
SAATBIRLER EQU 0X2B
SAATONLAR EQU 0X2C



ORG 0X00
GOTO anaprogram
ORG 0X04
KESME
BANKSEL PIR1
BCF PIR1,TMR2IF
BANKSEL SAYAC
INCF SAYAC,F
MOVF SAYAC,W
SUBLW D'125'
BTFSS STATUS,Z
RETFIE
CLRF SAYAC
INCF SN,F
CLRF SNBIRLER
CLRF SNONLAR
MOVF SN,W
SUBLW D'60'
BTFSS STATUS,Z
GOTO SNBASAMAKBUL
CLRF SN
INCF DK,F
CLRF DKBIRLER
CLRF DKONLAR
MOVF DK,W
SUBLW D'60'
BTFSS STATUS,Z
GOTO DKBASAMAKBUL
CLRF DK
INCF SAAT,F
CLRF SAATBIRLER
CLRF SAATONLAR
MOVF SAAT,W
SUBLW D'24'
BTFSS STATUS,Z
GOTO SAATBASAMAKBUL
CLRF SAAT
RETFIE


SNBASAMAKBUL
MOVF SN,W
MOVWF SNBIRLER
INCF SNONLAR
MOVLW D'10'
SUBWF SNBIRLER,F
BTFSC STATUS,C
GOTO $-4
MOVLW D'10'
ADDWF SNBIRLER,F
DECF SNONLAR,F
RETFIE


DKBASAMAKBUL
MOVF DK,W
MOVWF DKBIRLER
INCF DKONLAR,F
MOVLW D'10'
SUBWF DKBIRLER,F
BTFSC STATUS,C
GOTO $-4
MOVLW D'10'
ADDWF DKBIRLER,F
DECF DKONLAR,F
RETFIE

SAATBASAMAKBUL
MOVF SAAT,W
MOVWF SAATBIRLER
INCF SAATONLAR,F
MOVLW D'10'
SUBWF SAATBIRLER,F
BTFSC STATUS,C
GOTO $-4
MOVLW D'10'
ADDWF SAATBIRLER,F
DECF SAATONLAR,F
RETFIE


anaprogram
BANKSEL TRISB
CLRF TRISB
CLRF TRISC
CLRF TRISD

BANKSEL PORTB
CLRF PORTB


MOVLW D'0'
MOVWF SN
MOVLW D'0'
MOVWF DK
MOVLW D'0'
MOVWF SAAT


MOVF SN,W
MOVWF SNBIRLER
INCF SNONLAR
MOVLW D'10'
SUBWF SNBIRLER,F
BTFSC STATUS,C
GOTO $-4
MOVLW D'10'
ADDWF SNBIRLER,F
DECF SNONLAR,F

MOVF DK,W
MOVWF DKBIRLER
INCF DKONLAR,F
MOVLW D'10'
SUBWF DKBIRLER,F
BTFSC STATUS,C
GOTO $-4
MOVLW D'10'
ADDWF DKBIRLER,F
DECF DKONLAR,F


MOVF SAAT,W
MOVWF SAATBIRLER
INCF SAATONLAR,F
MOVLW D'10'
SUBWF SAATBIRLER,F
BTFSC STATUS,C
GOTO $-4
MOVLW D'10'
ADDWF SAATBIRLER,F
DECF SAATONLAR,F



BANKSEL T2CON
MOVLW B'00001111' ;PRE 1:16 POST 1:2

MOVWF T2CON

BANKSEL PR2
MOVLW D'250'
MOVWF PR2

BANKSEL INTCON
BSF INTCON,GIE
BSF INTCON,PEIE

BANKSEL PIE1
BSF PIE1,TMR2IE





SONSUZ
CALL TEMIZLE
CALL KARAKTERYOLLA
GOTO SONSUZ



KARAKTERYOLLA
MOVLW 'K'
CALL KARAKTERYAZ

MOVLW 'A'
CALL KARAKTERYAZ

MOVLW 'R'
CALL KARAKTERYAZ


MOVLW 'A'
CALL KARAKTERYAZ


MOVLW 'A'
CALL KARAKTERYAZ


MOVLW 0XC0
CALL KOMUTYAZ




MOVLW D'48'
ADDWF SAATONLAR,W
CALL KARAKTERYAZ

MOVLW D'48'
ADDWF SAATBIRLER,W
CALL KARAKTERYAZ

MOVLW ':'
CALL KARAKTERYAZ

MOVLW D'48'
ADDWF DKONLAR,W
CALL KARAKTERYAZ

MOVLW D'48'
ADDWF DKBIRLER,W
CALL KARAKTERYAZ


MOVLW ':'
CALL KARAKTERYAZ


MOVLW D'48'
ADDWF SNONLAR,W
CALL KARAKTERYAZ

MOVLW D'48'
ADDWF SNBIRLER,W
CALL KARAKTERYAZ


RETURN





TEMIZLE
MOVLW 0X02
CALL KOMUTYAZ
MOVLW 0X38
CALL KOMUTYAZ
MOVLW 0X0C
CALL KOMUTYAZ
MOVLW 0X85
CALL KOMUTYAZ
RETURN


KOMUTYAZ
BANKSEL PORTD
MOVWF PORTD
BCF PORTB,4
BSF PORTB,6
CALL GECIKME
BCF PORTB,6
RETURN


KARAKTERYAZ
BANKSEL PORTD
MOVWF PORTD
BSF PORTB,4
BSF PORTB,6
CALL GECIKME
BCF PORTB,6
RETURN


LOOKUP
ADDWF PCL,F
RETLW '0'
RETLW '1'
RETLW '2'
RETLW '3'
RETLW '4'
RETLW '5'
RETLW '6'
RETLW '7'
RETLW '8'
RETLW '9'
RETURN









GECIKME
MOVLW D'100'
MOVWF ZAMAN1

GECIK1
MOVLW D'80'
MOVWF ZAMAN2

GECIK2
DECFSZ ZAMAN2,F
GOTO $-1
DECFSZ ZAMAN1,F
GOTO GECIK1
RETURN





END