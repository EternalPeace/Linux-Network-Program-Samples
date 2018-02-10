####### System-dependendant options

####### BEGIN
#
#   This section was automatically generated from
#      /usr/local/qt/Makefile for building on
#       on Wed Nov 18 15:14:29 MST 1998
#

# Compiling
SYSCONF_CC		= g++

# Compiling with support libraries
SYSCONF_CFLAGS_X11	= -I/usr/X11R6/include
SYSCONF_CFLAGS_QT	= -I$(QTDIR)/include
SYSCONF_CFLAGS_OPENGL	= -I/usr/X11R6/include

# Compiline YACC output
SYSCONF_CFLAGS_YACC     = -Wno-unused -Wno-parentheses

# Linking with support libraries
# X11
SYSCONF_LFLAGS_X11	= -L/usr/X11R6/lib
SYSCONF_LIBS_X11	= -lX11 -lXext
# Qt, Qt+OpenGL
SYSCONF_LFLAGS_QT	= -L$(QTDIR)/lib
SYSCONF_LIBS_QT		= -lqt
SYSCONF_LIBS_QT_OPENGL	= -lqgl
# OpenGL
SYSCONF_LFLAGS_OPENGL	= -L/usr/X11R6/lib
SYSCONF_LIBS_OPENGL	= -lMesaGL -lMesaGLU -lXmu -lXext -lm

# Linking applications
SYSCONF_LINK		= g++
SYSCONF_LFLAGS		= 
SYSCONF_LIBS		= 

# Link flags shared objects
SYSCONF_LFLAGS_SHOBJ	= -shared

# Meta-object compiler
SYSCONF_MOC		= $(QTDIR)/bin/moc

# Linking shared libraries
#   - Build the $(TARGET) library, eg. lib$(TARGET).so.0.0
#   - Place target in $(DESTDIR) - which has a trailing /
#   - Usually needs to incorporate $(VER_MAJ) and $(VER_MIN)
#
SYSCONF_LINK_SHLIB	= g++
SYSCONF_LINK_TARGET_SHARED	= lib$(TARGET).so.$(VER_MAJ).$(VER_MIN)
SYSCONF_LINK_LIB_SHARED	=  $(SYSCONF_LINK_SHLIB) -shared -Wl,-soname,lib$(TARGET).so.$(VER_MAJ) \
				     $(LFLAGS) -o $(SYSCONF_LINK_TARGET_SHARED) \
				     $(OBJECTS) $(OBJMOC) $(LIBS); \
				 mv $(SYSCONF_LINK_TARGET_SHARED) $(DESTDIR); \
				 cd $(DESTDIR); \
				 rm -f lib$(TARGET).so lib$(TARGET).so.$(VER_MAJ); \
				 ln -s $(SYSCONF_LINK_TARGET_SHARED) lib$(TARGET).so; \
				 ln -s $(SYSCONF_LINK_TARGET_SHARED) lib$(TARGET).so.$(VER_MAJ)

# Linking static libraries
#   - Build the $(TARGET) library, eg. lib$(TARGET).a
#   - Place target in $(DESTDIR) - which has a trailing /
#
SYSCONF_AR		= ar cqs
SYSCONF_LINK_TARGET_STATIC = lib$(TARGET).a
SYSCONF_LINK_LIB_STATIC	= rm -f $(DESTDIR)$(SYSCONF_LINK_TARGET_STATIC);  \
				 $(SYSCONF_AR) $(DESTDIR)$(SYSCONF_LINK_TARGET_STATIC) $(OBJECTS) $(OBJMOC)
# Compiling application source
SYSCONF_CFLAGS		= -pipe -O2 -fno-strength-reduce
# Compiling library source
SYSCONF_CFLAGS_LIB	= -O2 -fno-strength-reduce -fPIC
# Compiling shared-object source
SYSCONF_CFLAGS_SHOBJ	= -O2 -fno-strength-reduce -fPIC
SYSCONF_LINK_LIB	= $(SYSCONF_LINK_LIB_STATIC)
SYSCONF_LINK_TARGET	= $(SYSCONF_LINK_TARGET_STATIC)

####### End of automatically generated section
####### END

####### Compiler, tools and options

CC	=	$(SYSCONF_CC)
CFLAGS	=	$(SYSCONF_CFLAGS_QT) $(SYSCONF_CFLAGS)
LFLAGS	=	$(SYSCONF_LFLAGS_QT) $(SYSCONF_LFLAGS_X11) $(SYSCONF_LFLAGS)
LIBS	=	$(SYSCONF_LIBS_QT) $(SYSCONF_LIBS_X11) $(SYSCONF_LIBS)
MOC	=	$(SYSCONF_MOC)

####### Target

TARGET	= test_it
DESTDIR = ./
VER_MAJ = 1
VER_MIN = 0

####### Files

HEADERS =	up_down.hxx state_lcd.hxx
SOURCES =	up_down.cxx state_lcd.cxx main.cxx
OBJECTS =	up_down.o state_lcd.o main.o
SRCMOC	=	moc_up_down.cxx moc_state_lcd.cxx
OBJMOC	=	moc_up_down.o moc_state_lcd.o

####### Implicit rules

.SUFFIXES: .cpp .cxx .cc .C .c

.cpp.o:
	$(CC) -c $(CFLAGS) -o $@ $<

.cxx.o:
	$(CC) -c $(CFLAGS) -o $@ $<

.cc.o:
	$(CC) -c $(CFLAGS) -o $@ $<

.C.o:
	$(CC) -c $(CFLAGS) -o $@ $<

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

####### Build rules

all: $(DESTDIR)$(TARGET)

$(DESTDIR)$(TARGET): $(OBJECTS) $(OBJMOC) 
	$(SYSCONF_LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJMOC) $(LIBS)

moc: $(SRCMOC)

clean:
	-rm -f $(OBJECTS) $(OBJMOC) $(SRCMOC)
	-rm -f *~ core test_it

####### Compile

state_lcd.o: state_lcd.cxx state_lcd.hxx

up_down.o: up_down.cxx up_down.hxx

main.o: main.cpp up_down.hxx state_lcd.hxx

moc_state_lcd.o: moc_state_lcd.cxx state_lcd.hxx

moc_up_down.o: moc_up_down.cxx up_down.hxx

moc_state_lcd.cxx: state_lcd.hxx
	$(MOC) state_lcd.hxx -o moc_state_lcd.cxx

moc_up_down.cxx: up_down.hxx
	$(MOC) up_down.hxx -o moc_up_down.cxx
