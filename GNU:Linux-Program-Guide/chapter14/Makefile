CFLAGS := -Wall

OBJS := thrdcreat thrdcancel mutex

all:  $(OBJS)

thrdcreat: thrdcreat.c
	$(CC) $(CFLAGS) thrdcreat.c -o thrdcreat -lpthread

thrdcancel: thrdcancel.c
	$(CC) $(CFLAGS) thrdcancel.c -o thrdcancel -lpthread

mutex: mutex.c
	$(CC) $(CFLAGS) mutex.c -o mutex -lpthread

.PHONY: clean dist

clean:
	$(RM) *.o *~ core $(OBJS)

dist: clean
	$(RM) *.gz
	tar czf 021514.tar.gz *.c Makefile
