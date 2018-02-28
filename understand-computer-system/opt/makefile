CC = gcc
GFLAGS = -pg 
INC = ../include
CFLAGS = -Wall -O2 -I. -I$(INC)
LIB = ../lib
LIBCSAPP = $(LIB)/libcsapp.a

PROGS = fragments.o\
	twiddle.o\
	swap.o\
	func.o\
	vsum.o\
	strfuns.o\
	inner.o\
	absval.o\
	max.o\
	deref.o\
	combine-ans.o\
	combineprod.o\
	combinesum.o\
	list\
	fact\
	copy\
	inneri\
	isbench\
	ipbench\
	dictionary\
#	lower-linear.out\
#	lower-exp.out\


all: $(PROGS)

# Driver programs that test various modules
copy: copy.o $(LIBCSAPP)
	$(CC) $(CFLAGS) copy.o $(LIBCSAPP) -o copy

lower-linear.out: lower
	./lower > lower-linear.out

lower-exp.out: lower
	./lower x > lower-exp.out

lower: lower.c $(LIBCSAPP)
	$(CC) $(CFLAGS) lower.c $(LIBCSAPP) -o lower

list: list.o   $(LIBCSAPP)
	$(CC) $(CFLAGS)  list.o   $(LIBCSAPP) -o list

fact: fact.o   $(LIBCSAPP)
	$(CC) $(CFLAGS)  fact.o   $(LIBCSAPP) -o fact

copy2d: copy2d.c $(LIBCSAPP)
	$(CC) $(CFLAGS)  copy2d.c  $(LIBCSAPP) -o copy2d

opt-meas: opt-meas.c $(LIBCSAPP) 
	$(CC) $(CFLAGS)  opt-meas.c  $(LIBCSAPP)  -o opt-meas

inneri: $(INC)/lsquare.h vec.h inner.h inner.c innerbench.c vec.c $(LIBCSAPP)
	$(CC) $(CFLAGS) -DINT  -o inneri inner.c innerbench.c vec.c \
	  $(LIBCSAPP)
	#
	$(CC) $(CFLAGS) -c inner.c
	$(CC) $(CFLAGS) -S inner.c

isbench:   vec.h combine.h combine.c benchmark.c \
	vec.c $(LIBCSAPP)
	$(CC) $(CFLAGS) -DSUM -DINT -o isbench benchmark.c combine.c vec.c \
	  $(LIBCSAPP)
	#
	$(CC) $(CFLAGS) -DSUM -DINT -S combinesum.c

ipbench: $(LIBCSAPP)   vec.h combine.h combine.c benchmark.c \
	vec.c combineprod.c
	$(CC) $(CFLAGS) -DPROD -DINT -o ipbench benchmark.c combine.c vec.c \
	 $(LIBCSAPP) 
	#
	$(CC) $(CFLAGS) -DPROD -DINT -S combineprod.c

fsbench:   vec.h combine.h combine.c benchmark.c \
	vec.c $(LIBCSAPP)
	$(CC) $(CFLAGS) -DSUM -DFLOAT -o fsbench benchmark.c combine.c vec.c \
	  $(LIBCSAPP)
	#
	$(CC) $(CFLAGS) -DSUM -DFLOAT -S combinesum.c

fpbench: $(LIBCSAPP)   vec.h combine.h combine.c benchmark.c \
	vec.c combineprod.c
	$(CC) $(CFLAGS) -DPROD -DFLOAT -o fpbench benchmark.c combine.c vec.c \
	 $(LIBCSAPP) 
	#
	$(CC) $(CFLAGS) -DPROD -DFLOAT -S combineprod.c


absval.o: absval.c
	$(CC) $(CFLAGS) -c absval.c
	$(CC) $(CFLAGS) -S absval.c

deref.o: deref.c
	$(CC) $(CFLAGS) -c deref.c
	$(CC) $(CFLAGS) -S deref.c

combine-ans.o: combine-ans.c
	$(CC) $(CFLAGS) -c combine-ans.c
	$(CC) $(CFLAGS) -S combine-ans.c

options.o: options.c options.h
	$(CC) $(CFLAGS) -c options.c

max: max.c
	$(CC) $(CFLAGS) -I$(INC) max.c $(LIBCSAPP) -o max

max.s: max.c
	$(CC) $(CFLAGS) -S max.c

dictionary: dictionary.c options.o
	$(CC) $(CFLAGS) dictionary.c options.o -o dictionary

dictionary-pg: dictionary.c options.c
	$(CC) $(CFLAGS) $(GFLAGS) dictionary.c options.c -o dictionary-pg

clean:
	rm -f $(PROGS) *.o *~



