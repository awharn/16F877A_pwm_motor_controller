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
;    Filename:      RPMInterrupt.asm                                  *
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
;	 	                           			      *
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
Overflow    RES	    1
RPMHundreds RES	    1
RPMTens	    RES	    1
RPMOnes	    RES	    1
RPMTenths   RES	    1
TempCount   RES	    1

extern	t1count		    ; Variable - Count of number of times Timer1 has interrupted
extern  i_write		    ; Function - Writes instruction to LCD
extern	d_write		    ; Function - Writes data to LCD
extern	temp_wr		    ; Variable - Data or instruction to write to LCD
    
GLOBAL	Overflow
;**********************************************************************

MAIN       CODE

RPMInterrupt
       banksel	TMR0		    ; Get Timer 0 value as soon as possible
       movfw	TMR0
       movwf	TempCount
       
       banksel	Overflow	    ; Save if Timer 0 overflowed as soon as possible
       bcf	Overflow,0
       btfsc	INTCON,2
       bsf	Overflow,0
       
       banksel	t1count		    ; Increment interrupt counter
       incf	t1count
       
       banksel	TMR1H		    ; Reset Timer1 value (approx 333ms, if interrupt time included)
       movlw	0x5D
       movwf	TMR1H
       banksel	TMR1L
       movlw	0x29
       movwf	TMR1L
       
       banksel	PIR1		    ; Clear out Timer 1 interrupt
       bcf	PIR1,0		
       
       banksel	t1count
       btfss	t1count,2	    ; If t1count is not 4, return. Otherwise, continue. 
       return
       
       pagesel	RPMCalculator
       call	RPMCalculator
       
       pagesel	DisplayRPM
       call	DisplayRPM
       return
       
       GLOBAL RPMInterrupt
	
RPMCalculator
       banksel	TMR0		    ; Clear out Timer 0 and its overflow so it can start counting immediately
       clrf	TMR0
       bcf	INTCON,2
       
       banksel	t1count		    ; Reset the interrupt counter
       clrf	t1count
       
       banksel	RPMHundreds
       clrf	RPMHundreds
       banksel	RPMTens
       clrf	RPMTens
       banksel	RPMOnes
       clrf	RPMOnes
       banksel	RPMTenths
       clrf	RPMTenths
       
       bcf	STATUS,C	    ; Clear out the carry for the time being.
       btfsc	Overflow,0	    ; If Timer0 overflowed, we need a carry.
       bsf	STATUS,C
       
       banksel	TempCount
       rrf	TempCount	    ; Rotate right to divide by 2
       
       banksel	RPMTenths	    ; If there is a carry bit, there is half an RPM
       movlw	0x05
       btfsc	STATUS,C
       movwf	RPMTenths
       
Hundreds
       banksel	TempCount	    ; If 100 can be subtracted, goto AddHundreds
       movlw	d'100'
       subwf	TempCount,0
       pagesel	AddHundreds
       btfsc	STATUS,C
       goto	AddHundreds
       
Tens				    ; If 10 can be subtracted, goto AddTens
       banksel	TempCount
       movlw	d'10'
       subwf	TempCount,0
       pagesel	AddTens
       btfsc	STATUS,C
       goto	AddTens
       
Ones				    ; Remaining are ones. Move that to RPMOnes
       banksel	TempCount
       movfw	TempCount
       banksel	RPMOnes
       movwf	RPMOnes
       
       return
       
AddHundreds			    ; Add 1 to the hundreds place, subtract 100 from TempCount
       banksel	RPMHundreds
       incf	RPMHundreds
       banksel	TempCount
       movlw	d'100'
       subwf	TempCount,1
       pagesel	Hundreds
       goto	Hundreds
       
AddTens				    ; Add 1 to the tens place, subtract 10 from TempCount
       banksel	RPMTens
       incf	RPMTens
       banksel	TempCount
       movlw	d'10'
       subwf	TempCount,1
       pagesel	Tens
       goto	Tens
       
DisplayRPM
       banksel	temp_wr
       pagesel	i_write
       movlw	0xC6		    ; Move cursor to bottom line, first position
       movwf	temp_wr
       call	i_write
       
DisplayHundreds	   		    ; Write the hundreds value
       banksel	RPMHundreds
       movfw	RPMHundreds
       pagesel	SkipableTens
       btfsc	STATUS,Z
       goto	SkipableTens	    ; Skip Hundreds if there are none
       
       iorlw	0x30		    ; Don't skip if there is a value
       banksel	temp_wr
       movwf	temp_wr
       call	d_write
       pagesel	DisplayTens
       goto	DisplayTens
       
SkipableTens			    ; Hundreds were skipped, tens skippable
       banksel	RPMTens
       movfw	RPMTens		    
       pagesel	DisplayOnes
       btfsc	STATUS,Z
       goto	DisplayOnes	    

DisplayTens			    ; Tens has value or hundreds not skipped
       banksel	RPMTens
       movfw	RPMTens
       iorlw	0x30
       banksel	temp_wr
       movwf	temp_wr
       pagesel	d_write
       call	d_write
       
DisplayOnes
       banksel	RPMOnes
       movfw	RPMOnes		    ; Write the ones value
       iorlw	0x30
       banksel	temp_wr
       movwf	temp_wr
       pagesel	d_write
       call	d_write
       
       movlw	'.'		    ; Insert the period
       movwf	temp_wr
       call	d_write
       
DisplayTenths
       banksel	RPMTenths	    ; Write the tenths value
       movfw	RPMTenths
       iorlw	0x30
       banksel	temp_wr
       movwf	temp_wr
       call	d_write
       
ClearReturn
       banksel	temp_wr
       movlw	' '
       movwf	temp_wr
       call	d_write
       call	d_write
       
       pagesel	i_write		    ; Move the cursor back
       movlw	0x90
       movwf	temp_wr
       call	i_write
       return
       END