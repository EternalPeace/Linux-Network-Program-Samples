CC = gcc
ICS = ..
CFLAGS = -Wall -O2

PROGS = hello

all: $(PROGS)

hello: hello.c
	$(CC) $(CFLAGS) -o hello hello.c
	$(CC) $(CFLAGS) -S hello.c
	objdump -d hello > hello.S


clean:
	rm -f $(PROGS) *.o *.s *.S *~


