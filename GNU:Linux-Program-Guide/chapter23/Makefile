CFLAGS := -Wall
LDFLAGS := -lcurses

all: noecho setraw getcaps new_getcaps

noecho: noecho.c

setraw: setraw.c

getcaps: getcaps.c
	$(CC) $(CFLAGS) getcaps.c -o getcaps $(LDFLAGS)

new_getcaps: new_getcaps.c
	$(CC) $(CFLAGS) new_getcaps.c -o new_getcaps $(LDFLAGS)

.PHONY: clean dist

clean:
	$(RM) noecho setraw getcaps new_getcaps *.0 *~ core *.gz

dist: clean
	tar czf 021523c.tar.gz *.c Makefile
