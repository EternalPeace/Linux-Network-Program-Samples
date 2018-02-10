CFLAGS := -ggdb -Wall

all: debugme struct callstk

debugme: debugme.c

struct: struct.c

callstk: callstk.c

.PHONY: dist clean

clean:
	rm -rf debugme struct callstk core *.gz

dist: clean
	tar czf 021508c.tar.gz *.c Makefile
