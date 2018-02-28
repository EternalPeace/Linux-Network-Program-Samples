#include "elf.h"

#define BREAK_INST 0xcc
#define MAX_BREAKS 8192

/* Every breakpoint gets one of these */
struct breakpoint {
    int save;           /* Original word at the breakpoint location */
    void *addr;         /* Breakpoint address */
    Elf32_Sym *sym;     /* Symbol of function associated with breakpoint */
    enum {              /* Which symbol table is the symbol stored in? */ 
	BP_UNDEF,         /* Undefined */  
	BP_STATIC,        /* Static symbol table */
	BP_DYNAMIC        /* Dynamic symbol table */
    } symtype;          
};

/* Record events that occur on the traced child process */
struct event {
    enum {
	EVENT_UNKNOWN,   
	EVENT_NONE,
	EVENT_SIGNAL,
	EVENT_EXIT,
	EVENT_EXIT_SIGNAL,
	EVENT_BREAKPOINT
    } type;
    union {
	int retval;      /* EVENT_EXIT */
	int signum;      /* EVENT_SIGNAL, EVENT_EXIT_SIGNAL */
    } u;
};

enum state {
  STATE_UNDEF, 
  STATE_AWAITING_EXEC_BREAK,
  STATE_AWAITING_SOFTWARE_BREAK,
};
