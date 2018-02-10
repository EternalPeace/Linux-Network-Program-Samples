# Sample Makefile for Chapter 4

howdy: howdy.o helper.o helper.h
	gcc howdy.o helper.o -o howdy

helper.o: helper.c helper.h
	gcc -c helper.c

howdy.o: howdy.c
	gcc -c howdy.c

hello: hello.c
	gcc hello.c -o hello

all: howdy hello

clean:
	rm howdy hello *.o

