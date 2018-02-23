/* x_dumper.c - x_dumper */

#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <network.h>


static	dump();
static	int	count, recd = 0;
static	char	buf[256];		/* for sprintf()'s */

/*------------------------------------------------------------------------
 *  x_dumper  -  (command dumper) dump data to a remote TCP echo
 *------------------------------------------------------------------------
 */
COMMAND	x_dumper(stdin, stdout, stderr, nargs, args)
int	stdin, stdout, stderr, nargs;
char	*args[];
{
	char *rhost;
	int cmax;

	if (nargs == 1) {
		write(stderr, "usage: dumper host [count]\n", 27);
		return SYSERR;
	}
	cmax = 1024;
	if (nargs == 3) {
		cmax = atoi(args[2]);
		if (cmax <= 0) {
			write(stderr, "dumper: illegal count\n", 22);
			return SYSERR;
		}
	}
	rhost = args[1];
	dump(rhost, cmax, stdout, stderr);
	return OK;
}

static
dump(rhost, cmax, stdout, stderr)
char	*rhost;
int	cmax, stdout, stderr;
{
	IPaddr	addr;
	char host[22];		/* allows "XXX.XXX.XXX.XXX:XXXXX\0" */
	int fd, cc, wrv;
	char	*inbuf, *outbuf;
	int	sent;
#define	BUFSZ	4000

	inbuf = (char *)getmem(BUFSZ);
	outbuf = (char *)getmem(BUFSZ);
	if ((addr = name2ip(rhost)) == SYSERR) {
		write(stdout, "unknown host\n", 13);
		freemem(inbuf, BUFSZ);
		freemem(outbuf, BUFSZ);
		return SYSERR;
	}
	ip2dot(host, addr);
	strcat(host, ":7");
	fd = open(TCP, host, ANYLPORT);
	if (fd == SYSERR) {
		freemem(inbuf, BUFSZ);
		freemem(outbuf, BUFSZ);
		return SYSERR;
	}
	if (fd < 0) {
		sprintf(buf, "open: %s\n", tcperror[-fd]);
		write(stderr, buf, strlen(buf));
		freemem(inbuf, BUFSZ);
		freemem(outbuf, BUFSZ);
		return SYSERR;
	}
	count = recd = 0;
	while (1) {
		int	cctot;
		int	i;

		do {
			outbuf[count % BUFSZ] = count %26 + 'a';
			++count;
		} while (count % BUFSZ);
		cctot = 0;
		sent = BUFSZ;
		if (count > cmax) {
			count = cmax;
			sent = count % BUFSZ;
		}
		wrv = write(fd, outbuf, sent);
		if (wrv < 0) {
			summary(stdout);
			sprintf(buf, "write: %s\n", tcperror[-wrv]);
			write(stderr, buf, strlen(buf));
			close(fd);
			freemem(inbuf, BUFSZ);
			freemem(outbuf, BUFSZ);
			return SYSERR;
		}

		while (cctot < sent) {
			int cc;

			cc = read(fd, &inbuf[cctot], BUFSZ-cctot);
			if (cc <= 0 || cc == SYSERR) {
				summary(stdout);
				sprintf(buf, "read: %s\n", tcperror[-cc]);
				write(stderr, buf, strlen(buf));
				close(fd);
				freemem(inbuf, BUFSZ);
				freemem(outbuf, BUFSZ);
				return SYSERR;
			}
			recd += cc;
			cctot += cc;
		}
		for (i=0; i<sent; ++i)
			if (inbuf[i] != outbuf[i])
				break;
		if (i != sent) {
			int start, finish;

			count -= sent;
			start = i-10;
			if (start < 0)
				start = 0;
			finish = i+11;
			if (finish > sent-1)
				finish = sent-1;
			inbuf[finish] = '\0';
			outbuf[finish] = '\0';
			sprintf(buf, "in %d: %s\n", count, &inbuf[start]);
			write(stdout, buf, strlen(buf));
			sprintf(buf, "out %d: %s\n", count, &outbuf[start]);
			write(stdout, buf, strlen(buf));
			summary(stdout);
			close(fd);
			freemem(inbuf, BUFSZ);
			freemem(outbuf, BUFSZ);
			return SYSERR;
		}
		if (count == cmax)
			break;
	}
	summary(stdout);
	close(fd);
	freemem(inbuf, BUFSZ);
	freemem(outbuf, BUFSZ);
	return OK;
}


summary(stdout)
{
	sprintf(buf, "%d sent, %d rec'd\n", count, recd);
	write(stdout, buf, strlen(buf));
}
