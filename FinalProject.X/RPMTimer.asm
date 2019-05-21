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
;    Filename:      RPMTimer.asm                                      *
;    Date:          12/06/17                                          *
;    File Version:  0.0.1                                             *
;                                                                     *
;    Author:        Andrew W. Harn                                    *
;    Company:       Geneva College                                    *
;                                                                     * 
;                                                                     *
;**********************************************************************
;                                                                     *
;    Files required: P16F877A.INC                                     *
;	 	                        			      *
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

;**********************************************************************

MAIN       CODE

SetupTimers
       
       banksel	PORTA		    ; Setup RA4 for timing
       bcf	PORTA,4
       banksel	OPTION_REG
       movlw	b'00111000'	    ; Incrememnt on rising RA4, no prescaler
       movwf	OPTION_REG
       banksel	TMR0		    ; Clear the timer and any interrupts it made
       clrf	TMR0
       bcf	INTCON,2	    ; Clear TMR0 Overflow Flag
       bsf	INTCON,6	    ; Turn on Perripheral Interrupts
       
       banksel	PIE1		    ; Setup TMR1 interrupt
       movlw	0x01
       movwf	PIE1
       
       banksel	PIR1
       bcf	PIR1,0
       
       banksel	T1CON
       movlw	b'00110000'	    ; Stop Timer1, Run from Internal Clock, 1:8 Prescale, External clock not synced
       movwf	T1CON
       
       banksel	TMR1H		    ; Setup Timer1 value (approx 333 ms)
       movlw	0x5D
       movwf	TMR1H
       banksel	TMR1L
       movlw	0x3D
       movwf	TMR1L
       
       return
       GLOBAL SetupTimers
       

       END


