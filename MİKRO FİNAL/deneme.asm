INCLUDE <P16F877A.INC>
SAYAC1 EQU 0X23
SAYAC2 EQU 0X24
ORG 0X00
BANKSEL ADCON1
MOVLW 0X06
MOVWF ADCON1
BANKSEL TRISA
MOVLW 0XFF
MOVWF TRISA
BANKSEL TRISB
CLRF TRISB
BANKSEL PORTB 
MOVLW B'10000000'
MOVWF PORTB
DONGU
CALL GECIK
BTFSC PORTB,0
GOTO SOLA
RRF PORTB,F
GOTO DONGU
SOLA
CALL GECIK
BTFSC PORTB,7
GOTO DONGU
RLF PORTB,F
GOTO SOLA
GECIK
MOVLW 0XFF
MOVWF SAYAC1
GECIKME
MOVLW 0XFF
MOVWF SAYAC2
GECIKME1
DECFSZ SAYAC2,F
GOTO GECIKME1
DECFSZ SAYAC1,F
GOTO GECIKME
RETURN
END




GECIK



END