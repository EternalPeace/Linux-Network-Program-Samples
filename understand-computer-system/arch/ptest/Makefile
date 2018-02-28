ISADIR = ../misc
YAS=$(ISADIR)/yas
SIM=../pipe/pipe_tty
TFLAGS=

.SUFFIXES: .ys .yo

.ys.yo:
	$(YAS) $*.ys

test:
	./optest.pl -s $(SIM) $(TFLAGS)
	./jtest.pl -s $(SIM) $(TFLAGS)
	./ctest.pl -s $(SIM) $(TFLAGS)
	./htest.pl -s $(SIM) $(TFLAGS)

ptest:
	./optest.pl -s $(SIM) $(TFLAGS) -p perf-$(VERSION).txt
	./jtest.pl -s $(SIM) $(TFLAGS) -p perf-$(VERSION).txt
	./ctest.pl -s $(SIM) $(TFLAGS) -p perf-$(VERSION).txt
	./htest.pl -s $(SIM) $(TFLAGS) -p perf-$(VERSION).txt


clean:
	rm -f *.o *~ *.yo *.ys

