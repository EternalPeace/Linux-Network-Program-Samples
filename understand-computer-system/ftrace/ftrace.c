/*
 * ftrace - Traces static and dynamic functions, system calls and signals
 *
 * Dave O'Hallaron, Carnegie Mellon, 2003.
 */
#include <stdio.h>
#include <unistd.h>
#include <asm/unistd.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <getopt.h>
#include <limits.h>
#include <sys/types.h>
#include <sys/ptrace.h>
#include <asm/ptrace.h>
#include <sys/wait.h>

#include "ftrace.h"
#include "elf.h"
#include "debug.h"

/* 
 * Function prototypes 
 */
void await_event(pid_t pid, struct event *eventp); 
void process_event(pid_t pid, struct event *eventp, 
		   struct breakpoint *breaktab, Elf_obj *elfp);

void init_breaktab(pid_t pid, struct breakpoint *breaktab, Elf_obj *elfp);
int get_breakindex(struct breakpoint *breaktab, void *addr);
void enable_all_breakpoints(pid_t pid, struct breakpoint *breaktab);
void disable_all_breakpoints(pid_t pid, struct breakpoint *breaktab);

void *get_pc(pid_t pid);
void set_pc(pid_t pid, void *addr);
void *get_stack_ptr(pid_t pid);
void *get_return_addr(pid_t pid, void *stack_ptr);
int get_sysnum(pid_t pid);
int enable_breakpoint(pid_t pid, void *addr);
int disable_breakpoint(pid_t pid, void *addr, int save_word);
int is_fork(int sysnum);


char *sysname(int sysnum);
char *signalname(int signalnum);

void usage(char *progname);
char *search_for_command(char *filename); 
char **process_options(int argc, char **argv, char **command);
void print_function(pid_t pid, struct breakpoint *bp, int k, Elf_obj *ep);

/* 
 * Global variables  
 */
char *command;    /* Name of program being traced */
int opt_d = 0;    /* Debug level (command line arg) */
int opt_s = 0;    /* If true, trace syscalls (command line arg) */

/* The main routine  */
int main(int argc, char **argv) 
{
    pid_t pid;
    struct event event;
    Elf_obj *elfp;
    static struct breakpoint breaktab[MAX_BREAKS];

    signal(SIGTRAP, SIG_IGN);

    /* Set up */
    argv = process_options(argc, argv, &command);
    elfp = elf_open(command);

    /* Run the traced program in the context of a child process */
    if ((pid = fork()) < 0) {
	perror("fork");
	exit(1);
    } 
    else if (!pid) {  /* child */
	ptrace(PTRACE_TRACEME, 0, 0, 0);
	execvp(command, argv);
	fprintf(stderr, "Can't execute `%s': %s\n", command, strerror(errno));
	exit(2);
    }

    /* Trace the child */
    debug(1, "Tracing %s ...\n", command);
    while (1) {
	await_event(pid, &event);
	process_event(pid, &event, breaktab, elfp);
    }

    debug(1, "Control should never reach here\n");
    exit(0);
}

/**********************************************************************/
/* The two main functions that wait for events to occur in the traced */
/* process and then process them.                                     */
/**********************************************************************/

/*
 * await_event - Await an event in the child.
 */  
