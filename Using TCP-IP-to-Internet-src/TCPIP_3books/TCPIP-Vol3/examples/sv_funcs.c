/* sv_funcs.c - TCPechod, TCPchargend, TCPdaytimed, TCPtimed */

#include <sys/types.h>

#include <tiuser.h>

#define	BUFSIZ	4096		/* max read buffer size	*/

extern	int	errno, t_errno;
extern	char	*sys_errlist[], *t_errlist[];


/*------------------------------------------------------------------------
 * TCPechod - echo data until end of file
 *------------------------------------------------------------------------
 */
int
TCPechod(fd)
int	fd;
{
	char	buf[BUFSIZ];
	int	cc, flags;

	while ((cc = t_rcv(fd, buf, sizeof buf, &flags)) > 0) {
		if (t_snd(fd, buf, cc, 0) < 0)
			break;
	}
	if (cc < 0 && t_errno == TLOOK)
		(void) t_rcvrel(fd);
	(void) t_close(fd);
	return 0;
}

#define	LINELEN		72

/*------------------------------------------------------------------------
 * TCPchargend - do TCP CHARGEN on the given TLI descriptor
 *------------------------------------------------------------------------
 */
int
TCPchargend(fd)
{
	char	c, buf[LINELEN+2];	/* print LINELEN chars + \r\n */

	c = ' ';
	buf[LINELEN] = '\r';
	buf[LINELEN+1] = '\n';
	while (1) {
		int	i;

		for (i=0; i<LINELEN; ++i) {
			buf[i] = c++;
			if (c > '~')
				c = ' ';
		}
		if (t_snd(fd, buf, LINELEN+2, 0) < 0)
			break;
	}
	(void) t_close(fd);
	return 0;
}


/*------------------------------------------------------------------------
 * TCPdaytimed - do TCP DAYTIME protocol
 *------------------------------------------------------------------------
 */
int
TCPdaytimed(fd)
int	fd;
{
	char	*pts;			/* pointer to time string	*/
	time_t	now;			/* current time			*/
	char	*ctime();

	(void) time(&now);
	pts = ctime(&now);
	(void) t_snd(fd, pts, strlen(pts), 0);
	(void) t_close(fd);
	return 0;
}

#define	UNIXEPOCH	2208988800	/* UNIX epoch, in UCT secs	*/

/*------------------------------------------------------------------------
 * TCPtimed - do TCP TIME protocol
 *------------------------------------------------------------------------
 */
int
TCPtimed(fd)
int	fd;
{
	time_t	now, time();
	u_long	htonl();

	(void) time(&now);
	now = htonl((u_long)(now + UNIXEPOCH));
	(void) t_snd(fd, (char *)&now, sizeof(now), 0);
	return 0;
}
