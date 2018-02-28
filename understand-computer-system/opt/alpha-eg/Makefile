CC = cc

CSAPP=./csapp-alpha
INC = $(CSAPP)/include
CFLAGS = -O2 -I. -I$(INC)
LIBCSAPP = $(CSAPP)/lib/libcsapp.a

all: opt-meas

opt-meas: opt-meas.c
	$(CC) $(CFLAGS) -o opt-meas opt-meas.c -I$(INC) $(LIBCSAPP)

opt-meas.s: opt-meas.c
	$(CC) $(CFLAGS) -S opt-meas.c

opt-meas-p: opt-meas-p.c
	$(CC) $(CFLAGS) -o opt-meas-p opt-meas-p.c -I$(INC) $(LIBCSAPP)

opt-meas-p.s: opt-meas-p.c
	$(CC) $(CFLAGS) -S opt-meas-p.c


clean:
	rm -f core *~ *.o opt-meas opt-meas-p
 


