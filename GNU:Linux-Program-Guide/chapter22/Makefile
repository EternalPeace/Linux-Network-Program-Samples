CFLAGS := -Wall

all:	broadcast listen

broadcast:	broadcast.c

listen:	listen.c

.PHONY: clean dist

clean:
	$(RM) broadcast listen *.o

dist: clean
	tar czf 021522.tar.gz *.c Makefile

