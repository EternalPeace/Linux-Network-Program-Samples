/* suspend.c - */

#include <sys/types.h>
#include <sys/signal.h>

#include <stdio.h>

#include "local.h"

extern struct termios	tntty;

/*------------------------------------------------------------------------
 * suspend - suspend execution temporarily
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
suspend(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
{
	if (tcgetattr(0, &tntty) < 0)	/* save current tty state	*/
		errexit("can't get tty modes: %s\n", sys_errlist[errno]);
	if (tcsetattr(0, TCSADRAIN, &oldtty) < 0) /* restore old state	*/
		errexit("can't set tty modes: %s\n", sys_errlist[errno]);

	(void) kill(0, SIGTSTP);

	if (tcgetattr(0, &oldtty) < 0)	/* may have changed		*/
		errexit("can't get tty modes: %s\n", sys_errlist[errno]);
	if (tcsetattr(0, TCSADRAIN, &tntty) < 0) /* back to telne modes*/
		errexit("can't set tty modes: %s\n", sys_errlist[errno]);
	return 0;
}
