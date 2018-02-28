CC=gcc
CFLAGS=-Wall -O2

ISADIR = ../misc
YAS=$(ISADIR)/yas
YIS=$(ISADIR)/yis
PIPE=../pipe/pipe_tty
SEQ=../seq/seq_tty
SEQ+ =../seq/seq+_tty

DISTDIR=../../../im/arch/sim
BOOKDIR=../../../../../code/arch/y86-code

YOFILES = asum.yo asumr.yo codefrags.yo cjr.yo frag.yo j-cc.yo poptest.yo pushquestion.yo pushtest.yo prog1.yo prog2.yo prog3.yo prog4.yo prog5.yo prog6.yo prog7.yo prog8.yo prog9.yo encode.yo decode.yo ret-hazard.yo seq-eg.yo

PIPEFILES = asum.pipe asumr.pipe cjr.pipe j-cc.pipe poptest.pipe pushquestion.pipe pushtest.pipe prog1.pipe prog2.pipe prog3.pipe prog4.pipe prog5.pipe prog6.pipe prog7.pipe ret-hazard.yo

SEQFILES = asum.seq asumr.seq cjr.seq j-cc.seq poptest.seq pushquestion.seq pushtest.seq prog1.seq prog2.seq prog3.seq prog4.seq prog5.seq prog6.seq prog7.seq

SEQ+FILES = asum.seq+ asumr.seq+ cjr.seq+ j-cc.seq+ poptest.seq+ pushquestion.seq+ pushtest.seq+ prog1.seq+ prog2.seq+ prog3.seq+ prog4.seq+ prog5.seq+ prog6.seq+ prog7.seq+

.SUFFIXES:
.SUFFIXES: .c .s .o .ys .yo .yis .pipe .seq .seq+ .txt

all: $(YOFILES) asum.yis prog1.txt prog2.txt prog3.txt prog4.txt prog5.txt prog6.txt prog7.txt prog8.txt prog9.txt seq-eg.txt

test: pipe seq seq+

pipe: $(PIPEFILES)
	grep "ISA Check" *.pipe
	rm $(PIPEFILES)

seq: $(SEQFILES)
	grep "ISA Check" *.seq
	rm $(SEQFILES)

seq+: $(SEQ+FILES)
	grep "ISA Check" *.seq+
	rm $(SEQ+FILES)

.c.s:
	$(CC) $(CFLAGS) -S $*.c

.ys.yo:
	$(YAS) $*.ys

# Extracting code fragments
.yo.txt:
	egrep "\|   #|:[ a-f0-9]*\|" $*.yo | \
	perl -ne "s/:[ a-f0-9]+\|/:/; s/[ ]*\|[ ]*#/#/; print;" > $*.txt

.yo.yis: $(YIS)
	$(YIS) $*.yo > $*.yis

.yo.pipe: $(PIPE)
	$(PIPE) -t $*.yo  > $*.pipe

.yo.seq: $(SEQ)
	$(SEQ) -t $*.yo > $*.seq

.yo.seq+: $(SEQ+)
	$(SEQ+) -t $*.yo > $*.seq+

dist:
	cp -p README asum.ys asumr.ys cjr.ys j-cc.ys poptest.ys \
		pushquestion.ys pushtest.ys prog1.ys prog2.ys prog3.ys \
		prog4.ys prog5.ys prog6.ys prog7.ys prog8.ys \
		ret-hazard.ys \
		$(DISTDIR)/y86-code
	cp -p Makefile.sim $(DISTDIR)/y86-code/Makefile

book:
	cp -p Makefile frag.ys encode.ys prog9.ys codefrags.ys seq-eg.ys decode.ys \
		$(BOOKDIR)/y86-code
	cp -p asum.ys $(BOOKDIR)/y86-code/ycode.sa

clean:
	rm -f *.o *.yis *.yuc *~ *.yo *.pipe *.seq *.seq+
