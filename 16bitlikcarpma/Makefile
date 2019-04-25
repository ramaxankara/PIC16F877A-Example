# MPLAB IDE generated this makefile for use with GNU make.
# Project: carpma16.mcp
# Date: Sun Oct 14 17:07:14 2018

AS = MPASMWIN.exe
CC = 
LD = mplink.exe
AR = mplib.exe
RM = rm

carpma16.cof : carpma16.o
	$(CC) /p16F877A "carpma16.o" /u_DEBUG /z__MPLAB_BUILD=1 /z__MPLAB_DEBUG=1 /o"carpma16.cof" /M"carpma16.map" /W /x

carpma16.o : carpma16.asm ../../../../../../Program\ Files\ (x86)/Microchip/MPASM\ Suite/P16F877A.INC
	$(AS) /q /p16F877A "carpma16.asm" /l"carpma16.lst" /e"carpma16.err" /d__DEBUG=1

clean : 
	$(CC) "carpma16.o" "carpma16.hex" "carpma16.err" "carpma16.lst" "carpma16.cof"

