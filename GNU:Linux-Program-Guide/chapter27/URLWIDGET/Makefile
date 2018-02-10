all: test

test:	test.c fetch_url.c URL.c URLP.h URL.h
	cc -o test test.c fetch_url.c URL.c -lX11 -lXaw

clean:
	rm -f test
