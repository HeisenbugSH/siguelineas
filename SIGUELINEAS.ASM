        #INCLUDE <P16F84A.INC>
        __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

        #DEFINE SD PORTA,0
        #DEFINE SC PORTA,1
        #DEFINE SI PORTA,2

        ORG 000H

CONF: BSF STATUS,RP0
        BSF SD
        BSF SC
        BSF SI
        CLRF PORTB
        BCF STATUS,RP0

MAIN: MOVLW b'00001110'
        BTFSC SD
        GOTO ASS
        
        MOVLW b'00001111'
        BTFSC SC
        GOTO ASS
        
        MOVLW b'00000111'
        BTFSC SD
        GOTO ASS
        GOTO MAIN

ASS: MOVWF PORTB
        GOTO MAIN

        END
