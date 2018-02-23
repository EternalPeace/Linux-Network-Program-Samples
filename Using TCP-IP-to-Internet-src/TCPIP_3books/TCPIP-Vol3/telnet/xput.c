/* xput.c - xputc, xfputs */

#include <stdio.h>

extern FILE	*scrfp;

/*------------------------------------------------------------------------
 * xputc - putc with optional file scripting
 *------------------------------------------------------------------------
 */
int
xputc(ch, fp)
char	ch;
FILE	*fp;
{
	if (scrfp)
		(void) putc(ch, scrfp);
	return putc(ch, fp);
}

/*------------------------------------------------------------------------
 * xfputs - fputs with optional file scripting
 *------------------------------------------------------------------------
 */
int
xfputs(str, fp)
char	*str;
FILE	*fp;
{
	if (scrfp)
		fputs(str, scrfp);
	fputs(str, fp);
}
