;**********************************************************************
;   This file is a basic code template for object module code         *
;   generation on the PIC16F877A. This file contains the              *
;   basic code building blocks to build upon.                         *
;                                                                     *
;   Refer to the MPASM User's Guide for additional information on     *
;   features of the assembler and linker (Document DS33014).          *
;                                                                     *
;   Refer to the respective PIC data sheet for additional             *
;   information on the instruction set.                               *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Filename:	    PWMCalculator.asm                                 *
;    Date:          12/05/17                                          *
;    File Version:  0.0.1                                             *
;                                                                     *
;    Author:        Andrew W. Harn                                    *
;    Company:       Geneva College                                    *
;                                                                     * 
;                                                                     *
;**********************************************************************
;                                                                     *
;    Files required: P16F877A.INC                                     *
;	 	     P16F877A_LCDWDBMOD.ASM			      *
;		     LCDPRINTER.ASM				      *
;		     PERCENTDRIVE.ASM				      *
;		                                    	              *   
;                                                                     *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Notes:                                                           *
;                                                                     *
;                                                                     *
;                                                                     *
;                                                                     *
;**********************************************************************
 
	list 		p=16F877A
	#include	P16F877A.inc
	
;***** VARIABLE DEFINITIONS (examples)
 
; example of using Shared Uninitialized Data Section
INT_VAR     UDATA_SHR
 
; example of using Uninitialized Data Section
TEMP_VAR    UDATA           ; explicit address specified is not required
PWMPercent  RES	    1	    ; Percent of time the PWM should be enabled
tempPWM	    RES	    1	    ; Temporary value of PWMPercent
loopCount   RES	    1	    ; Number of times for loop to iterate
tempCarry   RES	    1

extern	P1
extern	P2
 
GLOBAL	PWMPercent
;**********************************************************************

MAIN       CODE

SetPWM
       bcf	STATUS,C
       banksel	tempCarry		; Clear tempCarry
       clrf	tempCarry
       movlw	0x04			; 4 loops + original number = Multiply by 5
       pagesel	loopCount
       movwf	loopCount
       movlw	d'249'			; Setup PWM Period
       banksel	PR2
       movwf	PR2
       pagesel	PercentCalc
       call	PercentCalc
       banksel	PWMPercent
       movfw	PWMPercent
       banksel	tempPWM
       movwf	tempPWM
       
       GLOBAL	SetPWM
loop   
       banksel	tempPWM
       addwf	tempPWM
       banksel	tempCarry
       pagesel	loop
       btfsc	STATUS,C
       bsf	tempCarry,0	    ; If there is a carry, set tempCarry bit 0 to 1
       banksel	loopCount
       decfsz	loopCount
       goto	loop
       btfsc	tempCarry,0	    ; If there was a carry inside the loop, reset the carry bit to 1
       bsf	STATUS,C
       banksel	tempPWM
       rrf	tempPWM
       
       banksel	CCP1CON
       bcf	CCP1CON,5	    ; Setup lower bits for CCP1CON
       banksel	tempCarry
       pagesel	setupCCP1CON
       btfsc	tempCarry,0
       call	setupCCP1CON
       pagesel	CCP1CON
       bcf	CCP1CON,4
       
       banksel	tempPWM		    ; Set CCPR1L with new ON TIME value
       movfw	tempPWM
       banksel	CCPR1L
       movwf	CCPR1L
       
       banksel	T2CON		    ; Make sure the timer is running
       bsf	T2CON,2
       return
       
PercentCalc
       banksel	P1		; Get the first digit
       movfw	P1
       xorlw	0x30		; Exclusive OR it with 0x30 to get the value out of ASCII and into decimal
       banksel	PWMPercent
       clrf	PWMPercent	; Clear the PWMPercent variable
       movwf	PWMPercent
       
       bcf	STATUS,C	; Clear Zero bit
       
       rlf	PWMPercent	; Multiply first number by 2
       rlf	PWMPercent	; Multiply first number by 4
       rlf	PWMPercent	; Multiply first number by 8
       
       addwf	PWMPercent,1	; Add the first number twice to finish multiplying by 10
       addwf	PWMPercent,1
       
       banksel	P2		; Get the second digit
       movfw	P2
       xorlw	0x30		; Exclusive OR it with 0x30 to get the value out of ASCII and into decimal
       banksel	PWMPercent
       addwf	PWMPercent,1	; Add the second number. The result is the percent on the display.
       
       return

setupCCP1CON
       banksel	CCP1CON
       bsf	CCP1CON,5
       return
END