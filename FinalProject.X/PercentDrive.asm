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
;    Filename:      PercentDrive.asm                                  *
;    Date:          12/01/17                                          *
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
P1	    RES	    1	    ; Percent Digit 1
TP1	    RES	    1	    ; Temporary Percent Digit 1	
P2	    RES	    1	    ; Percent Digit 2
TP2	    RES	    1	    ; Temporary Percent Digit 2
entries	    RES	    1	    ; Number of Text Entries (0,1,2)

extern	LCDInit		    ; Function - Initializes LCD
extern	i_write		    ; Function - Writes instruction to LCD
extern	d_write		    ; Function - Writes data to LCD 
extern	LCDLine_2	    ; Function - Moves LCD cursor to second line
extern	temp_wr		    ; Variable - Temporary Working Register
extern	ASCII		    ; Variable - ASCII character from keypad
extern	SetPWM		    ; Function - Sets the PWM
       
GLOBAL  entries
GLOBAL	P1
GLOBAL	P2
;**********************************************************************

MAIN       CODE

PercentDrive
       banksel	ASCII
       btfsc	ASCII,7	    ; Check if ASCII is set to ERROR (0x80)
       return		    ; Do nothing if it is
       
       movfw	ASCII	    ; Test if ASCII is * character to clear
       sublw	0x2A
       pagesel	ClrPer	
       btfsc	STATUS,Z
       goto	ClrPer	    ; Clear if it is the * character
       
       banksel	entries
       movfw	entries
       banksel	PD1
       btfsc	STATUS,Z    ; Check if Entries is 0
       goto	PD1
       sublw	0x01
       banksel	PD2
       btfsc	STATUS,Z    ; Check if Entries is 1
       goto	PD2
       banksel	PD3
       goto	PD3
       
       GLOBAL	PercentDrive

PD1
       bcf	INTCON,7    ; Disable all interrupts before write
       pagesel	i_write	    ; Go to the first percent drive LCD location
       banksel	temp_wr
       movlw	0x8E
       movwf	temp_wr
       call	i_write
       
       banksel	ASCII	    ; If it is the enter, ignore it.
       movfw	ASCII
       sublw	0x23
       bsf	INTCON,7    ; Enable interrupts in case of return
       btfsc	STATUS,Z
       return
       
       movfw	ASCII	    ; Otherwise save the value temporarily in TP1
       banksel	TP1
       movwf	TP1
       pagesel	WriteData
       call	WriteData
       incf	entries
       return

PD2
       bcf	INTCON,7    ; Disable all interrupts before write
       pagesel	i_write	    ; Go to the second percent drive LCD location
       banksel	temp_wr
       movlw	0x8F
       movwf	temp_wr
       call	i_write
       
       banksel	ASCII	    ; If it is the enter, ignore it.
       movfw	ASCII
       sublw	0x23
       bsf	INTCON,7    ; Enable interrupts in case of return
       btfsc	STATUS,Z
       return
       
       movfw	ASCII	    ; Otherwise save the value temporarily in TP2
       banksel	TP2
       movwf	TP2
       pagesel	WriteData
       call	WriteData
       incf	entries
       return

PD3
       banksel	entries	    ; Clear the entry counter
       clrf	entries
       banksel	ASCII
       movfw	ASCII
       sublw	0x23
       pagesel	PD1
       btfss	STATUS,Z    ; If it is 0x23, save temps as percents. Otherwise, clear and print new number as first digit.
       goto	PD1
       
       banksel	TP1
       movfw	TP1
       banksel	P1
       movwf	P1
       
       banksel	TP2
       movfw	TP2
       banksel	P2
       movwf	P2
       
       pagesel	SetPWM
       call	SetPWM
       return
       
WriteData
       bcf	INTCON,7	; Disable interrupts before write
       pagesel	d_write
       banksel	ASCII
       movfw	ASCII
       banksel	temp_wr
       movwf	temp_wr
       call	d_write
       bsf	INTCON,7	; Enable interrupts after write
       return
       
ClrPer
       bcf	INTCON,7	; Disable interrupts before writes
       banksel	entries		; Clear the entries
       clrf	entries
       banksel	temp_wr
       movlw	0x8E		; Move to where the Percent Drive numbers are.
       movwf	temp_wr
       pagesel	i_write
       call	i_write
       
       banksel	P1
       movfw	P1		; Write the last value of the first digit
       banksel	temp_wr
       movwf	temp_wr
       pagesel	d_write
       call	d_write
       
       banksel	P2
       movfw	P2		; Write the last value of the second digit
       banksel	temp_wr
       movwf	temp_wr
       pagesel	d_write
       call	d_write
       bsf	INTCON,7	; Enable interrupts after writes
       
       return
       
       END