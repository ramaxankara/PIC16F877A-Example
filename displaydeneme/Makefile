# MPLAB IDE generated this makefile for use with GNU make.
# Project: display.mcp
# Date: Fri Nov 02 14:17:09 2018

AS = MPASMWIN.exe
CC = 
LD = mplink.exe
AR = mplib.exe
RM = rm

displaydeneme.cof : displaydeneme.o
	$(CC) /p16F877A "displaydeneme.o" /u_DEBUG /z__MPLAB_BUILD=1 /z__MPLAB_DEBUG=1 /o"displaydeneme.cof" /M"displaydeneme.map" /W /x

displaydeneme.o : displaydeneme.asm ../../../../../../Program\ Files\ (x86)/Microchip/MPASM\ Suite/P16F877A.INC
	$(AS) /q /p16F877A "displaydeneme.asm" /l"displaydeneme.lst" /e"displaydeneme.err" /d__DEBUG=1

clean : 
	$(CC) "displaydeneme.o" "displaydeneme.hex" "displaydeneme.err" "displaydeneme.lst" "displaydeneme.cof"

