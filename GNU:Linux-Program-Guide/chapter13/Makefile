CFLAGS := -Wall -O2 

PROGS =	\
	prpids \
	ids \
	getname \
	system \
	resusg1 \
	resusg2 \
	child \
	execve \
	waiter \
	killer \
	abort \
	fkill \
	block \
	pending

all: $(PROGS)

prpids: prpids.c

ids: ids.c

getname: getname.c

resusg1: resusg1.c

resusg2: resusg2.c

system: system.c

child: child.c

execve: execve.c

waiter: waiter.c

killer: killer.c

abort: abort.c

fkill: fkill.c

block: block.c

pending: pending.c

.PHONY : clean dist

dist : clean
	tar czf 02152c.tar.gz *.c Makefile

clean:
	$(RM) $(PROGS) *.o core *.zip *.gz
