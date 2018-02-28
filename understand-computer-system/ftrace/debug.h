#ifndef DEBUG_H
#define DEBUG_H

#include <features.h>

void debug_(int level, char *file, int line, char *func, char *fmt, ...);

#define debug(level, expr...) debug_(level, __FILE__, __LINE__, __PRETTY_FUNCTION__, expr)

extern int opt_d; 


#endif
