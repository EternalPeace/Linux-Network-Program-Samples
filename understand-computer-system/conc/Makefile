CC = gcc

CSAPP_INC = ../include
CSAPP_SRC = ../src

CFLAGS = -O2 -Wall -I $(CSAPP_INC) -I .
LDLIBS = -lpthread

FFORCE = -fforce-mem -Wall -I $(CSAPP_INC)

# NOTE: we expect sharing.c to generate warnings
PROGS =	hello\
	badcnt\
	goodcnt\
	echoclient\
	echoserveri\
	echoservers\
	echoserverp\
	echoservert\
	echoservert_cnt\
	echoservert_pre\
	gethostbyname_ts\
	gethostbyname_r\
	race\
	norace\
	sharing\
	rand\
	rand_r\
	threadunsafe\
	hellobug\
	tfgets-main.o\
	select\
	test

all: $(CSAPP_SRC)/csapp.o $(PROGS)
$(PROGS): $(CSAPP_SRC)/csapp.o 
$(CSAPP_SRC)/csapp.o: $(CSAPP_SRC)/csapp.c $(CSAPP_INC)/csapp.h

# these two programs are compiled with a flag that forces gcc
# to generate RISC-like load, modify, store code for the counter update
goodcnt: goodcnt.c 
	$(CC) $(FFORCE) -o goodcnt goodcnt.c $(CSAPP_SRC)/csapp.o -lpthread

badcnt: badcnt.c
	$(CC) $(FFORCE) -o badcnt badcnt.c $(CSAPP_SRC)/csapp.o -lpthread
	$(CC) $(FFORCE) -S badcnt.c

# Programs that need more than one .o file
echoserveri: echoserveri.o echo.o
echoserverp: echoserverp.o echo.o
echoservert: echoservert.o echo.o
echoservert_cnt: echoservert_cnt.o echo_cnt.o
echoservert_pre: echoservert_pre.o echo_cnt.o sbuf.o
echoservers: echoservers.o echo.o
select: select.o echo.o

clean:
	rm -f $(PROGS) *.o *~
