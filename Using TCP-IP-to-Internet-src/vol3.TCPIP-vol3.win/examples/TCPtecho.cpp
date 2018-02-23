/* TCPtecho.cpp - main, TCPtecho, reader, writer, mstime */

#include <stdio.h>
#include <string.h>
#include <time.h>
#include <winsock.h>

#define	BUFSIZE		4096		/* write buffer size		*/
#define	CCOUNT		64*1024		/* default character count	*/
#define	WSVERS		MAKEWORD(2, 0)

#define	MIN(x, y)	((x)>(y) ? (y) : (x))

#define	USAGE	"usage: TCPtecho [ -c count ] host1 host2...\n"

struct hdat {
	char		*hd_name;	/* host name			*/
	SOCKET		 hd_sock;	/* host socket descriptor	*/
	unsigned	 hd_rc;		/* recv character count		*/
	unsigned	 hd_wc;		/* send character count		*/
} hdat[FD_SETSIZE];			/* fd to host name mapping	*/
char	buf[BUFSIZE];			/* read/write data buffer	*/

void	TCPtecho(fd_set *, int);
int	reader(struct hdat *, fd_set *);
void	writer(struct hdat *, fd_set *);
void	errexit(const char *, ...);
SOCKET	connectTCP(const char *, const char *);
long	mstime(u_long *);


/*------------------------------------------------------------------------
 * main - concurrent TCP client for ECHO service timing
 *------------------------------------------------------------------------
 */
void
main(int argc, char *argv[])
{
	int		ccount = CCOUNT;
	int		i, hcount, fd;
	unsigned long	one = 1;
	fd_set		afds;
	WSADATA		wsdata;

	hcount = 0;
	if (WSAStartup(WSVERS, &wsdata))
		errexit("WSAStartup failed\n");
	FD_ZERO(&afds);
	for (i=1; i<argc; ++i) {
		if (strcmp(argv[i], "-c") == 0) {
			if (++i < argc && (ccount = atoi(argv[i])))
				continue;
			errexit(USAGE);
		}
		/* else, a host */


		fd = connectTCP(argv[i], "echo");

		if (ioctlsocket(fd, FIONBIO, &one)) {
			fprintf(stderr,
			    "can't mark nonblocking (host %s): %d\n",
			    argv[i], GetLastError());
			continue;
		}

		hdat[hcount].hd_name = argv[i];
		hdat[hcount].hd_sock = fd;
		hdat[hcount].hd_rc = hdat[hcount].hd_wc = ccount;
		++hcount;
		FD_SET(fd, &afds);
	}
	TCPtecho(&afds, hcount);
	WSACleanup();
	exit(0);
}

/*------------------------------------------------------------------------
 * TCPtecho - time TCP ECHO requests to multiple servers
 *------------------------------------------------------------------------
 */
void
TCPtecho(fd_set *pafds, int hcount)
{
	fd_set	rfds, wfds;		/* read/write fd sets		*/
	fd_set	rcfds, wcfds;		/* read/write fd sets (copy)	*/
	int	fd, hndx, i;

	for (i=0; i<BUFSIZE; ++i)	/* echo data	*/
		buf[i] = 'D';
	memcpy(&rcfds, pafds, sizeof(rcfds));
	memcpy(&wcfds, pafds, sizeof(wcfds));

	(void) mstime((u_long *)0);	/* set the epoch */

	while (hcount) {
		memcpy(&rfds, &rcfds, sizeof(rfds));
		memcpy(&wfds, &wcfds, sizeof(wfds));

		if (select(FD_SETSIZE, &rfds, &wfds, (fd_set *)0,
				(struct timeval *)0) == SOCKET_ERROR)
			errexit("select failed: error %d\n",
				GetLastError());
		for (hndx=0; hndx<hcount; ++hndx) {
			fd = hdat[hndx].hd_sock;
			if (FD_ISSET(fd, &rfds))
				if (reader(&hdat[hndx], &rcfds) == 0) {
					/* this host is done */
					for (i=hndx+1; i<hcount; ++i)
						hdat[i-1]=hdat[i];
					hcount--;
					continue;
				}
			if (FD_ISSET(fd, &wfds))
				writer(&hdat[hndx], &wcfds);
		}
	}
}

/*------------------------------------------------------------------------
 * reader - handle ECHO reads
 *------------------------------------------------------------------------
 */
int
reader(struct hdat *phd, fd_set *pfdset)
{
	u_long	now;
	int	cc;

	cc = recv(phd->hd_sock, buf, sizeof(buf), 0);
	if (cc == SOCKET_ERROR)
		errexit("recv: error %d\n", GetLastError());
	if (cc == 0)
		errexit("recv: premature end of file\n");
	phd->hd_rc -= cc;
	if (phd->hd_rc > 0)
		return 1;
	(void) mstime(&now);
	printf("%s: %d ms\n", phd->hd_name, now);
	(void) closesocket(phd->hd_sock);
	FD_CLR(phd->hd_sock, pfdset);
	return 0;
}

/*------------------------------------------------------------------------
 * writer - handle ECHO writes
 *------------------------------------------------------------------------
 */
void
writer(struct hdat *phd, fd_set *pfdset)
{
	int	cc;

	cc = send(phd->hd_sock, buf, MIN(sizeof(buf), phd->hd_wc), 0);
	if (cc == SOCKET_ERROR)
		errexit("send: error number %d\n", GetLastError());
	phd->hd_wc -= cc;
	if (phd->hd_wc == 0) {
		(void) shutdown(phd->hd_sock, 1);
		FD_CLR(phd->hd_sock, pfdset);
	}
}

/*------------------------------------------------------------------------
 * mstime - report the number of clock ticks elapsed since mstime(0) call
 *------------------------------------------------------------------------
 */
long
mstime(u_long *pms)
{
	static unsigned long	epoch;
	unsigned long		now;

	now = clock();
	if (pms == 0) {
		epoch = now;
		return 0;
	}
	*pms = now - epoch;
	return *pms;
}
