/*
 * debug.c - Handy debugging output function. 
 *           Debugging level is given by variable opt_d.
 */
#include <stdio.h>
#include <stdarg.h>

#include "debug.h"

void debug_(int level, char *file, int line, char *func, char *fmt, ...) 
{
    char buf[1024];
    va_list args;
    
    if (opt_d < level) {
	return;
    }
    va_start(args, fmt);
    vsnprintf(buf, 1024, fmt, args);
    va_end(args);
    
    if (1)
	printf("%s", buf);
    else
	printf("DEBUG: %s:%d: %s(): %s", file, line, func, buf);
}

