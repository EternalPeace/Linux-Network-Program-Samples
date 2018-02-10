all:	athena motif

athena:	   athena.cpp
	g++ -o athena athena.cpp -lX11 -lXaw  

motif:	  motif.cpp
	g++ -o motif motif.cpp -lX11 -lXm

clean:
	rm -f *.o athena motif