void await_event(pid_t pid, struct event *eventp) 
{
    int status;

    /* Wait for an event to occur on the child */
    while (wait(&status) < 0) {
	if (errno == ECHILD) {
	    debug(1, "Traced process disappeared.\n");
	    exit(0);
	} 
	else if (errno == EINTR) {
	    eventp->type = EVENT_UNKNOWN;
	    continue;
	} 
	else {
	    perror("wait");
	    exit(1);
	}		
    }

    /* Child stopped because it encountered a breakpoint */
    if (WIFSTOPPED(status) && WSTOPSIG(status) == SIGTRAP) {
	debug(2, "Detected event: breakpoint\n");
	eventp->type = EVENT_BREAKPOINT;
	return;
    }
    
    /* Child stopped because it received a signal */
    if (WIFSTOPPED(status) && WSTOPSIG(status) != SIGTRAP) {
	eventp->type = EVENT_SIGNAL;
	eventp->u.signum = WSTOPSIG(status);
	debug(2, "Detected event: delivery of signal %d\n", 
	      eventp->u.signum);
	return;
    }
    
    /* Child terminated normally */
    if (WIFEXITED(status)) {
	eventp->type = EVENT_EXIT;
	eventp->u.retval = WEXITSTATUS(status);
	debug(2, "Detected event: exit with return value of %d\n", 
	      eventp->u.retval);
	return;
    }
    
    /* Child terminated because it received a signal */
    if (WIFSIGNALED(status)) {
	eventp->type = EVENT_EXIT_SIGNAL;
	eventp->u.signum = WTERMSIG(status);
	debug(2, "Detected event: Pending delivery of terminating signal %d\n", 
	      eventp->u.signum);
	return;
    }
    
    /* Something unknown happened */
    debug(2, "Detected unknown event\n");
    eventp->type = EVENT_UNKNOWN;
    return;
}


/*
 * process_event - Respond to the most recent event in the child
 */ 
void process_event(pid_t pid, struct event *eventp,
		   struct breakpoint *breaktab, Elf_obj *elfp)
{
    int k;
    void *break_addr;
    static int first_event = 1;
    static int in_syscall = 0;

    /* 
     * The traced child has stopped because it called execve. Use
     * this opportunity to set breakpoints at the entry points
     * of every function.
     */
    if (first_event) {
	debug(1, "Processing exec breakpoint\n");
	init_breaktab(pid, breaktab, elfp);
	enable_all_breakpoints(pid, breaktab);
	ptrace(PTRACE_SYSCALL, pid, 0, 0);
	first_event = 0;
	return; 
    }

    switch (eventp->type) {

    /* The traced child has been stopped by a breakpoint instruction */
    case EVENT_BREAKPOINT:

	/* PC points to the byte following the break instruction */
	break_addr = (char *)get_pc(pid) - 1; 
	
	/* 
	 * If the break location isn't a function entry point, then
	 * the break was caused by a system call
	 */
	if ((k = get_breakindex(breaktab, break_addr)) < 0) {
	    int sysnum = get_sysnum(pid); 
	    /* 
	     * We must clear all breakpoints from memory before any
	     * syscall that creats a new process. Otherwise the
	     * (untraced) child with die with it executes one of the
	     * breakpoints it inherited from the parent. After the
	     * syscall returns, we can then reenable all breakpoints.
	     */
	    debug(1, "Processing syscall\n");
	    if (!in_syscall) {
		if (opt_s) {
		    printf("%s\n", sysname(sysnum));
		}
		in_syscall = 1;
		if (is_fork(sysnum))
		    disable_all_breakpoints(pid, breaktab);
	    }
	    else {
		in_syscall = 0;
		if (is_fork(sysnum))
		    enable_all_breakpoints(pid, breaktab);
	    }
	    ptrace(PTRACE_SYSCALL, pid, 0, 0);
	    return;
	}
	
	/* The child executed a software breakpoint */
	debug(1, "Processing software breakpoint\n");
	print_function(pid, breaktab, k, elfp);
	
	/* Remove the breakpoint and then single-step the child past it */
	disable_breakpoint(pid, break_addr, breaktab[k].save);
	set_pc(pid, break_addr);
	ptrace(PTRACE_SINGLESTEP, pid, 0, 0);
	
	/* 
	 * This part is tricky. The next event the parent discovers is
	 * that the child is stopped by either the completion of the
	 * single-stepping operation OR the pending receipt of some
	 * signal. The parent receives notification of exactly one of
	 * these events, never both, via wait(). In either case
	 * though, the parent reenables the breakpoint and then
	 * restarts the child. If the child was stopped by pending
	 * receipt of a signal, then we need to forward that signal
	 * when we restart the child.
	 */
	await_event(pid, eventp);
	if (eventp->type == EVENT_BREAKPOINT) {
	    debug(1, "Processing singlestep breakpoint\n");
	    enable_breakpoint(pid, break_addr);
	    ptrace(PTRACE_SYSCALL, pid, 0, 0);
	}
	else if (eventp->type == EVENT_SIGNAL) {
	    debug(1, "Processing receipt of signal %d during single-step\n", 
		  eventp->u.signum);
	    enable_breakpoint(pid, break_addr);
	    ptrace(PTRACE_SYSCALL, pid, 0, eventp->u.signum);
	}
	else {
	    printf("Warning: unexpected event (%d) after break\n", 
		   eventp->type);
	}
	return;

    /* The child was stopped by pending receipt of a signal */
    case EVENT_SIGNAL:
	debug(1, "Processing receipt of signal %d\n", eventp->u.signum);
	printf("Received %s\n", signalname(eventp->u.signum));
	ptrace(PTRACE_SYSCALL, pid, 0, eventp->u.signum);
	return;
     
     /* The child was terminated by the receipt of a signal */
    case EVENT_EXIT_SIGNAL:
	printf("Terminated after receiving %s\n", 
	       signalname(eventp->u.signum));
	exit(0);

    /* The child terminated by calling the exit function */
    case EVENT_EXIT:
	printf("Terminated with exit status %d\n", 
	       eventp->u.retval);
	exit(0);
	
    case EVENT_UNKNOWN:
    case EVENT_NONE:
	printf("Warning: Processing unexpected event\n");
	ptrace(PTRACE_SYSCALL, pid, 0, 0);
	return;

    default:
	printf("Warning: Processing unknown event %d\n", eventp->type);
	ptrace(PTRACE_SYSCALL, pid, 0, 0);
    }
}

