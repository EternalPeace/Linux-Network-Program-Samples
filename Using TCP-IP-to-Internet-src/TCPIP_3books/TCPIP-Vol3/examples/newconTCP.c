/* newconTCP.c - newconTCP */

#include <sys/fcntl.h>
#include <sys/errno.h>
#include <netinet/in.h>

#include <tiuser.h>

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

/*------------------------------------------------------------------------
 * newconTCP - handle a TCP connection request
 *------------------------------------------------------------------------
 */
int
newconTCP(d)
int	d;		/* master server descriptor	*/
{
	struct t_call		*pcall;
	int			dnew;

	pcall = (struct t_call *) t_alloc(d, T_CALL, T_ADDR);
	if (pcall == 0)
		errexit("t_alloc(pcall) failed: %s\n",t_errlist[t_errno]);

	/* wait for a new connection to arrive */

	while (t_listen(d, pcall) < 0)
		if (t_errno == TSYSERR) {
			if (errno == EINTR)
				continue;
			errexit("t_listen failed: %s\n", sys_errlist[errno]);
		} else
			errexit("t_listen failed: %s\n", t_errlist[t_errno]);

	dnew = t_open("/dev/tcp", O_RDWR, 0);
	if (dnew < 0)
		errexit("t_open failed: %s\n", t_errlist[t_errno]);
	if (t_bind(dnew, 0, 0) < 0)
		errexit("t_bind failed: %s\n", t_errlist[t_errno]);
	if (t_accept(d, dnew, pcall) < 0)
		errexit("t_accept: %s\n", t_errlist[t_errno]);
	t_free((char *)pcall, T_CALL);
	return dnew;
}
