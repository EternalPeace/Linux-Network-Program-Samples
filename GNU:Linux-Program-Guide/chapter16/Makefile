CFLAGS := -O2 -Wall

all: mem mmcat mmcp showaddr badmem badmem-debug

mem: mem.c

mmcat: mmcat.c

badmem: badmem.c

badmem-debug: badmem.c
	$(CC) -g badmem.c -o badmem -lefence

.PHONY: clean dist

clean:
	$(RM) mem mmcat badmem core

dist: clean
	tar czf 021516c.tar.gz *.c Makefile tools
