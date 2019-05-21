#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../p16f877a_lcdwdbmod.asm ../ReadKeypad.asm PWMCalculator.asm ../LCDInit.asm PercentDrive.asm RPMTimer.asm RPMInterrupt.asm FinalProject.asm

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o ${OBJECTDIR}/_ext/1472/ReadKeypad.o ${OBJECTDIR}/PWMCalculator.o ${OBJECTDIR}/_ext/1472/LCDInit.o ${OBJECTDIR}/PercentDrive.o ${OBJECTDIR}/RPMTimer.o ${OBJECTDIR}/RPMInterrupt.o ${OBJECTDIR}/FinalProject.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o.d ${OBJECTDIR}/_ext/1472/ReadKeypad.o.d ${OBJECTDIR}/PWMCalculator.o.d ${OBJECTDIR}/_ext/1472/LCDInit.o.d ${OBJECTDIR}/PercentDrive.o.d ${OBJECTDIR}/RPMTimer.o.d ${OBJECTDIR}/RPMInterrupt.o.d ${OBJECTDIR}/FinalProject.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o ${OBJECTDIR}/_ext/1472/ReadKeypad.o ${OBJECTDIR}/PWMCalculator.o ${OBJECTDIR}/_ext/1472/LCDInit.o ${OBJECTDIR}/PercentDrive.o ${OBJECTDIR}/RPMTimer.o ${OBJECTDIR}/RPMInterrupt.o ${OBJECTDIR}/FinalProject.o

# Source Files
SOURCEFILES=../p16f877a_lcdwdbmod.asm ../ReadKeypad.asm PWMCalculator.asm ../LCDInit.asm PercentDrive.asm RPMTimer.asm RPMInterrupt.asm FinalProject.asm


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16f877a
MP_LINKER_DEBUG_OPTION=-r=ROM@0x1F00:0x1FFF -r=RAM@SHARE:0x70:0x70 -r=RAM@SHARE:0xF0:0xF0 -r=RAM@SHARE:0x170:0x170 -r=RAM@GPR:0x1E5:0x1EF -r=RAM@SHARE:0x1F0:0x1F0
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o: ../p16f877a_lcdwdbmod.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.lst\" -e\"${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o\" \"../p16f877a_lcdwdbmod.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/_ext/1472/ReadKeypad.o: ../ReadKeypad.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/ReadKeypad.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/ReadKeypad.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/_ext/1472/ReadKeypad.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/_ext/1472/ReadKeypad.lst\" -e\"${OBJECTDIR}/_ext/1472/ReadKeypad.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/_ext/1472/ReadKeypad.o\" \"../ReadKeypad.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/_ext/1472/ReadKeypad.o"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/ReadKeypad.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/PWMCalculator.o: PWMCalculator.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PWMCalculator.o.d 
	@${RM} ${OBJECTDIR}/PWMCalculator.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/PWMCalculator.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/PWMCalculator.lst\" -e\"${OBJECTDIR}/PWMCalculator.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/PWMCalculator.o\" \"PWMCalculator.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/PWMCalculator.o"
	@${FIXDEPS} "${OBJECTDIR}/PWMCalculator.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/_ext/1472/LCDInit.o: ../LCDInit.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/LCDInit.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/LCDInit.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/_ext/1472/LCDInit.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/_ext/1472/LCDInit.lst\" -e\"${OBJECTDIR}/_ext/1472/LCDInit.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/_ext/1472/LCDInit.o\" \"../LCDInit.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/_ext/1472/LCDInit.o"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/LCDInit.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/PercentDrive.o: PercentDrive.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PercentDrive.o.d 
	@${RM} ${OBJECTDIR}/PercentDrive.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/PercentDrive.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/PercentDrive.lst\" -e\"${OBJECTDIR}/PercentDrive.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/PercentDrive.o\" \"PercentDrive.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/PercentDrive.o"
	@${FIXDEPS} "${OBJECTDIR}/PercentDrive.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/RPMTimer.o: RPMTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RPMTimer.o.d 
	@${RM} ${OBJECTDIR}/RPMTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/RPMTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/RPMTimer.lst\" -e\"${OBJECTDIR}/RPMTimer.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/RPMTimer.o\" \"RPMTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/RPMTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/RPMTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/RPMInterrupt.o: RPMInterrupt.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RPMInterrupt.o.d 
	@${RM} ${OBJECTDIR}/RPMInterrupt.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/RPMInterrupt.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/RPMInterrupt.lst\" -e\"${OBJECTDIR}/RPMInterrupt.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/RPMInterrupt.o\" \"RPMInterrupt.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/RPMInterrupt.o"
	@${FIXDEPS} "${OBJECTDIR}/RPMInterrupt.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/FinalProject.o: FinalProject.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FinalProject.o.d 
	@${RM} ${OBJECTDIR}/FinalProject.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/FinalProject.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/FinalProject.lst\" -e\"${OBJECTDIR}/FinalProject.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/FinalProject.o\" \"FinalProject.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/FinalProject.o"
	@${FIXDEPS} "${OBJECTDIR}/FinalProject.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
