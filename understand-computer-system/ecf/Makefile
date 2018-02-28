CC = gcc
CSAPP_INC = ../include
CSAPP_SRC = ../src
CFLAGS = -Wall -O2 -I $(CSAPP_INC) -I .
LDLIBS = -lpthread

PROGS = fragments.o\
	procmask\
	counterprob\
	waitprob1\
	fork1\
	fork2\
	fork3\
	forkprob1\
	forkprob2\
	forkprob3\
	forkprob4\
	forkprob5\
	forkprob6\
	forkprob7\
	setjmp\
	alarm\
	restart\
	signal1\
	signal2\
	signal3\
	signal4\
	sigint1\
	shellex\
	kill\
	psignal\
	getpid\
	fork\
	waitpid1\
	waitpid2\
	myecho\
	stack\
	sigfpe\
	sigbus\
	sigsegv\
	forkprob0\
	snooze\
	test\
	pg\
	pgchild\

all: $(CSAPP_SRC)/csapp.o $(PROGS)

$(PROGS): $(CSAPP_SRC)/csapp.o

$(CSAPP_SRC)/csapp.o: $(CSAPP_SRC)/csapp.c $(CSAPP_INC)/csapp.h

clean:
	rm -f $(PROGS) *.o *~


