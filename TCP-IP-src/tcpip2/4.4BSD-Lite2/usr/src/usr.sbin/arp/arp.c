/*
 * Copyright (c) 1984, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * Sun Microsystems, Inc.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#ifndef lint
static char copyright[] =
"@(#) Copyright (c) 1984, 1993\n\
	The Regents of the University of California.  All rights reserved.\n";
#endif /* not lint */

#ifndef lint
static char sccsid[] = "@(#)arp.c	8.3 (Berkeley) 4/28/95";
#endif /* not lint */

/*
 * arp - display, set, and delete arp table entries
 */


#include <sys/param.h>
#include <sys/file.h>
#include <sys/socket.h>
#include <sys/sysctl.h>

#include <net/if.h>
#include <net/if_dl.h>
#include <net/if_types.h>
#include <net/route.h>

#include <netinet/in.h>
#include <netinet/if_ether.h>

#include <arpa/inet.h>

#include <err.h>
#include <errno.h>
#include <netdb.h>
#include <nlist.h>
#include <paths.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

static int pid;
static int nflag;
static int s = -1;

int	delete __P((char *, char *));
void	dump __P((u_long));
int	ether_aton __P((char *, u_char *));
void	ether_print __P((u_char *));
int	file __P((char *));
void	get __P((char *));
void	getsocket __P((void));
int	rtmsg __P((int));
int	set __P((int, char **));
void	usage __P((void));

int
main(argc, argv)
	int argc;
	char **argv;
{
	int ch;

	pid = getpid();
	while ((ch = getopt(argc, argv, "ands")) != EOF)
		switch((char)ch) {
		case 'a':
			dump(0);
			exit(0);
		case 'd':
			if (argc < 3 || argc > 4)
				usage();
			delete(argv[2], argv[3]);
			exit(0);
		case 'n':
			nflag = 1;
			continue;
		case 's':
			if (argc < 4 || argc > 7)
				usage();
			exit(set(argc-2, &argv[2]) ? 1 : 0);
		case '?':
		default:
			usage();
		}
	if (argc != 2)
		usage();
	get(argv[1]);
	return (0);
}

/*
 * Process a file to set standard arp entries
 */
int
file(name)
	char *name;
{
	FILE *fp;
	int i, retval;
	char line[100], arg[5][50], *args[5];

	if ((fp = fopen(name, "r")) == NULL) {
		fprintf(stderr, "arp: cannot open %s\n", name);
		exit(1);
	}
	args[0] = &arg[0][0];
	args[1] = &arg[1][0];
	args[2] = &arg[2][0];
	args[3] = &arg[3][0];
	args[4] = &arg[4][0];
	retval = 0;
	while(fgets(line, 100, fp) != NULL) {
		i = sscanf(line, "%s %s %s %s %s", arg[0], arg[1], arg[2],
		    arg[3], arg[4]);
		if (i < 2) {
			fprintf(stderr, "arp: bad line: %s\n", line);
			retval = 1;
			continue;
		}
		if (set(i, args))
			retval = 1;
	}
	fclose(fp);
	return (retval);
}

void
getsocket() {
	if (s < 0) {
		s = socket(PF_ROUTE, SOCK_RAW, 0);
		if (s < 0) {
			perror("arp: socket");
			exit(1);
		}
	}
}

struct	sockaddr_in so_mask = {8, 0, 0, { 0xffffffff}};
struct	sockaddr_inarp blank_sin = {sizeof(blank_sin), AF_INET }, sin_m;
struct	sockaddr_dl blank_sdl = {sizeof(blank_sdl), AF_LINK }, sdl_m;
int	expire_time, flags, export_only, doing_proxy, found_entry;
struct	{
	struct	rt_msghdr m_rtm;
	char	m_space[512];
}	m_rtmsg;

/*
 * Set an individual arp entry 
 */
