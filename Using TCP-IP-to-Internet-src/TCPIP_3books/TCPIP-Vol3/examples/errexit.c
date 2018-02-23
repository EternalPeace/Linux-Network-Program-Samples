/* errexit.c - errexit */

#include <varargs.h>
#include <stdio.h>

/*------------------------------------------------------------------------
 * errexit - print an error message and exit
 *------------------------------------------------------------------------
 */
/*VARARGS1*/
int
errexit(format, va_alist)
char	*format;
va_dcl
{
	va_list	args;

	va_start(args);
	_doprnt(format, args, stderr);
	va_end(args);
	exit(1);
}
