/* scrgetc.c - scrgetc */

#include <stdio.h>

#include "local.h"

#define	SFBUFSZ		2048	/* script filename buffer size	*/

struct termios	tntty;
FILE		*scrfp;
char		scrname[SFBUFSZ];
int		scrindex;

/*------------------------------------------------------------------------
 * scrgetc - begin session scripting
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
scrgetc(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
{
	scrname[scrindex++] = c;
	if (scrindex >= SFBUFSZ) {	/* too far */
		fprintf(tfp, "\nname too long\n");
		if (tcsetattr(0, TCSADRAIN, &oldtty) < 0)
			errexit("tcsetattr: %s\n", sys_errlist[errno]);
		return -1;
	}
	return 0;
}
