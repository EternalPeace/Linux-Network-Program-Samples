CC=gcc
CFLAGS=-Wall -O2

HCL2C=../misc/hcl2c

ISADIR=../misc
TKDIR=../misc
INC= -I$(ISADIR)/ -I/usr/local/include/

XLIB=
TKLIBS = -ltk -ltcl -lm $(XLIB)
# TKLIBS = -ltk83 -ltcl83 -lm $(XLIB)

.SUFFIXES: .hcl .c .o

VERSION=std

.hcl.c:
	$(HCL2C) < $*.hcl > $*.c

.c.o:
	$(CC) $(CFLAGS) $(INC) -c $*.c

all: tty

tty: pipe_tty

gui: pipe_tk

test: pipe_tty
	(cd ../y86-code; make pipe)
	(cd ../ptest; make SIM=../pipe/pipe_tty)

pipe_tk: pipe_wish gen_tk
	./gen_tk > pipe_tk
	chmod +x pipe_tk

isa.o: $(ISADIR)/isa.h $(ISADIR)/isa.c
	$(CC) $(CFLAGS) $(INC) -c $(ISADIR)/isa.c -o isa.o

sim.o: sim.c $(ISADIR)/isa.h pipeline.h stages.h sim.h
	$(CC) $(CFLAGS) $(INC) -c sim.c

isa-gui.o: $(ISADIR)/isa.h $(ISADIR)/isa.c
	$(CC) $(CFLAGS) $(INC) -DHAS_GUI -c $(ISADIR)/isa.c -o isa-gui.o

sim-gui.o: sim.c $(ISADIR)/isa.h pipeline.h stages.h sim.h
	$(CC) $(CFLAGS) $(INC) -DHAS_GUI -c sim.c -o sim-gui.o

pipeline.o: pipeline.c pipeline.h
	$(CC) $(CFLAGS) $(INC) -c pipeline.c

stages.o: stages.c stages.h sim.h $(ISADIR)/isa.h
	$(CC) $(CFLAGS) $(INC) -c stages.c

stages-gui.o: stages.c stages.h sim.h $(ISADIR)/isa.h
	$(CC) $(CFLAGS) $(INC) -DHAS_GUI -c stages.c -o stages-gui.o

pipe_tty.o: pipe_tty.c $(ISADIR)/isa.h stages.h sim.h pipeline.h
	$(CC) $(CFLAGS) $(INC) -c pipe_tty.c

tk_support.o: tk_support.c pipeline.h sim.h stages.h $(ISADIR)/isa.h
	$(CC) $(CFLAGS) $(INC) -c tk_support.c 

tty.a: pipe_tty.o sim.o pipeline.o stages.o isa.o new_M_valA.o new_D_icode.o wb.o
	rm -f tty.a
	ar -rs tty.a pipe_tty.o sim.o pipeline.o stages.o isa.o new_M_valA.o new_D_icode.o wb.o

pipe_tty: pipe-$(VERSION).o tty.a
	$(CC) $(CFLAGS) -o pipe_tty pipe-$(VERSION).o tty.a
	rm -f pipe-$(VERSION).o

wish.a: tk_support.o $(TKDIR)/tkAppInit.o pipe-$(VERSION).o sim-gui.o stages-gui.o isa-gui.o new_M_valA.o new_D_icode.o wb.o
	rm -f wish.a
	ar -rs wish.a tk_support.o $(TKDIR)/tkAppInit.o pipeline.o sim-gui.o stages-gui.o\
		isa-gui.o new_M_valA.o new_D_icode.o wb.o

pipe_wish: pipe-$(VERSION).o wish.a
	$(CC) $(CFLAGS) -o pipe_wish pipe-$(VERSION).o wish.a $(TKLIBS)
	rm -f pipe-$(VERSION).o


clean:
	rm -f *.o *.a *.exe *~ pipe_tk pipe_tty pipe_wish core pipe-*.c


