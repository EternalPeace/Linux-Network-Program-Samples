CFLAGS := -Wall

setext2: setext2.c

.PHONY: clean dist

clean:
	$(RM) setext2 *.o foo

dist:
	$(RM) *.gz *.zip
	tar czf 021512c.tar.gz *.c Makefile
	zip 021512c.zip *.c Makefile