else
${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o: ../p16f877a_lcdwdbmod.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.lst\" -e\"${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o\" \"../p16f877a_lcdwdbmod.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/p16f877a_lcdwdbmod.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/_ext/1472/ReadKeypad.o: ../ReadKeypad.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/ReadKeypad.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/ReadKeypad.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/_ext/1472/ReadKeypad.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/_ext/1472/ReadKeypad.lst\" -e\"${OBJECTDIR}/_ext/1472/ReadKeypad.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/_ext/1472/ReadKeypad.o\" \"../ReadKeypad.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/_ext/1472/ReadKeypad.o"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/ReadKeypad.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/PWMCalculator.o: PWMCalculator.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PWMCalculator.o.d 
	@${RM} ${OBJECTDIR}/PWMCalculator.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/PWMCalculator.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/PWMCalculator.lst\" -e\"${OBJECTDIR}/PWMCalculator.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/PWMCalculator.o\" \"PWMCalculator.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/PWMCalculator.o"
	@${FIXDEPS} "${OBJECTDIR}/PWMCalculator.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/_ext/1472/LCDInit.o: ../LCDInit.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/LCDInit.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/LCDInit.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/_ext/1472/LCDInit.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/_ext/1472/LCDInit.lst\" -e\"${OBJECTDIR}/_ext/1472/LCDInit.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/_ext/1472/LCDInit.o\" \"../LCDInit.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/_ext/1472/LCDInit.o"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/LCDInit.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/PercentDrive.o: PercentDrive.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PercentDrive.o.d 
	@${RM} ${OBJECTDIR}/PercentDrive.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/PercentDrive.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/PercentDrive.lst\" -e\"${OBJECTDIR}/PercentDrive.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/PercentDrive.o\" \"PercentDrive.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/PercentDrive.o"
	@${FIXDEPS} "${OBJECTDIR}/PercentDrive.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/RPMTimer.o: RPMTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RPMTimer.o.d 
	@${RM} ${OBJECTDIR}/RPMTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/RPMTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/RPMTimer.lst\" -e\"${OBJECTDIR}/RPMTimer.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/RPMTimer.o\" \"RPMTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/RPMTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/RPMTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/RPMInterrupt.o: RPMInterrupt.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RPMInterrupt.o.d 
	@${RM} ${OBJECTDIR}/RPMInterrupt.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/RPMInterrupt.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/RPMInterrupt.lst\" -e\"${OBJECTDIR}/RPMInterrupt.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/RPMInterrupt.o\" \"RPMInterrupt.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/RPMInterrupt.o"
	@${FIXDEPS} "${OBJECTDIR}/RPMInterrupt.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/FinalProject.o: FinalProject.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FinalProject.o.d 
	@${RM} ${OBJECTDIR}/FinalProject.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/FinalProject.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/FinalProject.lst\" -e\"${OBJECTDIR}/FinalProject.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/FinalProject.o\" \"FinalProject.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/FinalProject.o"
	@${FIXDEPS} "${OBJECTDIR}/FinalProject.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1 -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_PK3=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/FinalProject.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