/**************************************************/
/* Functions that manipulate the breakpoint table */
/**************************************************/

/* 
 * init_breaktab - Initialize the breakpoint table, one entry per function
 */                
void init_breaktab(pid_t pid, struct breakpoint *breaktab, Elf_obj *elfp)
{ 
    void *sym_addr;
    Elf32_Sym *sp;
    int k;
    
    for (k=0; k < MAX_BREAKS; k++) {
	breaktab[k].save = 0;
	breaktab[k].addr = NULL;
	breaktab[k].sym = NULL;
	breaktab[k].symtype = BP_UNDEF;
    }

    /* Statically loaded functions */
    k = 0;
    debug(1, "Creating breakpoint entries for the static functions\n");
    for (sp = elf_firstsym(elfp); sp != NULL; sp = elf_nextsym(elfp, sp)) {
	if (elf_isfunc(elfp, sp)) {
	    sym_addr = (void *)sp->st_value;
	    breaktab[k].addr = sym_addr;
	    breaktab[k].save = ptrace(PTRACE_PEEKTEXT, pid, sym_addr, 0);
	    breaktab[k].sym = sp;
	    breaktab[k].symtype = BP_STATIC;
	    debug(2, "%4d:%p:s: %s\n", 
		  k, breaktab[k].addr, elf_symname(elfp, breaktab[k].sym)); 
	    k++;
	}
    }

    /* Dynamically loaded functions */
    debug(1, "Creating breakpoint entries for the dynamic functions\n");
    for (sp = elf_firstdsym(elfp); sp != NULL; sp = elf_nextdsym(elfp, sp)) {
	if (elf_isdfunc(elfp, sp)) {
	    sym_addr = (void *)sp->st_value;
	    breaktab[k].addr = sym_addr;
	    breaktab[k].save = ptrace(PTRACE_PEEKTEXT, pid, sym_addr, 0);
	    breaktab[k].sym = sp;
	    breaktab[k].symtype = BP_DYNAMIC;
	    debug(2, "%4d:%p:d: %s\n", 
		  k, breaktab[k].addr, elf_dsymname(elfp, breaktab[k].sym)); 
	    k++;
	}
    }
}

/*
 * get_breakindex - Find the index of the breakpoint at address addr
 */
