/* scrwrap.c - scrwrap */

#include <sys/fcntl.h>

#include <termios.h>
#include <stdio.h>

#include "local.h"

extern struct termios	tntty;
extern char		scrname[], *sys_errlist[];
extern int		scrindex, errno;

/*------------------------------------------------------------------------
 * scrwrap - wrap-up script filename collection
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
scrwrap(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
{
	int	fd;

	if (scrindex) {
		scrname[scrindex] = '\0';
		scrindex = 0;
		fd = open(scrname, O_WRONLY|O_CREAT|O_TRUNC, 0644);
		if (fd < 0)
			fprintf(tfp, "\ncan't write \"%s\": %s\n",
				scrname, sys_errlist[errno]);
		else
			scrfp = fdopen(fd, "w");
	}
	if (tcsetattr(0, TCSADRAIN, &tntty) < 0)
		errexit("tcsetattr: %s\n", sys_errlist[errno]);
	return 0;
}
