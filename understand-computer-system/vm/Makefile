CC = gcc
CSAPP_INC = ../include
CSAPP_SRC = ../src

CFLAGS = -Wall -O2 -I $(CSAPP_INC) -I .
LDLIBS = -lpthread

# Note: we expect compiler warnings when we compile fragments.c
PROGS = fragments.o\
	mmapcopy\
	staticsize\
	dynamicsize\
	malloctest\
	sbrk\

all: $(CSAPP_SRC)/csapp.o $(PROGS)

malloctest: malloc.o memlib.o

$(PROGS): $(CSAPP_SRC)/csapp.o

$(CSAPP_SRC)/csapp.o: $(CSAPP_SRC)/csapp.c $(CSAPP_INC)/csapp.h

clean:
	rm -f $(PROGS) *.o *~


