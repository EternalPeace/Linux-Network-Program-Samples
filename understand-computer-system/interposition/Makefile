CC = gcc
CFLAGS = -O2 -Wall

all: hellor hellol helloc

########################
# Load-time interposition
########################
hellor: hello.c
	$(CC) $(CFLAGS) -DRUNTIME -shared -o mymalloc.so mymalloc.c
	$(CC) $(CFLAGS) -o hellor hello.c

runr:
	(LD_PRELOAD="/usr/lib/libdl.so ./mymalloc.so" ./hellor)	

#########################
# Link-time interposition
#########################
hellol: hello.c mymalloc.c
	$(CC) $(CFLAGS) -DLINKTIME -c mymalloc.c
	$(CC) $(CFLAGS) -Wl,--wrap,malloc -Wl,--wrap,free \
	-o hellol hello.c mymalloc.o

runl:
	./hellol

############################
# Compile-time interposition
############################
helloc: hello.c mymalloc.c
	$(CC) $(CFLAGS) -DCOMPILETIME -c mymalloc.c
	$(CC) $(CFLAGS) -I. -o helloc hello.c mymalloc.o

runc:
	./helloc



clean:
	rm -f *~ hellor hellol helloc *.so *.o