int get_breakindex(struct breakpoint *breaktab, void *addr) 
{
    int k;

    for (k = 0; (breaktab[k].addr != NULL) && (k < MAX_BREAKS); k++) 
	if (breaktab[k].addr == addr)
	    return k;
    return -1; /* not found */
}

/* 
 * enable_all_breakpoints - Set all breakpoints in breakpoint table
 */                
void enable_all_breakpoints(pid_t pid, struct breakpoint *breaktab)
{ 
    int k;
    
    debug(1, "Enabling all breakpoints.\n");
    for (k = 0; breaktab[k].addr != NULL; k++) {
	debug(2, "Enabling breakpoint %d\n", k);
	enable_breakpoint(pid, breaktab[k].addr);
    }	
}

/* 
 * disable_all_breakpoints - Clear all breakpoints in breakpoint array
 */                
void disable_all_breakpoints(pid_t pid, struct breakpoint *breaktab)
{ 
    int k;
    
    debug(1, "Disabling all breakpoints.\n");
    for (k = 0; breaktab[k].addr != NULL; k++) {
	debug(2, "Disabling breakpoint %d\n", k);
	disable_breakpoint(pid, breaktab[k].addr, breaktab[k].save);
    }	
}

/*****************************************************************/
/* Low level functions for tracing and probing the child process */
/*****************************************************************/

/* 
 * get_pc - Fetch current program counter for the traced process
 */
void *get_pc(pid_t pid) 
{
    return (void *)ptrace(PTRACE_PEEKUSER, pid, 4*EIP, 0);
}

/*
 * set_pc - Modify the program counter for the traced process
 */
void set_pc(pid_t pid, void *addr)
{
    ptrace(PTRACE_POKEUSER, pid, 4*EIP, addr);
}

/*
 * get_stack_ptr - Fetch the current stack pointer for the traced process
 */
void *get_stack_ptr(pid_t pid) 
{
    return (void *)ptrace(PTRACE_PEEKUSER, pid, 4*UESP, 0);
}

/*
 * get_return_addr - Fetch return address on top of traced process stack
 */
void *get_return_addr(pid_t pid, void *stack_ptr) 
{
    return (void *)ptrace(PTRACE_PEEKTEXT, pid, stack_ptr, 0);
}

/* 
 * get_sysnum - Fetch number of current system call
 * This is always contained in the ORIG_EAX entry in the process
 * user area on entry to and exit from a system call.
 */
int get_sysnum(pid_t pid) 
{
    return (int)ptrace(PTRACE_PEEKUSER, pid, 4*ORIG_EAX, 0); 
}

/*
 * enable_breakpoint - Insert a 1-byte breakpoint instruction at
 * location addr in the trace process, returning the original contents
 * of the 4-byte starting at that address.
 */
int enable_breakpoint(pid_t pid, void *addr)
{
    int old_word, new_word;

    old_word = ptrace(PTRACE_PEEKTEXT, pid, addr, 0);
    new_word = BREAK_INST | (old_word & 0xffffff00);
    ptrace(PTRACE_POKETEXT, pid, addr, new_word);
    return old_word;
}

/*
 * disable_breakpoint - Replace the 1-byte breakpoint instruction at location
 * addr in the traced process with the original byte at that location.
 */
int disable_breakpoint(pid_t pid, void *addr, int original_word)
{
    int current_word;

    current_word = ptrace(PTRACE_PEEKTEXT, pid, addr, 0);
    ptrace(PTRACE_POKETEXT, pid, addr, original_word);
    return current_word;
}

/*
 * is_fork - Return true if syscall sysnum creates a new process.
 */
int is_fork(int sysnum)
{
    return (0 || (sysnum == __NR_fork) || (sysnum == __NR_clone) || 
	    (sysnum == __NR_vfork));
}

/************************************************************/
/* Functions that convert syscall/signal numbers to strings */
/************************************************************/

/*
 * sysname - Convert a syscall number to its string name
 */
