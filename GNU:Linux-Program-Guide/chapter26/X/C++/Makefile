all:	test_it

test_it:   test_it.cpp PaneWindow.hxx PaneWindow.cpp Component.hxx Component.cpp Label.hxx Label.cpp Button.hxx Button.cpp Text.hxx Text.cpp
	g++ -o test_it test_it.cpp PaneWindow.cpp Component.cpp Label.cpp Button.cpp Text.cpp  -L/usr/X11R6/lib -lX11 -lXaw  

clean:
	rm -f *.o test_it