int
set(argc, argv)
	int argc;
	char **argv;
{
	struct hostent *hp;
	register struct sockaddr_inarp *sin = &sin_m;
	register struct sockaddr_dl *sdl;
	register struct rt_msghdr *rtm = &(m_rtmsg.m_rtm);
	u_char *ea;
	char *host = argv[0], *eaddr = argv[1];

	getsocket();
	argc -= 2;
	argv += 2;
	sdl_m = blank_sdl;
	sin_m = blank_sin;
	sin->sin_addr.s_addr = inet_addr(host);
	if (sin->sin_addr.s_addr == -1) {
		if (!(hp = gethostbyname(host))) {
			fprintf(stderr, "arp: %s: ", host);
			herror((char *)NULL);
			return (1);
		}
		bcopy((char *)hp->h_addr, (char *)&sin->sin_addr,
		    sizeof sin->sin_addr);
	}
	ea = (u_char *)LLADDR(&sdl_m);
	if (ether_aton(eaddr, ea) == 0)
		sdl_m.sdl_alen = 6;
	doing_proxy = flags = export_only = expire_time = 0;
	while (argc-- > 0) {
		if (strncmp(argv[0], "temp", 4) == 0) {
			struct timeval time;
			gettimeofday(&time, 0);
			expire_time = time.tv_sec + 20 * 60;
		}
		else if (strncmp(argv[0], "pub", 3) == 0) {
			flags |= RTF_ANNOUNCE;
			doing_proxy = SIN_PROXY;
		} else if (strncmp(argv[0], "trail", 5) == 0) {
			printf("%s: Sending trailers is no longer supported\n",
				host);
		}
		argv++;
	}
tryagain:
	if (rtmsg(RTM_GET) < 0) {
		perror(host);
		return (1);
	}
	sin = (struct sockaddr_inarp *)(rtm + 1);
	sdl = (struct sockaddr_dl *)(sin->sin_len + (char *)sin);
	if (sin->sin_addr.s_addr == sin_m.sin_addr.s_addr) {
		if (sdl->sdl_family == AF_LINK &&
		    (rtm->rtm_flags & RTF_LLINFO) &&
		    !(rtm->rtm_flags & RTF_GATEWAY)) switch (sdl->sdl_type) {
		case IFT_ETHER: case IFT_FDDI: case IFT_ISO88023:
		case IFT_ISO88024: case IFT_ISO88025:
			goto overwrite;
		}
		if (doing_proxy == 0) {
			printf("set: can only proxy for %s\n", host);
			return (1);
		}
		if (sin_m.sin_other & SIN_PROXY) {
			printf("set: proxy entry exists for non 802 device\n");
			return(1);
		}
		sin_m.sin_other = SIN_PROXY;
		export_only = 1;
		goto tryagain;
	}
overwrite:
	if (sdl->sdl_family != AF_LINK) {
		printf("cannot intuit interface index and type for %s\n", host);
		return (1);
	}
	sdl_m.sdl_type = sdl->sdl_type;
	sdl_m.sdl_index = sdl->sdl_index;
	return (rtmsg(RTM_ADD));
}

/*
 * Display an individual arp entry
 */
void
get(host)
	char *host;
{
	struct hostent *hp;
	struct sockaddr_inarp *sin = &sin_m;

	sin_m = blank_sin;
	sin->sin_addr.s_addr = inet_addr(host);
	if (sin->sin_addr.s_addr == -1) {
		if (!(hp = gethostbyname(host))) {
			fprintf(stderr, "arp: %s: ", host);
			herror((char *)NULL);
			exit(1);
		}
		bcopy((char *)hp->h_addr, (char *)&sin->sin_addr,
		    sizeof sin->sin_addr);
	}
	dump(sin->sin_addr.s_addr);
	if (found_entry == 0) {
		printf("%s (%s) -- no entry\n",
		    host, inet_ntoa(sin->sin_addr));
		exit(1);
	}
}

/*
 * Delete an arp entry 
 */
