#
# Internetworking with TCP/IP, Volume III example code Makefile
#
#	David L Stevens, Internetworking Research Group at Purdue
#	Tue Sep 17 19:40:42 EST 1991
#

INCLUDE =

CC = CL
INCLUDE= /IC:\msdev\include
DEFS =	/D_CONSOLE /DWIN32 /D_MT
CFLAGS = /MT /nologo $(DEFS) $(INCLUDE)
LDFLAGS = /link /subsystem:console

HDR =
SRC = consum.cpp

OBJ = consum.obj conUDP.obj consock.obj errexit.obj

consum.exe: consum.cpp
	$(CC) $(CFLAGS) -o $@ $*.cpp

clean: FRC
	del *.bak
	del *.exe
	del *.obj

install: all FRC
	@echo "Your installation instructions here."

FRC:
	
