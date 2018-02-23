/* rwaddTLI.c - rwaddTLI */

#include <sys/stropts.h>

#include <tiuser.h>

extern char	*sys_errlist[];
extern int	errno;

/*------------------------------------------------------------------------
 * rwaddTLI - push a "read/write" interface onto the TLI STREAM
 *------------------------------------------------------------------------
 */
int
rwaddTLI(d)
int	d;
{
	if (ioctl(d, I_POP, 0) < 0)
		errexit("pop failed : %s", sys_errlist[errno]);
	if (ioctl(d, I_PUSH, "tirdwr") < 0)
		errexit("read/write push : %s", sys_errlist[errno]);
}
