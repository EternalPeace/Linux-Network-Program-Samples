CFLAGS := -Wall

OBJS := lpudated lpudated-rc lpudated-sig

all: $(OBJS)

lpudated: lpudated.c

lpudated-rc: lpudated-rc.c

lpudated-sig: lpudated-sig.c

.PHONY: clean dist

clean:
	$(RM) $(OBJS) core *.o *~ *.gz

dist: clean
	tar czf 021518c.tar.gz *.c Makefile