int
delete(host, info)
	char *host;
	char *info;
{
	struct hostent *hp;
	register struct sockaddr_inarp *sin = &sin_m;
	register struct rt_msghdr *rtm = &m_rtmsg.m_rtm;
	struct sockaddr_dl *sdl;

	if (info && strncmp(info, "pro", 3) )
		export_only = 1;
	getsocket();
	sin_m = blank_sin;
	sin->sin_addr.s_addr = inet_addr(host);
	if (sin->sin_addr.s_addr == -1) {
		if (!(hp = gethostbyname(host))) {
			fprintf(stderr, "arp: %s: ", host);
			herror((char *)NULL);
			return (1);
		}
		bcopy((char *)hp->h_addr, (char *)&sin->sin_addr,
		    sizeof sin->sin_addr);
	}
tryagain:
	if (rtmsg(RTM_GET) < 0) {
		perror(host);
		return (1);
	}
	sin = (struct sockaddr_inarp *)(rtm + 1);
	sdl = (struct sockaddr_dl *)(sin->sin_len + (char *)sin);
	if (sin->sin_addr.s_addr == sin_m.sin_addr.s_addr) {
		if (sdl->sdl_family == AF_LINK &&
		    (rtm->rtm_flags & RTF_LLINFO) &&
		    !(rtm->rtm_flags & RTF_GATEWAY)) switch (sdl->sdl_type) {
		case IFT_ETHER: case IFT_FDDI: case IFT_ISO88023:
		case IFT_ISO88024: case IFT_ISO88025:
			goto delete;
		}
	}
	if (sin_m.sin_other & SIN_PROXY) {
		fprintf(stderr, "delete: can't locate %s\n",host);
		return (1);
	} else {
		sin_m.sin_other = SIN_PROXY;
		goto tryagain;
	}
delete:
	if (sdl->sdl_family != AF_LINK) {
		printf("cannot locate %s\n", host);
		return (1);
	}
	if (rtmsg(RTM_DELETE))
		return (1);
	printf("%s (%s) deleted\n", host, inet_ntoa(sin->sin_addr));
	return (0);
}

/*
 * Dump the entire arp table
 */
void
dump(addr)
	u_long addr;
{
	int mib[6];
	size_t needed;
	char *host, *lim, *buf, *next;
	struct rt_msghdr *rtm;
	struct sockaddr_inarp *sin;
	struct sockaddr_dl *sdl;
	extern int h_errno;
	struct hostent *hp;

	mib[0] = CTL_NET;
	mib[1] = PF_ROUTE;
	mib[2] = 0;
	mib[3] = AF_INET;
	mib[4] = NET_RT_FLAGS;
	mib[5] = RTF_LLINFO;
	if (sysctl(mib, 6, NULL, &needed, NULL, 0) < 0)
		err(1, "route-sysctl-estimate");
	if ((buf = malloc(needed)) == NULL)
		err(1, "malloc");
	if (sysctl(mib, 6, buf, &needed, NULL, 0) < 0)
		err(1, "actual retrieval of routing table");
	lim = buf + needed;
	for (next = buf; next < lim; next += rtm->rtm_msglen) {
		rtm = (struct rt_msghdr *)next;
		sin = (struct sockaddr_inarp *)(rtm + 1);
		sdl = (struct sockaddr_dl *)(sin + 1);
		if (addr) {
			if (addr != sin->sin_addr.s_addr)
				continue;
			found_entry = 1;
		}
		if (nflag == 0)
			hp = gethostbyaddr((caddr_t)&(sin->sin_addr),
			    sizeof sin->sin_addr, AF_INET);
		else
			hp = 0;
		if (hp)
			host = hp->h_name;
		else {
			host = "?";
			if (h_errno == TRY_AGAIN)
				nflag = 1;
		}
		printf("%s (%s) at ", host, inet_ntoa(sin->sin_addr));
		if (sdl->sdl_alen)
			ether_print((u_char *)LLADDR(sdl));
		else
			printf("(incomplete)");
		if (rtm->rtm_rmx.rmx_expire == 0)
			printf(" permanent");
		if (sin->sin_other & SIN_PROXY)
			printf(" published (proxy only)");
		if (rtm->rtm_addrs & RTA_NETMASK) {
			sin = (struct sockaddr_inarp *)
				(sdl->sdl_len + (char *)sdl);
			if (sin->sin_addr.s_addr == 0xffffffff)
				printf(" published");
			if (sin->sin_len != 8)
				printf("(wierd)");
		}
		printf("\n");
	}
}

