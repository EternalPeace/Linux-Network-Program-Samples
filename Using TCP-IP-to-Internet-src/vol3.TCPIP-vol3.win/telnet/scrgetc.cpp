/* scrgetc.cpp - scrgetc */

#include <stdio.h>
#include <string.h>
#include <winsock.h>

#include "local.h"

#define	SFBUFSZ		2048	/* script filename buffer size	*/

unsigned int	tnflags;
FILE		*scrfp;
char		scrname[SFBUFSZ];
int		scrindex;

/*------------------------------------------------------------------------
 * scrgetc - begin session scripting
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
scrgetc(SOCKET sfd, FILE *tfp, int c)
{
	scrname[scrindex++] = c;
	if (scrindex >= SFBUFSZ) {	/* too far */
		fprintf(tfp, "\nname too long\n");
		ttyflags = tnflags;
		return -1;
	}
	return 0;
}
