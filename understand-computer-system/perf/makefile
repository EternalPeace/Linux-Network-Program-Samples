CC = gcc
CFLAGS = -Wall -O2 -I .

PROGS = clock.o\
	time_p.o\
	tod

all: $(PROGS)

# Object file dependencies
clock.o: clock.c clock.h

clean:
	rm -f $(PROGS) *.o *~


