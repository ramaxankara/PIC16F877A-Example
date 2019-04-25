# MPLAB IDE generated this makefile for use with GNU make.
# Project: pwm.mcp
# Date: Mon Nov 26 15:50:03 2018

AS = MPASMWIN.exe
CC = 
LD = mplink.exe
AR = mplib.exe
RM = rm

pwm.cof : pwm.o
	$(CC) /p16F877A "pwm.o" /u_DEBUG /z__MPLAB_BUILD=1 /z__MPLAB_DEBUG=1 /o"pwm.cof" /M"pwm.map" /W /x

pwm.o : pwm.asm ../../../../../Program\ Files\ (x86)/Microchip/MPASM\ Suite/P16F877A.INC
	$(AS) /q /p16F877A "pwm.asm" /l"pwm.lst" /e"pwm.err" /d__DEBUG=1

clean : 
	$(CC) "pwm.o" "pwm.hex" "pwm.err" "pwm.lst" "pwm.cof"

