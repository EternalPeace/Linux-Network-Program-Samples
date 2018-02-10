all:	label list text

clean: rm -r -f label list text

label:	label.c
	cc -o label label.c -L/usr/X11R6/lib -lX11 -lXm

list:	list.c
	cc -o list list.c  -L/usr/X11R6/lib -lX11 -lXm

text:	text.c
	cc -o text text.c  -L/usr/X11R6/lib -lX11 -lXm

