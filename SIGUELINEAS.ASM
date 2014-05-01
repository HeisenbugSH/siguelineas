        #INCLUDE <P16F84A.INC>
        __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _Xt_OSC

        #DEFINE SD  PORTA,0
        #DEFINE SI  PORTA,1
        #DEFINE SC  PORTA,2

        ORG 000H

INICIO: BSF STATUS,RP0
        BSF SD
        BSF SI
        BSF SC
        CLRF PORTB
        BCF STATUS,RP0

MAIN:   MOVLW b'00001110'
        BFFIS SD
        GOTO AS
        
        MOVLW b'00000111'
        BTFSS SI
        MOVLW b'00001111'

AS:     MOVWF PORTB
        GOTO MAIN

END
