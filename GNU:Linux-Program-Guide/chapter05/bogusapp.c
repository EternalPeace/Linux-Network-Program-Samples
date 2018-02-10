#include <stdio.h>
#include <stdlib.h>
#ifdef HAVE_RESOLV_H
	#include <resolv.h>
#endif /* HAVE_RESOLV_H */
#include "config.h"

int main(void)
{
	int retval;

	#ifdef HAVE_MMAP
		fprintf(stdout, "have mmap()\n");
	#else
		fprintf(stderr, "no mmap()\n");
	#endif

	if(HAVE_UTIME_NULL)
		fprintf(stdout, "utime() allows NULL\n");
	else
		fprintf(stderr, "utime() doesn't allow NULL\n");

	if(SYS_SIGLIST_DECLARED)
		fprintf(stdout, "sys_siglist() declared\n");
	else
		fprintf(stderr, "sys_siglist() not declared\n");

	#ifdef HAVE_NCURSES_H
		fprintf(stdout, "ncurses.h found\n");
	#else
		fprintf(stderr, "ncurses.h not found\n");
	#endif

	if(HAVE_FCNTL_H)
		fprintf(stdout, "fcntl.h found\n");
	else
		fprintf(stderr, "fcntl.h not found\n");

	if(HAVE_SYS_FCNTL_H)
		fprintf(stdout, "sys/fcntl.h found\n");
	else
		fprintf(stderr, "sys/fcntl.h not found\n");

	#ifdef NLIST_NAME_UNION
		fprintf(stdout, "nlist.n_un member found\n");
	#else
		fprintf(stdout, "nlist.n_un member not found\n");
	#endif

	if(HAVE_VOID_POINTER)
		fprintf(stdout, "Yep, we have a usable void pointer type\n");
	else
		fprintf(stderr, "Nope, no usable void pointer type\n");

	exit(EXIT_SUCCESS);
}
