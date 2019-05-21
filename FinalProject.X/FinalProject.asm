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
;    Filename:      FinalProject.asm                                  *
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
;		     P16F877A_LCDWDBMOD.ASM			      *
;		     READKEYPAD.ASM				      *
;		     LCDINIT.ASM				      *
;		     PWMCALCUALTOR.ASM				      *
;		     RPMCALCULATOR.ASM				      *
;		     
;                                                                     *                                                                     *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Notes:                                                           *
;                                                                     *
;                                                                     *
;                                                                     *
;                                                                     *
;**********************************************************************


    list        p=16f877a   ; list directive to define processor
    #include    <p16f877a.inc>  ; processor specific variable definitions
    
    __CONFIG _CP_OFF & _WDT_OFF & _BODEN_OFF & _PWRTE_OFF & _XT_OSC & _WRT_OFF & _LVP_OFF & _CPD_OFF & _DEBUG_ON

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The labels following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

;***** VARIABLE DEFINITIONS (examples)

; example of using Shared Uninitialized Data Section
INT_VAR     UDATA_SHR      
w_temp      RES     1       ; variable used for context saving 
status_temp RES     1       ; variable used for context saving
pclath_temp RES	    1       ; variable used for context saving
t1count	    RES	    1	    ; Number of times timer 1 overflowed.

; example of using Uninitialized Data Section
TEMP_VAR    UDATA           ; explicit address specified is not required

GLOBAL	t1count
    
extern	read		    ; Function - read a new keypad entry
extern	InitLCD		    ; Function - Beginning initialization of LCD, and text writing
extern	entries		    ; Variable - Number of new percent digits the LCD is displaying
extern	P1		    ; Variable - First digit of Percent Drive
extern	P2		    ; Variable - Second digit of Percent Drive
extern	PercentDrive	    ; Function - Display the last ASCII Value
extern	SetupTimers	    ; Function - Sets up TMR0 and TMR1 for RPM counting
extern	RPMInterrupt	    ; Fucntion - Interrupt routine for expiration of Timer1
;**********************************************************************
RESET_VECTOR    CODE    0x0000 ; processor reset vector
    nop                        ; nop for icd
    pagesel start
    goto    start              ; go to beginning of program


INT_VECTOR      CODE    0x0004 ; interrupt vector location

INTERRUPT

    movwf   w_temp          ; save off current W register contents
    movf    STATUS,w        ; move status register into W register
    movwf   status_temp     ; save off contents of STATUS register
    movf    PCLATH,w        ; move pclath register into w register
    movwf   pclath_temp     ; save off contents of PCLATH register

    pagesel RPMInterrupt    ; Interrupt routine
    call    RPMInterrupt

    movf    pclath_temp,w   ; retrieve copy of PCLATH register
    movwf   PCLATH          ; restore pre-isr PCLATH register contents
    movf    status_temp,w   ; retrieve copy of STATUS register
    movwf   STATUS          ; restore pre-isr STATUS register contents
    swapf   w_temp,f
    swapf   w_temp,w        ; restore pre-isr W register contents
    retfie                  ; return from interrupt

MAIN_PROG       CODE

start

    pagesel InitLCD		    ; Initial setup of timers and LCD display
    call    InitLCD
    pagesel SetupTimers
    call    SetupTimers
    
    ;Initialize to zero
    banksel TRISC
    bcf	    TRISC,2		    ; Set PWM to output
    bsf	    TRISA,4		    ; Set TMR0 pin to input
    banksel P1			    ; Clear out P1 and P2 for PercentDrive
    clrf    P1
    banksel P2
    clrf    P2
    banksel entries		    ; Make sure entries for PercentDrive is initialized to 0
    clrf    entries
    banksel PR2			    ; Clear out data for PWM Period and On Time
    clrf    PR2
    banksel CCPR1L
    clrf    CCPR1L
    banksel CCP1CON		    ; Setup CCP1CON to set to PWM mode
    movlw   0x0F
    movwf   CCP1CON
    banksel T2CON		    ; Setup Timer2 Prescaler
    movlw   0x01
    movwf   T2CON
    
    banksel INTCON		    ; Turn on interrupts
    bsf	    INTCON,7
    
    banksel T1CON		    ; Turns on TMR1
    bsf	    T1CON,0
    
loop
    pagesel read
    call    read
    pagesel PercentDrive
    call    PercentDrive
    pagesel loop
    goto    loop
    
    END                       ; directive 'end of program'