CC=gcc
CFLAGS=-Wall -O2
LCFLAGS=-O2
LEX = flex
YACC=bison
LEXLIB = -lfl
YAS=./yas
TKVER=8.0

all: yis yas hcl2c mux4

gui: tkAppInit.o

yas-grammar.o: yas-grammar.lex
	$(LEX) yas-grammar.lex
	mv lex.yy.c yas-grammar.c
	$(CC) $(LCFLAGS) -c yas-grammar.c

isa.o: isa.c isa.h
	$(CC) $(CFLAGS) -c isa.c

yas.o: yas.c yas.h isa.h
	$(CC) $(CFLAGS) -c yas.c

yas: yas.o yas-grammar.o isa.o
	$(CC) $(CFLAGS) yas-grammar.o yas.o isa.o ${LEXLIB} -o yas

yis.o: yis.c isa.h
	$(CC) $(CFLAGS) -c yis.c

yis: yis.o isa.o
	$(CC) $(CFLAGS) yis.o isa.o -o yis

hcl2c: hcl.lex hcl.y node.c
	$(LEX) hcl.lex
	$(YACC) -d hcl.y
	$(CC) $(LCFLAGS) node.c lex.yy.c hcl.tab.c -o hcl2c

tkAppInit.o: tkAppInit$(TKVER).c
	$(CC) $(CFLAGS) $(INC) -c tkAppInit$(TKVER).c -DCUSTOMIZE_TK \
		-o tkAppInit.o

mux4:	mux4.hcl
	./hcl2c < mux4.hcl > mux4.c
	$(CC) $(CFLAGS) mux4.c -o mux4


clean:
	rm -f *.o *.exe yis yas hcl2c *~ yas-grammar.o yas-grammar.c hcl.tab.* lex.* 


