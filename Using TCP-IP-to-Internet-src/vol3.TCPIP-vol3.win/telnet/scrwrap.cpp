/* scrwrap.cpp - scrwrap */

#include <io.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <winsock.h>

#include "local.h"

extern char		scrname[];
extern int		scrindex;
extern unsigned int	tnflags;

/*------------------------------------------------------------------------
 * scrwrap - wrap-up script filename collection
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
scrwrap(SOCKET sfd, FILE *tfp, int c)
{
	int	fd;

	if (scrindex) {
		scrname[scrindex] = '\0';
		scrindex = 0;
		fd = open(scrname, O_WRONLY|O_CREAT|O_TRUNC, 0644);
		if (fd < 0)
			fprintf(tfp, "\ncan't write \"%s\": %s\n",
				scrname, strerror(errno));
		else
			scrfp = fdopen(fd, "w");
	}
	putchar('\n');
	ttyflags = tnflags;
	return 0;
}