void
ether_print(cp)
	u_char *cp;
{
	printf("%x:%x:%x:%x:%x:%x", cp[0], cp[1], cp[2], cp[3], cp[4], cp[5]);
}

int
ether_aton(a, n)
	char *a;
	u_char *n;
{
	int i, o[6];

	i = sscanf(a, "%x:%x:%x:%x:%x:%x", &o[0], &o[1], &o[2],
					   &o[3], &o[4], &o[5]);
	if (i != 6) {
		fprintf(stderr, "arp: invalid Ethernet address '%s'\n", a);
		return (1);
	}
	for (i=0; i<6; i++)
		n[i] = o[i];
	return (0);
}

void
usage()
{
	printf("usage: arp hostname\n");
	printf("       arp -a [kernel] [kernel_memory]\n");
	printf("       arp -d hostname\n");
	printf("       arp -s hostname ether_addr [temp] [pub]\n");
	printf("       arp -f filename\n");
	exit(1);
}

int
rtmsg(cmd)
	int cmd;
{
	static int seq;
	int rlen;
	register struct rt_msghdr *rtm = &m_rtmsg.m_rtm;
	register char *cp = m_rtmsg.m_space;
	register int l;

	errno = 0;
	if (cmd == RTM_DELETE)
		goto doit;
	bzero((char *)&m_rtmsg, sizeof(m_rtmsg));
	rtm->rtm_flags = flags;
	rtm->rtm_version = RTM_VERSION;

	switch (cmd) {
	default:
		fprintf(stderr, "arp: internal wrong cmd\n");
		exit(1);
	case RTM_ADD:
		rtm->rtm_addrs |= RTA_GATEWAY;
		rtm->rtm_rmx.rmx_expire = expire_time;
		rtm->rtm_inits = RTV_EXPIRE;
		rtm->rtm_flags |= (RTF_HOST | RTF_STATIC);
		sin_m.sin_other = 0;
		if (doing_proxy) {
			if (export_only)
				sin_m.sin_other = SIN_PROXY;
			else {
				rtm->rtm_addrs |= RTA_NETMASK;
				rtm->rtm_flags &= ~RTF_HOST;
			}
		}
		/* FALLTHROUGH */
	case RTM_GET:
		rtm->rtm_addrs |= RTA_DST;
	}
#define NEXTADDR(w, s) \
	if (rtm->rtm_addrs & (w)) { \
		bcopy((char *)&s, cp, sizeof(s)); cp += sizeof(s);}

	NEXTADDR(RTA_DST, sin_m);
	NEXTADDR(RTA_GATEWAY, sdl_m);
	NEXTADDR(RTA_NETMASK, so_mask);

	rtm->rtm_msglen = cp - (char *)&m_rtmsg;
doit:
	l = rtm->rtm_msglen;
	rtm->rtm_seq = ++seq;
	rtm->rtm_type = cmd;
	if ((rlen = write(s, (char *)&m_rtmsg, l)) < 0) {
		if (errno != ESRCH || cmd != RTM_DELETE) {
			perror("writing to routing socket");
			return (-1);
		}
	}
	do {
		l = read(s, (char *)&m_rtmsg, sizeof(m_rtmsg));
	} while (l > 0 && (rtm->rtm_seq != seq || rtm->rtm_pid != pid));
	if (l < 0)
		(void) fprintf(stderr, "arp: read from routing socket: %s\n",
		    strerror(errno));
	return (0);
}
