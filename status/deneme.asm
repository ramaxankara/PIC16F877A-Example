#INCLUDE <P16F877A.INC>

elma EQU 0x20
sonuc EQU 0x21

ORG 0x000

goto anaprogram

anaprogram
MOVLW d'125' ;
MOVWF elma
MOVLW d'131'
ADDWF elma,w
MOVWF sonuc

BTFSC STATUS,C
GOTO $-3
goto anaprogram

end
