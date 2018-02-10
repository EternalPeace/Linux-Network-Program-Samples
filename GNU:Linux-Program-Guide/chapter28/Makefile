CC = gcc

all: simple XMLviewer notebook

simple: simple.c
	$(CC) `gtk-config --cflags`  simple.c -o simple `gtk-config --libs`

XMLviewer: XMLviewer.c
	cd expat ; make
	$(CC) `gtk-config --cflags`  -I expat/xmlparse XMLviewer.c -o XMLviewer `gtk-config --libs`  expat/xmlparse/*.o expat/xmltok/*.o

notebook: notebook.c draw_widget.c
	$(CC) -I /usr/local/lib/glib/include `gtk-config --cflags` notebook.c draw_widget.c -o notebook `gtk-config --libs`

clean:
	rm -f *.o simple XMLviewer notebook

