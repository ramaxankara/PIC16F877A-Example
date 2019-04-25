INCLUDE <P16F877A.INC>
temp equ 0x20
sayac equ 0x21
org 0x50
anaprogram
banksel TRISB
CLRF TRISB
CLRF TRISD
BANKSEL PORTB
call komut_gonder
call karakter_gonder

a

goto a

komut_gonder
movlw 0x02
call komut_yaz
movlw 0x28
call komut_yaz
movlw 0x0C
call komut_yaz
movlw 0x86
call komut_yaz
return

karakter_gonder
movlw '1'
call karakter_yaz
movlw 0xc5
call komut_yaz
movlw '2'
call karakter_yaz
return

komut_yaz
	movwf temp
	swapf temp,w
	andlw 0x0f
	movwf PORTD
	BCF PORTB,0 ;RS
	BSF PORTB,1;ENABLE
	CALL gecikme
	bcf PORTB,1
	
	MOVF temp,w
	andlw 0x0f
	movwf PORTD
		BCF PORTB,0
	BSF PORTB,1
	CALL gecikme
	bcf PORTB,1
RETURN

karakter_yaz
	movwf temp
	swapf temp,w
	andlw 0x0f
	movwf PORTD
	BSF PORTB,0 ;RS
	BSF PORTB,1;ENABLE
	CALL gecikme
	bcf PORTB,1
	
	MOVF temp,w
	andlw 0x0f
	movwf PORTD
	BSF PORTB,0
	BSF PORTB,1
	CALL gecikme
	bcf PORTB,1
RETURN


gecikme
movlw d'255'
movwf sayac
decfsz sayac,f
goto $-1
return


END