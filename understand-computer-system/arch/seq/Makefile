CC=gcc
CFLAGS=-Wall -O2

HCL2C=../misc/hcl2c

ISADIR=../misc
TKDIR=../misc
INC= -I$(ISADIR)/ -I/usr/local/include/

XLIB=
TKLIBS = -ltk -ltcl -lm $(XLIB)
# TKLIBS = -ltk83 -ltcl83 -lm $(XLIB)

VERSION=std

.SUFFIXES: .hcl .c .o

.hcl.c:
	$(HCL2C) < $*.hcl > $*.c

.c.o:
	$(CC) $(CFLAGS) $(INC) -c $*.c

all: tty

tty: seq_tty seq+_tty

gui: seq_tk seq+_tk

test: seq_tty seq+_tty
	(cd ../y86-code; make seq)
	(cd ../ptest; make SIM=../seq/seq_tty)
	(cd ../y86-code; make seq+)
	(cd ../ptest; make SIM=../seq/seq+_tty)

seq_tk: seq_wish gen_tk
	./gen_tk > seq_tk
	chmod +x seq_tk

seq+_tk: seq+_wish gen_tk
	./gen+_tk > seq+_tk
	chmod +x seq+_tk

isa.o: $(ISADIR)/isa.h $(ISADIR)/isa.c
	$(CC) $(CFLAGS) $(INC) -c $(ISA)/isa.c -o isa.o

sim.o: sim.c $(ISADIR)/isa.h sim.h
	$(CC) $(CFLAGS) $(INC) -c sim.c

isa-gui.o: $(ISADIR)/isa.h $(ISADIR)/isa.c
	$(CC) $(CFLAGS) $(INC) -DHAS_GUI -c $(ISADIR)/isa.c -o isa-gui.o

sim-gui.o: sim.c $(ISADIR)/isa.h sim.h
	$(CC) $(CFLAGS) $(INC) -DHAS_GUI -c sim.c -o sim-gui.o

seq_tty.o: seq_tty.c $(ISADIR)/isa.h sim.h
	$(CC) $(CFLAGS) $(INC) -c seq_tty.c

tk_support.o: tk_support.c sim.h $(ISADIR)/isa.h
	$(CC) $(CFLAGS) $(INC) -c tk_support.c 

tty.a: seq_tty.o sim.o $(ISADIR)/isa.o
	rm -f tty.a
	ar -rs tty.a seq_tty.o sim.o $(ISADIR)/isa.o

seq_tty: seq-$(VERSION).o tty.a
	$(CC) $(CFLAGS) -o seq_tty seq-$(VERSION).o tty.a
	rm seq-$(VERSION).o

seq+_tty: seq+-$(VERSION).o tty.a
	$(CC) $(CFLAGS) -o seq+_tty seq+-$(VERSION).o tty.a
	rm seq+-$(VERSION).o

wish.a: tk_support.o $(TKDIR)/tkAppInit.o sim-gui.o isa-gui.o
	rm -f wish.a
	ar -rs wish.a tk_support.o $(TKDIR)/tkAppInit.o sim-gui.o isa-gui.o

seq_wish: seq-$(VERSION).o wish.a
	$(CC) $(CFLAGS) -o seq_wish seq-$(VERSION).o wish.a $(TKLIBS)
	rm seq-$(VERSION).o

seq+_wish: seq+-$(VERSION).o wish.a
	$(CC) $(CFLAGS) -o seq+_wish seq+-$(VERSION).o wish.a $(TKLIBS)
	rm seq+-$(VERSION).o

clean:
	rm -f *.o *.a *.exe *~ seq_tk seq_tty seq_wish core seq+_wish seq-*.c


