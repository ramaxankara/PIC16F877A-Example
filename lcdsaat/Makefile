# MPLAB IDE generated this makefile for use with GNU make.
# Project: lcdsaat.mcp
# Date: Tue Apr 30 11:11:24 2019

AS = MPASMWIN.exe
CC = 
LD = mplink.exe
AR = mplib.exe
RM = rm

lcdsaat.cof : lcdsaat.o
	$(CC) /p16F877A "lcdsaat.o" /u_DEBUG /z__MPLAB_BUILD=1 /z__MPLAB_DEBUG=1 /o"lcdsaat.cof" /M"lcdsaat.map" /W /x

lcdsaat.o : lcdsaat.asm ../../../../../Program\ Files\ (x86)/Microchip/MPASM\ Suite/P16F877A.INC
	$(AS) /q /p16F877A "lcdsaat.asm" /l"lcdsaat.lst" /e"lcdsaat.err" /d__DEBUG=1

clean : 
	$(CC) "lcdsaat.o" "lcdsaat.hex" "lcdsaat.err" "lcdsaat.lst" "lcdsaat.cof"

