/* tcout.c - tcout */

#include <stdio.h>

char	*getenv(), *tgetstr();

#define	TBUFSIZE	2048

/*------------------------------------------------------------------------
 * tcout - print the indicated terminal capability on the given stream
 *------------------------------------------------------------------------
 */
int
tcout(cap, tfp)
char	*cap;
FILE	*tfp;
{
	static init;
	static char	*term;
	static char	tbuf[TBUFSIZE], buf[TBUFSIZE], *bp = buf;
	char		*sv;

	if (!init) {
		init = 1;
		term = getenv("TERM");
	}
	if (term == 0 || tgetent(&tbuf[0], term) != 1)
		return 0;
	if (sv = tgetstr(cap, &bp)) {
		xfputs(sv, tfp);
		return 1;
	}
	return 0;
}
