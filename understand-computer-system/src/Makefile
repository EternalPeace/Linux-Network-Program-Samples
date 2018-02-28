CC = gcc
CFLAGS = -O2 -Wall
INC = ../include
LIB = ../lib

OBJS = clock.o fcyc.o csapp.o lsquare.o cpe.o

all: $(LIB)/libcsapp.a

# This file must be compiled with gcc due to embedded assembly
clock.o: clock.c $(INC)/clock.h
	gcc $(CFLAGS) -c clock.c -I$(INC)

fcyc.o: fcyc.c $(INC)/fcyc.h $(INC)/clock.h
	$(CC) $(CFLAGS) -c fcyc.c -I$(INC)

csapp.o: $(INC)/csapp.h csapp.c
	$(CC) $(CFLAGS) -c csapp.c -I$(INC)

lsquare.o: $(INC)/lsquare.h lsquare.c
	$(CC) $(CFLAGS) -c lsquare.c -I$(INC)

cpe.o: $(INC)/clock.h $(INC)/clock.h $(INC)/cpe.h cpe.c
	$(CC) $(CFLAGS) -c cpe.c -I$(INC)

# 
# Sparc cycle counter examples (for future reference)
# 
#sparc_tick.o: sparc_tick.s
#	as -xarch=v8plus sparc_tick.s
#
# This tests the get_tick routine in sparc_tick.s
#sparc_tick_driver: sparc_tick_driver.c sparc_tick.o
#	$(CC) $(CFLAGS) -o sparc_tick_driver sparc_tick_driver.c sparc_tick.o

$(LIB)/libcsapp.a: $(OBJS)
	ar rcs $(LIB)/libcsapp.a $(OBJS)

clean:
	rm -f sparc_tick_driver $(OBJS) *~
