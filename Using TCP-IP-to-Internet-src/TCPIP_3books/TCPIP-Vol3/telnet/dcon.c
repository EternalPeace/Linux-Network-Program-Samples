/* dcon.c - dcon */

#include <sys/ioctl.h>

#include <termios.h>
#include <stdio.h>

#include "local.h"

/*------------------------------------------------------------------------
 * dcon - disconnect from remote
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
dcon(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
{
	fprintf(tfp, "disconnecting.\n");
	(void) tcsetattr(0, TCSADRAIN, &oldtty);
	exit(0);
}
