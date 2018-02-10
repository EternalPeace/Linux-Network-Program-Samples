all:	athena motif

athena:	   athena.cpp
	g++ -o athena athena.cpp  -L/usr/X11R6/lib -lX11 -lXaw  

motif:	  motif.cpp
	g++ -o motif motif.cpp  -L/usr/X11R6/lib -lX11 -lXm

clean:
	rm -f *.o athena motif
