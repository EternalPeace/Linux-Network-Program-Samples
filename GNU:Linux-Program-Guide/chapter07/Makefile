CFLAGS := -Wall

all: yo prn_env

yo:	yo.c

prn_env: prn_env.c

.PHONY: clean dist

clean:
	$(RM) yo prn_env *.o core

dist: clean
	tar czf 021507c.tar.gz *.c Makefile