char *sysname(int sysnum) 
{
    static char result[128];
    static char *syscalent0[] = {
       #include "syscallent.h"
    };
    int nsyscals0 = sizeof syscalent0 / sizeof syscalent0[0];
    
    if (sysnum < 0 || sysnum >= nsyscals0) {
	sprintf(result, "SYS_%d", sysnum);
	return result;
    } else {
	sprintf(result, "SYS_%s", syscalent0[sysnum]);
	return result;
    }
}

/*
 * signalname - Convert a signal number to its string name
 */
char *signalname(int signalnum) 
{
    static char result[32];
    static char *signalent0[] = {
       #include "signalent.h"
    };
    int nsignals0 = sizeof signalent0 / sizeof signalent0[0];
    
    if (signalnum < 0 || signalnum >= nsignals0) {
	sprintf(result, "SIG_%d", signalnum);
	return result;
    } else {
	sprintf(result, "%s", signalent0[signalnum]);
	return result;
    }
}

/*******************************************/
/* Functions related to the user interface */
/*******************************************/

/*
 * usage - Print a help message
 */
void usage(char *progname) 
{
    fprintf(stderr, "Usage: %s [-hds] command [arg1] ... [argn]\n", progname);
    fprintf(stderr, "Traces function calls in command\n");
    fprintf(stderr, "\n");
    fprintf(stderr, "Options:\n");
    fprintf(stderr, "   -h   Display this message\n");
    fprintf(stderr, "   -d   Increment the debug level (default level 0)\n");
    fprintf(stderr, "   -s   Also trace system calls\n");
    fprintf(stderr, "\n");
    fprintf(stderr, "Output format:\n");
    fprintf(stderr, "   <index>:<ret addr>:<func type>:<func name>\n");
    exit(1);
}

/*
 * search_for_command - Return the command name in a string of the
 * form "command arg1 arg2 ... argn"
 */
char *search_for_command(char *filename) 
{
    static char pathname[PATH_MAX];
    char *path;
    int m, n;

    if (strchr(filename, '/')) {
	return filename;
    }
    for (path = getenv("PATH"); path && *path; path += m) {
	if (strchr(path, ':')) {
	    n = strchr(path, ':') - path;
	    m = n + 1;
	} else {
	    m = n = strlen(path);
	}
	if (n + strlen(filename) + 1 >= PATH_MAX) {
	    fprintf(stderr, "Error: filename too long\n");
	    exit(1);
	}
	strncpy(pathname, path, n);
	if (n && pathname[n - 1] != '/') {
	    pathname[n++] = '/';
	}
	strcpy(pathname + n, filename);
	if (!access(pathname, X_OK)) {
	    return pathname;
	}
    }
    return filename;
}

/*
 * process_options - Process command line options
 */
char **process_options(int argc, char **argv, char **command) 
{
    int c;
    char *progname = argv[0];

    while (1) {
	c = getopt(argc, argv, "+hds");
	if (c == -1) {
	    break;
	}
	switch(c) {
	case 'h':
	    usage(progname);
	    break;
	case 'd':
	    opt_d++;
	    break;
	case 's':
	    opt_s = 1;
	    break;
	default:
	    usage(progname);
	    break;
	}
    }
    argc -= optind; 
    argv += optind;
    if (argc < 1) 
	usage(progname);
    *command = search_for_command(argv[0]);
    return &argv[0];
}

/*
 * print_function - Print a line in the function trace.
 */
void print_function(pid_t pid, struct breakpoint *breaktab, int k, Elf_obj *ep)
{
    if (breaktab[k].symtype == BP_STATIC) 
	printf("%4d:0x%08x:s: %s\n", 
	       k, 
	       (unsigned)get_return_addr(pid, get_stack_ptr(pid)), 
	       elf_symname(ep, breaktab[k].sym)); 
    else
	printf("%4d:0x%08x:d: %s\n", 
	       k, 
	       (unsigned)get_return_addr(pid, get_stack_ptr(pid)), 
	       elf_dsymname(ep, breaktab[k].sym)); 
}

