CC = gcc
CPP = cpp
ICS = ..
CFLAGS = -Wall -O2 

CSAPPDIR = ..

CINC = -I$(CSAPPDIR)/include
CSAPPLIB = $(CSAPPDIR)/lib/libcsapp.a


PROGS = abs.s\
	align.s\
	arith.s\
	array.s\
        bufovf\
	branch\
	calleesave.s\
	cc.s\
	code.s\
	ctest.s\
	decimal5.s\
	decode1-ans.s\
	dw.s\
	exchange.s\
	fib.s\
	fixarray.s\
	for.s\
	fp.s\
	fpfunct2-ans.s\
	fpgreater-ans.s\
	frame.s\
	muldiv.s\
	nodestruct.s\
	nodeunion.s\
	nodeuniontag.s\
	okmul\
	pointer\
	prog\
	rect.o\
	shift.s\
	simple-if.s\
	simple.s\
	struct2.s\
	structure.s\
	swapadd.s\
	switch-ans.s\
	switch.s\
	union.s\
	union2.s\
	while.s\


all: $(PROGS)

pointer: pointer.c
	$(CC) -Wall -O2 pointer.c -o pointer
	./pointer > pointer.s
	objdump -d pointer > pointer-exe.d

prog: code.c main.c
	$(CC) -Wall -O2 -S code.c
	$(CC) -Wall -O2 -c code.c
	$(CC) $(CFLAGS) -o prog code.o main.c
	objdump -d code.o > code-rel.d
	objdump -d prog > code-exe.d

branch: branch.c
	$(CC) -Wall -O2 -S branch.c
	$(CC) -Wall -O2 -c branch.c
	$(CC) -Wall -O2 -o branch branch.c
	objdump -d branch.o > branch-rel.d
	objdump -d branch > branch-exe.d

bufovf: bufovf.c
	$(CC) -Wall -O2 bufovf.c -o bufovf
	objdump -d bufovf > bufovf-exe.d


okmul: okmul.c
	$(CC) -Wall -O2 -S okmul.c
	$(CC) -Wall -O2 -o okmul okmul.c

moore: moore.c
	$(CC) $(CFLAGS) -o moore moore.c $(CINC) -lm $(CSAPPLIB)

exe-data: exe-data.c
	$(CC) -Wall -g -o exe-data exe-data.c 

.c.s:
	$(CC) $(CFLAGS) -S $*.c

.c.o:
	$(CC) $(CFLAGS) -c $*.c

clean:
	rm -f $(PROGS) *.o *~


