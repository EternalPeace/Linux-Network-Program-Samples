/* x_finger.c - x_finger */

#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <network.h>


/*------------------------------------------------------------------------
 *  x_finger  -  (command finger) format and print logged on users
 *------------------------------------------------------------------------
 */
COMMAND
x_finger(int stdin, int stdout, int stderr, int nargs, char *args[])
{
	char *rhost, *user, *rindex();
	int	ac = 0;

	if (nargs == 1)
		return lfing(NULL, stdout);
	while (++ac < nargs) {
		rhost = rindex(args[ac], '@'); 
		if (rhost != NULL)
			*rhost++ = '\0';
		if (*args[ac] != '\0')
			user = args[ac];
		else
			user = NULL;
		if (rhost != NULL) {
			rfing(user, rhost, stdout, stderr);
			*--rhost = '@';		/* restore @ */
		} else
			lfing(user, stdout);
	}
}

int
rfing(user, rhost, stdout, stderr)
char *user, *rhost;
{
	IPaddr	addr;
	char host[22];		/* allows "XXX.XXX.XXX.XXX:XXXXX\0" */
	int fd, cc, wrv;
	char buf[2048];

	if ((addr = name2ip(rhost)) == SYSERR) {
		write(stdout, "unknown host\n", 13);
		return SYSERR;
	}
	ip2dot(host, addr);
	strcat(host, ":79");

	sprintf(buf, "[%s", rhost);
	write(stdout, buf, strlen(buf));

	fd = open(TCP, host, ANYLPORT);
	if (fd == SYSERR)
		return SYSERR;
	if (fd < 0) {
		sprintf(buf, "open: %s\n", tcperror[-fd]);
		write(stderr, buf, strlen(buf));
		return SYSERR;
	}
	write(stdout, "]\n", 2);
	if (user) {
		char ubuf[64];
		sprintf(ubuf, "%s\r\n", user);
		write(fd, ubuf, strlen(ubuf));
	} else
		write(fd, "\r\n", 2);

	if (control(fd, TCPC_SOPT, TCP_BUFFER, 0) == SYSERR) {
		sprintf(buf, "TCPC_SOPT failed\n");
		write(stderr, buf, strlen(buf));
		return SYSERR;
	}

	wrv = 0;
	while ((cc = read(fd, buf, sizeof(buf))) > 0) {
		if (cc == SYSERR) {
			write(stderr, "read returned SYSERR\n", 21);
			break;
		}
		wrv = write(stdout, buf, cc);
		if (wrv < 0)
			break;
	}
	if (cc < 0) {
		sprintf(buf, "read: %s\n", tcperror[-cc]);
		write(stderr, buf, strlen(buf));
	} else if (wrv < 0) {
		sprintf(buf, "write: %s\n", tcperror[-wrv]);
		write(stderr, buf, strlen(buf));
	}
	close(fd);
	return OK;
}
