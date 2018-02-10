PROGS := \
	opipe piperw popen newrw newfifo rdfifo wrfifo \
	mkq qsnd qrd qctl mksem sctl \
	mkshm atshm opshm wrshm rdshm 

CFLAGS := -Wall

.c.o :
	$(CC) $(CFLAGS) 

all : $(PROGS)

opipe : opipe.c

piperw : piperw.c

popen : popen.c

newrw : newrw.c

newfifo : newfifo.c

rdfifo : rdfifo.c

wrfifo : wrfifo.c

mkq : mkq.c

qsnd : qsnd.c

qrd : qrd.c

qctl : qctl.c

mksem : mksem.c

sctl : sctl.c

#
# These programs won't compile without complaing that including
# <ipc.h> requires the use of _XOPEN_SOURCE
#

mkshm : mkshm.c

atshm : atshm.c

opshm : opshm.c

wrshm : wrshm.c

.PHONY: clean dist

clean:
	$(RM) $(PROGS) core *.o *~ opshm.out fifo1

dist:
	tar czf 021517cd.tar.gz *.c Makefile
	zip 021517art.zip *.pcx
