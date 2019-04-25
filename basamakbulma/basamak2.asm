INCLUDE<P16F877A.INC>
yuzler equ 0x20
onlar equ 0x21
birler equ 0x22
org 0x04
anaprogram
MOVLW D'245'
MOVWF birler
call basamak_ayir

basamak_ayir
	incf yuzler
	movlw d'100'
	subwf birler,f
	btfsC STATUS,C
	GOTO basamak_ayir
	movlw d'100'
	addwf birler
	decf yuzler
onlar_ayir
	incf onlar
	movlw d'10'
	subwf birler,f
	btfsC STATUS,C
	GOTO onlar_ayir
	movlw d'10'
	addwf birler
	decf onlar
	return

END