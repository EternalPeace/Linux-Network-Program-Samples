/* scrinit.c - scrinit */

#include <stdio.h>

#include "telnet.h"
#include "local.h"

extern int		scrindex;
extern struct termios	tntty;

/*------------------------------------------------------------------------
 * scrinit - initialize tty modes for script file collection
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
scrinit(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
{
	struct termios	newtty;

	if (!doecho) {
		fprintf(tfp, "\nscripting requires remote ECHO.\n");
		return -1;
	}
	if (scrfp) {
		fprintf(tfp,"\nalready scripting to \"%s\".\n", scrname);
		return -1;
	}
	scrindex = 0;

	if (tcgetattr(0, &tntty))	/* save current tty settings	*/
		errexit("can't get tty modes: %s\n", sys_errlist[errno]);

	newtty = oldtty;
	newtty.c_cc[VINTR] = _POSIX_VDISABLE;	/* disable interrupt	*/
	newtty.c_cc[VQUIT] = _POSIX_VDISABLE;	/* disable interrupt	*/
	newtty.c_cc[VSUSP] = _POSIX_VDISABLE;	/* disable suspend	*/
	newtty.c_cc[VDSUSP] = _POSIX_VDISABLE;	/* disable suspend	*/

	if (tcsetattr(0, TCSADRAIN, &newtty))
		errexit("can't set tty modes: %s\n", sys_errlist[errno]);

	fprintf(tfp, "\nscript file: ");
	(void) fflush(tfp);
	return 0;
}
