CC = gcc
CFLAGS = -Wall -O2 -I .

PROGS = show-bytes\
	eg-dis  \
	logic \
	bisbic \
	sum\
	extend\
	bad-sum\
	inplace-swap.o\
	casting.o\
	uhp-ans.o\
	rbyte-ans.o\
	rshift-templates.o\
	puzzle.o\
	floatge-template.o\
	wordsize\
	printf\
	fcomp-O\
	fcomp-g\
	fcomp-mem\
	fcomp-ld\
	sizes\

all: $(PROGS)

eg-dis: eg-dis.c
	$(CC) $(CFLAGS) eg-dis.c -o eg-dis
	objdump -d eg-dis > eg-dis.d
	cp -p eg-dis.d eg-dis2.d

fcomp-O: fcomp.c
	$(CC) -Wall -O2 fcomp.c -o fcomp-O
	./fcomp-O 10 | grep "test1" > fcomp-O.out

fcomp-g: fcomp.c
	$(CC) -Wall -g fcomp.c -o fcomp-g
	./fcomp-g 10 | grep "test1" > fcomp-g.out

fcomp-mem: fcomp.c
	$(CC) -Wall -O2 -ffloat-store fcomp.c -o fcomp-mem
	./fcomp-mem 10 | egrep "test[12] " > fcomp-mem.out

fcomp-mem.s: fcomp.c
	$(CC) -Wall -O2 -ffloat-store fcomp.c -S -o fcomp-mem.s

fcomp-ld: fcomp.c
	$(CC) -Wall -O2 fcomp.c -o fcomp-ld
	./fcomp-ld 10 | grep "test3 " > fcomp-ld.out

clean:
	rm -f $(PROGS) *.o *~ core


