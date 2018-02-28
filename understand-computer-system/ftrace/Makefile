CC = gcc
CFLAGS = -Wall -O2

FILES = ftrace hello hello-static

all: $(FILES)

ftrace: ftrace.o elf.o debug.o

ftrace.o: ftrace.c ftrace.h syscallent.h
elf.o: elf.c elf.h
debug.o: debug.c debug.h

hello-static: hello.c
	$(CC) $(CFLAGS) -static -o hello-static hello.c

disasm:
	objdump -x -s hello > hello.d.all
	objdump -d hello > hello.d.text
	objdump -t hello > hello.d.symtab
	objdump -T hello > hello.d.dsymtab

clean:
	rm -f $(FILES) hello.d.* *.o *.out *~
