/* cerrexit.c - cerrexit */

#include <termios.h>
#include <stdio.h>
#include <varargs.h>

#include "local.h"

/*------------------------------------------------------------------------
 * cerrexit - clean up and exit with an error message
 *------------------------------------------------------------------------
 */
/*VARARGS1*/
int
cerrexit(format, va_alist)
char	*format;
va_dcl
{
	va_list	args;

	va_start(args);
	_doprnt(format, args, stderr);
	(void) tcsetattr(0, TCSADRAIN, &oldtty);
	va_end(args);
	exit(1);
}
