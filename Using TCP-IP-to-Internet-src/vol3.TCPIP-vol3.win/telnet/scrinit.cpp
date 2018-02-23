/* scrinit.cpp - scrinit */

#include <stdio.h>
#include <string.h>
#include <winsock.h>

#include "telnet.h"
#include "local.h"

extern int		scrindex;
extern unsigned int	tnflags;


/*------------------------------------------------------------------------
 * scrinit - initialize tty modes for script file collection
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
scrinit(SOCKET sfd, FILE *tfp, int c)
{
	if (!doecho) {
		fprintf(tfp, "\nscripting requires remote ECHO.\n");
		return -1;
	}
	if (scrfp) {
		fprintf(tfp,"\nalready scripting to \"%s\".\n", scrname);
		return -1;
	}
	scrindex = 0;
	tnflags = ttyflags;
	ttyflags = ECHO;
	fprintf(tfp, "\nscript file: ");
	(void) fflush(tfp);
	return 0;
}
