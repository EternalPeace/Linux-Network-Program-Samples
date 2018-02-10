INCLUDE = -I/usr/X11R6/include/
LIBDIR  = -L/usr/X11R6/lib

COMPILERFLAGS = -Wall
CC = gcc
CFLAGS = $(COMPILERFLAGS) $(INCLUDE)
LIBRARIES = -lX11 -lXi -lXmu -lglut -lGL -lGLU -lm

All: cube

cube: cube.o
	$(CC) $(CFLAGS) -o $@ $(LIBDIR) $< $(LIBRARIES)
