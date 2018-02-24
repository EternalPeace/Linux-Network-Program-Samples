/*
 * The original version of xfer by Kevin Dunlap.
 * Completed and integrated with named by David Waitzman
 *	(dwaitzman@bbn.com) 3/14/88.
 * Modified by M. Karels and O. Kure 10-88.
 */

/*
 * ++Copyright++ 1988, 1990
 * -
 * Copyright (c) 1988, 1990
 *    The Regents of the University of California.  All rights reserved.
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
 * 	This product includes software developed by the University of
 * 	California, Berkeley and its contributors.
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
 * -
 * Portions Copyright (c) 1993 by Digital Equipment Corporation.
 * 
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies, and that
 * the name of Digital Equipment Corporation not be used in advertising or
 * publicity pertaining to distribution of the document or software without
 * specific, written prior permission.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS" AND DIGITAL EQUIPMENT CORP. DISCLAIMS ALL
 * WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS.   IN NO EVENT SHALL DIGITAL EQUIPMENT
 * CORPORATION BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
 * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
 * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
 * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
 * SOFTWARE.
 * -
 * --Copyright--
 */

#if !defined(lint) && !defined(SABER)
char copyright[] =
"@(#) Copyright (c) 1988, 1990 The Regents of the University of California.\n\
 portions Copyright (c) 1993 Digital Equipment Corporation\n\
 All rights reserved.\n";
#endif /* not lint */

#if !defined(lint) && !defined(SABER)
static char sccsid[] = "@(#)named-xfer.c	4.18 (Berkeley) 3/7/91";
static char rcsid[] = "$Id: named-xfer.c,v 4.9.1.8 1993/11/03 12:26:04 vixie Exp $";
#endif /* not lint */

#include <sys/param.h>
#include <sys/file.h>
#include <sys/stat.h>
#include <sys/socket.h>

#include <netinet/in.h>
#include <net/if.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <arpa/nameser.h>

#include <errno.h>
#include <resolv.h>
#include <stdio.h>
#include <syslog.h>
#include <math.h>

#define MAIN_PROGRAM
#include "named.h"
#undef MAIN_PROGRAM

#ifdef POSIX_SIGNALS
#include <signal.h>
#else
#include <sys/signal.h>
#endif

static	struct zoneinfo	zone;		/* zone information */

static	char		ddtfilename[] = _PATH_TMPXFER,
			*ddtfile = ddtfilename,
			*tmpname,
			*domain;		/* domain being xfered */

static	int		quiet = 0,
			read_interrupted = 0,
			domain_len;		/* strlen(domain) */

static	FILE		*fp = NULL,
			*dbfp = NULL;

static	void		usage();
static	int		getzone(), soa_zinfo(), print_output(), samedomain();
static	SIG_FN		read_alarm();
static	char		*ProgName;

extern char *optarg;
extern int optind, getopt();

void
main(argc, argv)
	int argc;
	char *argv[];
{
	register struct zoneinfo *zp;
	register struct hostent *hp;
 	char *dbfile = NULL, *tracefile = NULL, *tm = NULL;
	int dbfd, ddtd, result, c, fd, closed = 0;
	u_int32_t serial_no = 0;
	u_int16_t port = htons(NAMESERVER_PORT);
#ifdef STUBS
	int stub_only = 0;
#endif
#ifdef GEN_AXFR
	int class = C_IN;
#endif

	if (ProgName = strrchr(argv[0], '/'))
		ProgName++;
	else
		ProgName = argv[0];

	(void) umask(022);

	/* this is a hack; closing everything in the parent is hard. */
	for (fd = getdtablesize()-1;  fd > 2;  fd--)	/* "2" is stderr... */
		closed += (close(fd) == 0);

#ifdef LOG_DAEMON
	openlog(ProgName, LOG_PID|LOG_CONS, LOGFAC);
#else
	openlog(ProgName, LOG_PID);
#endif
#ifdef STUBS
	while ((c = getopt(argc, argv, "C:d:l:s:t:z:f:p:P:qS")) != EOF)
#else
	while ((c = getopt(argc, argv, "C:d:l:s:t:z:f:p:P:q")) != EOF)
#endif
	    switch (c) {
#ifdef GEN_AXFR
	        case 'C':
			class = get_class(optarg);
			break;
#endif
		case 'd':
			debug = atoi(optarg);
			break;
		case 'l':
			ddtfile = (char *)malloc(strlen(optarg) +
			    sizeof(".XXXXXX") + 1);
#ifdef SHORT_FNAMES
			filenamecpy(ddtfile, optarg);
#else
			(void) strcpy(ddtfile, optarg);
#endif /* SHORT_FNAMES */
			(void) strcat(ddtfile, ".XXXXXX");
			break;
		case 's':
			serial_no = strtoul(optarg, (char **)NULL, 10);
			break;
		case 't':
			tracefile = optarg;
			break;
		case 'z':		/* zone == domain */
			domain = optarg;
			domain_len = strlen(domain);
			break;
		case 'f':
			dbfile = optarg;
			tmpname = (char *)malloc((unsigned)strlen(optarg) +
			    sizeof(".XXXXXX") + 1);
#ifdef SHORT_FNAMES
			filenamecpy(tmpname, optarg);
#else
			(void) strcpy(tmpname, optarg);
#endif /* SHORT_FNAMES */
			break;
		case 'p':
			port = htons((u_int16_t)atoi(optarg));
			break;
		case 'P':
			port = (u_int16_t)atoi(optarg);
			break;
#ifdef STUBS
		case 'S':
			stub_only = 1;
			break;
#endif
		case 'q':
			quiet++;
			break;
		case '?':
		default:
			usage("unrecognized argument");
			/* NOTREACHED */
	    }

	if (!domain || !dbfile || optind >= argc) {
		if (!domain)
			usage("no domain");
		if (!dbfile)
			usage("no dbfile");
		if (optind >= argc)
			usage("not enough arguments");
		/* NOTREACHED */
	}
	if (tracefile && (fp = fopen(tracefile, "w")) == NULL)
		perror(tracefile);
	(void) strcat(tmpname, ".XXXXXX");
	/* tmpname is now something like "/etc/named/named.bu.db.XXXXXX" */
	if ((dbfd = mkstemp(tmpname)) == -1) {
		perror(tmpname);
		if (!quiet)
			syslog(LOG_ERR, "can't make tmpfile (%s): %m\n",
			    tmpname);
		exit(XFER_FAIL);
	}
	if (fchmod(dbfd, 0644) == -1) {
		perror(tmpname);
		if (!quiet)
			syslog(LOG_ERR, "can't fchmod tmpfile (%s): %m\n",
			    tmpname);
		exit(XFER_FAIL);
	}
	if ((dbfp = fdopen(dbfd, "r+")) == NULL) {
		perror(tmpname);
		if (!quiet)
			syslog(LOG_ERR, "can't fdopen tmpfile (%s)", tmpname);
		exit(XFER_FAIL);
	}
#ifdef DEBUG
	if (debug) {
		/* ddtfile is now something like "/usr/tmp/xfer.ddt.XXXXXX" */
		if ((ddtd = mkstemp(ddtfile)) == -1) {
			perror(ddtfile);
			debug = 0;
		} else if (fchmod(ddtd, 0644) == -1) {
			perror(ddtfile);
			debug = 0;
		} else if ((ddt = fdopen(ddtd, "w")) == NULL) {
			perror(ddtfile);
			debug = 0;
		} else {
#if defined(SYSV)
			setvbuf(ddt, NULL, _IOLBF, BUFSIZ);
#else
			setlinebuf(ddt);
#endif
		}
	}
#endif
	/*
	 * Ignore many types of signals that named (assumed to be our parent)
	 * considers important- if not, the user controlling named with
	 * signals usually kills us.
	 */
	(void) signal(SIGHUP, SIG_IGN);
	(void) signal(SIGSYS, SIG_IGN);
	if (debug == 0) {
		(void) signal(SIGINT, SIG_IGN);
		(void) signal(SIGQUIT, SIG_IGN);
	}
	(void) signal(SIGIOT, SIG_IGN);

#if defined(SIGUSR1) && defined(SIGUSR2)
	(void) signal(SIGUSR1, SIG_IGN);
	(void) signal(SIGUSR2, SIG_IGN);
#else	/* SIGUSR1&&SIGUSR2 */
	(void) signal(SIGEMT, SIG_IGN);
	(void) signal(SIGFPE, SIG_IGN);
#endif /* SIGUSR1&&SIGUSR2 */

	dprintf(1, (ddt,
		    "domain `%s'; file `%s'; serial %lu; closed %d\n",
		    domain, dbfile, serial_no, closed));

	buildservicelist();
	buildprotolist();

	/* init zone data */
 
	zp = &zone;
#ifdef STUBS
	if (stub_only)
		zp->z_type = Z_STUB;
	else
#endif
		zp->z_type = Z_SECONDARY;
#ifdef GEN_AXFR
	zp->z_class = class;
#endif
	zp->z_origin = domain;
	zp->z_source = dbfile;
	zp->z_addrcnt = 0;
	dprintf(1, (ddt, "zone found (%d): \"%s\", source = %s\n",
		    zp->z_type,
		    (zp->z_origin[0] == '\0')
			? "."
		        : zp->z_origin,
		    zp->z_source));

	for (;  optind != argc;  optind++, zp->z_addrcnt++) {
		tm = argv[optind];
		if (!inet_aton(tm, &zp->z_addr[zp->z_addrcnt])) {
			hp = gethostbyname(tm);
			if (hp == NULL) {
				syslog(LOG_ERR,
				       "uninterpretable server (%s) for %s\n",
					tm, zp->z_origin);
				zp->z_addrcnt--;	/* hack */
				continue;
			}
			bcopy(hp->h_addr,
			    (char *)&zp->z_addr[zp->z_addrcnt].s_addr,
			    sizeof(zp->z_addr[zp->z_addrcnt].s_addr));
			dprintf(1, (ddt, "Arg: \"%s\"\n", tm));
		}
		if (zp->z_addr[zp->z_addrcnt].s_addr == 0) {
			syslog(LOG_ERR, "SOA query to localhost (%s) for %s",
			       tm, zp->z_origin);
			zp->z_addrcnt--;	/* hack */
			continue;
		}
		if (zp->z_addrcnt >= NSMAX) {
			zp->z_addrcnt = NSMAX;
			dprintf(1, (ddt, "NSMAX reached\n"));
			break;
		}
	}
	dprintf(1, (ddt, "addrcnt = %d\n", zp->z_addrcnt));

	_res.options &= ~(RES_DEFNAMES | RES_DNSRCH | RES_RECURSE);
	result = getzone(zp, serial_no, port);
	(void) my_fclose(dbfp);
	switch (result) {

	case XFER_SUCCESS:			/* ok exit */
		if (rename(tmpname, dbfile) == -1) {
			perror("rename");
			if (!quiet)
			    syslog(LOG_ERR, "rename %s to %s: %m",
				tmpname, dbfile);
			exit(XFER_FAIL);
		}
		exit(XFER_SUCCESS);

	case XFER_UPTODATE:		/* the zone was already uptodate */
		(void) unlink(tmpname);
		exit(XFER_UPTODATE);

	case XFER_TIMEOUT:
#ifdef DEBUG
		if (!debug)
#endif
		    (void) unlink(tmpname);
		exit(XFER_TIMEOUT);	/* servers not reachable exit */

	case XFER_FAIL:
	default:
#ifdef DEBUG
		if (!debug)
#endif
		    (void) unlink(tmpname);
		exit(XFER_FAIL);	/* yuck exit */
	}
	/*NOTREACHED*/
}
 
static char *UsageText[] = {
	"\t-z zone_to_transfer\n",
	"\t-f db_file\n",
	"\t-s serial_no\n",
	"\t[-d debug_level]\n",
	"\t[-l debug_log_file]\n",
	"\t[-t trace_file]\n",
	"\t[-p port]\n",
#ifdef STUBS
	"\t[-S]\n",
#endif
#ifdef GEN_AXFR
	"\t[-C class]\n",
#endif
	"\tservers...\n",
	NULL
};

static void
usage(msg)
	char *msg;
{
	char **line;

	fprintf(stderr, "Usage error: %s\n", msg);
	fprintf(stderr, "Usage: %s\n", ProgName);
	for (line = UsageText;  *line;  line++)
		fputs(*line, stderr);
	exit(XFER_FAIL);
}

#define DEF_DNAME	'\001'		/* '\0' means the root domain */
int	minimum_ttl = 0, got_soa = 0;
char	prev_origin[MAXDNAME];
char	prev_dname[MAXDNAME] = { DEF_DNAME };

static int
getzone(zp, serial_no, port)
	struct zoneinfo *zp;
	u_int32_t serial_no;
	u_int16_t port;
{
	HEADER *hp;
	u_int16_t len;
	u_int32_t serial;
	int s, n, l, cnt, nscnt, soacnt, error = 0;
 	u_char *cp, *nmp, *eom, *tmp ;
	u_char *buf = NULL;
	int bufsize;
	u_char name[MAXDNAME], name2[MAXDNAME];
	struct sockaddr_in sin;
	struct zoneinfo zp_start, zp_finish;
	struct itimerval ival, zeroival;
#ifdef POSIX_SIGNALS
	struct sigaction sv, osv;
#else
	struct sigvec sv, osv;
#endif
	int ancount, aucount;
	int Class;
#ifdef DEBUG
	if (debug) {
		(void)fprintf(ddt,"getzone() %s ", zp->z_origin);
		switch (zp->z_type) {
		case Z_STUB:
			fprintf(ddt,"stub\n");
			break;
		case Z_SECONDARY:
			fprintf(ddt,"secondary\n");
			break;
		default:
			fprintf(ddt,"unknown type\n");
		}
	}
#endif
	bzero((char *)&zeroival, sizeof(zeroival));
	ival = zeroival;
	ival.it_value.tv_sec = XFER_TIMER;
#ifdef POSIX_SIGNALS
	sv.sa_handler = read_alarm;
	/* SA_ONSTACK isn't recommended for strict POSIX code */
	/* is it absolutely necessary? */
	/* sv.sa_flags = SA_ONSTACK; */
	sigfillset(&sv.sa_mask);
	(void) sigaction(SIGALRM, &sv, &osv);
#else
	sv.sv_handler = read_alarm;
	sv.sv_onstack = 0;
	sv.sv_mask = ~0;
	(void) sigvec(SIGALRM, &sv, &osv);
#endif

	strcpy(prev_origin, zp->z_origin);

	for (cnt = 0; cnt < zp->z_addrcnt; cnt++) {
#ifdef GEN_AXFR
		Class = zp->z_class;
#else
		Class = C_IN;
#endif
		error = 0;
		if (buf == NULL) {
			if ((buf = (u_char *)malloc(2 * PACKETSZ)) == NULL) {
				syslog(LOG_ERR, "malloc(%u) failed",
				    2 * PACKETSZ);
				error++;
				break;
			}
			bufsize = 2 * PACKETSZ;
		}
		bzero((char *)&sin, sizeof(sin));
		sin.sin_family = AF_INET;
		sin.sin_port = port;
		sin.sin_addr = zp->z_addr[cnt];
		if ((s = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
			syslog(LOG_ERR, "socket: %m");
			error++;
			break;
		}	
		dprintf(2, (ddt, "connecting to server #%d [%s].%d\n",
			    cnt+1, inet_ntoa(sin.sin_addr),
			    ntohs(sin.sin_port)));
		if (connect(s, (struct sockaddr *)&sin, sizeof(sin)) < 0) {
			(void) my_close(s);
			error++;
			dprintf(2, (ddt, "connect failed: %s\n",
				    strerror(errno)));
			continue;
		}	
tryagain:
		if ((n = res_mkquery(QUERY, zp->z_origin, Class,
		    T_SOA, (char *)NULL, 0, NULL, (char *)buf, bufsize)) < 0) {
			if (!quiet)
			    syslog(LOG_ERR,
				   "zone %s: res_mkquery T_SOA failed",
				   zp->z_origin);
			(void) my_close(s);
#ifdef POSIX_SIGNALS
			(void) sigaction(SIGALRM, &osv, (struct sigaction *)0);
#else
			(void) sigvec(SIGALRM, &osv, (struct sigvec *)0);
#endif
			return XFER_FAIL;
		}
		/*
		 * Send length & message for SOA query
		 */
		if (writemsg(s, buf, n) < 0) {
			(void) my_close(s);
			error++;
			dprintf(2, (ddt, "writemsg failed\n"));
			continue;	
		}
		/*
		 * Get out your butterfly net and catch the SOA
		 */
		cp = buf;
		l = sizeof(u_int16_t);
		read_interrupted = 0;
		while (l > 0) {
			dprintf(11, (ddt, "Before setitimer\n"));
			(void) setitimer(ITIMER_REAL, &ival,
			    (struct itimerval *)NULL);
			dprintf(11, (ddt, "Before recv(l = %d)\n",n));
			errno = 0;
			if ((n = recv(s, (char *)cp, l, 0)) > 0) {
				cp += n;
				l -= n;
			} else {
				dprintf(11, (ddt,
				"bad recv->%d, errno= %d, read_interrupt=%d\n",
					     n, errno, read_interrupted));
				if (n == -1 && errno == EINTR 
				    && !read_interrupted)
					continue;
				error++;
				break;
			}
		}

		(void) setitimer(ITIMER_REAL, &zeroival,
		    (struct itimerval *)NULL);
		if (error) {
			(void) my_close(s);
			continue;
		}
		if ((len = htons(*(u_int16_t *)buf)) == 0) {
			(void) my_close(s);
			continue;
		}
		if (len > bufsize) {
			if ((buf = (u_char *)realloc(buf, len)) == NULL) {
				syslog(LOG_ERR,
		       "malloc(%u) failed for SOA from server [%s], zone %s\n",
				       len,
				       inet_ntoa(sin.sin_addr),
				       zp->z_origin);
				(void) my_close(s);
				continue;
			}
			bufsize = len;
		}
		l = len;
		cp = buf;
		while (l > 0) {
			(void) setitimer(ITIMER_REAL, &ival,
			    (struct itimerval *)NULL);
			errno = 0;
			if ((n = recv(s, (char *)cp, l, 0)) > 0) {
				cp += n;
				l -= n;
			} else {
				if (errno == EINTR && !read_interrupted)
					continue;
				error++;
				dprintf(11, (ddt,
					    "recv failed: n= %d, errno = %d\n",
					     n, errno));
				break;
			}
		}
		(void) setitimer(ITIMER_REAL, &zeroival,
				 (struct itimerval *)NULL);
		if (error) {
			(void) my_close(s);
			continue;
		}
#ifdef DEBUG
		if (debug >= 3) {
			(void)fprintf(ddt,"len = %d\n", len);
			fp_query((char *)buf, ddt);
		}
#endif
		hp = (HEADER *) buf;
		ancount = ntohs(hp->ancount);
		aucount = ntohs(hp->nscount);

		/*
		 * close socket if:
		 *  1) rcode != NOERROR
		 *  2) not an authority response
		 *  3) both the number of answers and authority count < 1)
		 */
		if (hp->rcode != NOERROR || !(hp->aa) || 
		    (ancount < 1 && aucount < 1)) {
#ifndef GEN_AXFR

			if (Class == C_IN) {
				dprintf(1, (ddt,"SOA failed, trying C_HS\n"));
				Class = C_HS;
				goto tryagain;
			}
#endif
			if (!quiet)
				syslog(LOG_ERR,
	    "%s from [%s], zone %s: rcode %d, aa %d, ancount %d, aucount %d\n",
				    "bad response to SOA query",
				    inet_ntoa(sin.sin_addr), zp->z_origin,
				    hp->rcode, hp->aa, ancount, aucount);
			dprintf(1, (ddt,
	    "%s from [%s], zone %s: rcode %d, aa %d, ancount %d, aucount %d\n",
				    "bad response to SOA query",
				    inet_ntoa(sin.sin_addr), zp->z_origin,
				    hp->rcode, hp->aa, ancount, aucount));
			(void) my_close(s);
			error++;
			continue;
		}
		zp_start = *zp;
		if (len < sizeof(HEADER) + QFIXEDSZ) {
	badsoa:
			if (!quiet)
				syslog(LOG_ERR,
				 "malformed SOA from [%s], zone %s: too short\n",
				       inet_ntoa(sin.sin_addr), zp->z_origin);
			dprintf(1, (ddt,
				    "malformed SOA from [%s]: too short\n",
				    inet_ntoa(sin.sin_addr)));
			(void) my_close(s);
			error++;
			continue;
		}
		tmp = buf + sizeof(HEADER);
		eom = buf + len;
		if ((n = dn_skipname(tmp, eom)) == -1)
			goto badsoa;
		tmp += n + QFIXEDSZ;
		if ((n = dn_skipname(tmp, eom)) == -1)
			goto badsoa;
		tmp += n;
		if (soa_zinfo(&zp_start, tmp, eom) == -1)
			goto badsoa;
		/* compare using sequence space arithmetic */
		if (SEQ_GT(zp_start.z_serial, serial_no) || serial_no == 0) {
			dprintf(1, (ddt, "need update, serial %d\n",
				    zp_start.z_serial));
			hp = (HEADER *) buf;
			soacnt = 0;
			nscnt = 0;
			for (;;) {
				if ((soacnt == 0) || (zp->z_type == Z_STUB)) {
					int type;
#ifdef	STUBS
					if (zp->z_type == Z_STUB) {
						if (!soacnt)
							type = T_SOA;
						else if (!nscnt)
							type = T_NS;
						else 
							type = T_SOA;
					} else
#endif
						type = T_AXFR;
					if ((n = res_mkquery(QUERY,
							     zp->z_origin,
							     Class,
							     type,
							     (char *)NULL,
							     0,
							     NULL,
							     (char *)buf,
							     bufsize
							     )) < 0) {
						if (!quiet) {
#ifdef STUBS
						    if (zp->z_type == Z_STUB)
							syslog(LOG_ERR,
							       (type == T_SOA)
					? "zone %s: res_mkquery T_SOA failed"
					: "zone %s: res_mkquery T_NS failed",
							       zp->z_origin);
						    else
#endif
							syslog(LOG_ERR,
					  "zone %s: res_mkquery T_AXFR failed",
							       zp->z_origin);
						}
						(void) my_close(s);
#ifdef POSIX_SIGNALS
						sigaction(SIGALRM, &osv,
							(struct sigaction *)0);
#else
						sigvec(SIGALRM, &osv,
						       (struct sigvec *)0);
#endif
						return XFER_FAIL;
					}
					/*
					 * Send length & msg for zone transfer
					 */
					if (writemsg(s, buf, n) < 0) {
						(void) my_close(s);
						error++;
						dprintf(2, (ddt,
							    "writemsg failed\n"
							    ));
						break;	
					}
				}
				/*
				 * Receive length & response
				 */
				cp = buf;
				l = sizeof(u_int16_t);
				/* allow extra time for fork on first read */
				if (soacnt == 0)
					ival.it_value.tv_sec = 300;
				while (l > 0) {
					(void) setitimer(ITIMER_REAL, &ival,
							 (struct itimerval *)
							     NULL
							 );
					errno = 0;
					n = recv(s, (char *)cp, l, 0);
					if (n > 0) {
						cp += n;
						l -= n;
					} else {
						if (errno == EINTR
						    && !read_interrupted)
							continue;
						error++;
						dprintf(2, (ddt,
					    "recv failed: n= %d, errno = %d\n",
							    n, errno));
						break;
					}
				}
				if (soacnt == 0)
					ival.it_value.tv_sec = XFER_TIMER;
				(void) setitimer(ITIMER_REAL, &zeroival,
						 (struct itimerval *)NULL);
				if (error)
					break;
				if ((len = htons(*(u_int16_t *)buf)) == 0)
					break;
				l = len;
				cp = buf;
				eom = buf + len;
				while (l > 0) {
					(void) setitimer(ITIMER_REAL, &ival,
							 (struct itimerval *)
							     NULL
							 );
					errno = 0;
					n = recv(s, (char *)cp, l, 0);
					if (n > 0) {
						cp += n;
						l -= n;
					} else {
						if (errno == EINTR
						    && !read_interrupted)
							continue;
						error++;
						dprintf(2, (ddt,
							    "recv failed\n"));
						break;
					}
				}
				(void) setitimer(ITIMER_REAL, &zeroival,
						 (struct itimerval *)NULL);
				if (error)
					break;
#ifdef DEBUG
				if (debug >= 3) {
					(void)fprintf(ddt,"len = %d\n", len);
					fp_query((char *)buf, ddt);
				}
				if (fp)
					fp_query((char *)buf, fp);
#endif
				if (len < sizeof(HEADER)) {
		badrec:
					error++;
					if (!quiet)
						syslog(LOG_ERR,
				       "record too short from [%s], zone %s\n",
						       inet_ntoa(sin.sin_addr),
						       zp->z_source);
					dprintf(1, (ddt,
						"record too short from [%s]\n",
						    inet_ntoa(sin.sin_addr)));
					break;
				}
				cp = buf + sizeof(HEADER);
				if (hp->qdcount) {
					if ((n = dn_skipname(cp, eom)) == -1
					    || n + QFIXEDSZ >= eom - cp)
						goto badrec;
					cp += n + QFIXEDSZ;
				}
				nmp = cp;
				if ((n = dn_skipname(cp, eom)) == -1)
					goto badrec;
				tmp = cp + n;
#ifdef STUBS
			if (zp->z_type == Z_STUB) {
				ancount = ntohs(hp->ancount);
				for (cnt = 0 ; cnt < ancount ; cnt++) {

					n = print_output(buf, bufsize, cp);
					cp += n;
				}
				if (hp->nscount) {
					/* we should not get here */
					ancount = ntohs(hp->nscount);
					for (cnt = 0 ; cnt < ancount ; cnt++) {
					    n = print_output(buf, bufsize, cp);
						cp += n;
					}
				}
				ancount = ntohs(hp->arcount);
				for (cnt = 0 ; cnt < ancount ; cnt ++) {
					n = print_output(buf, bufsize, cp);
					cp += n;
				}
				if (cp != eom) {
					dprintf(1, (ddt,
				     "getzone: print_update failed (%d, %d)\n",
						cp - buf, n));
					error++;
					break;
				}
		
			} else {
#endif /*STUBS*/
				n = print_output(buf, bufsize, cp);
				if (cp + n != eom) {
					dprintf(1, (ddt,
				     "getzone: print_update failed (%d, %d)\n",
					    cp - buf, n));
					error++;
					break;
				}
#ifdef STUBS
			}
#endif
			GETSHORT(n, tmp);
			if (n == T_SOA) {
				if (soacnt == 0) {
					soacnt++;
					if (dn_expand(buf, buf + 512, nmp,
					    name, sizeof(name)) == -1)
						goto badsoa;
					if (eom - tmp
					    <= 2 * sizeof(u_int16_t)
					       + sizeof(u_int32_t)) {
						goto badsoa;
					}
					tmp += 2 * sizeof(u_int16_t)
					       + sizeof(u_int32_t);
					if ((n = dn_skipname(tmp, eom)) == -1)
						goto badsoa;
					tmp += n;
					if ((n = dn_skipname(tmp, eom)) == -1)
						goto badsoa;
					tmp += n;
					if (eom - tmp <= sizeof(u_int32_t))
						goto badsoa;
					GETLONG(serial, tmp);
					dprintf(3, (ddt,
					       "first SOA for %s, serial %d\n",
						    name, serial));
					continue;
				}
				if (dn_expand(buf, buf + 512, nmp, name2, 
				    sizeof(name2)) == -1)
					goto badsoa;
				if (strcasecmp((char *)name,
					       (char *)name2) != 0) {
					dprintf(2, (ddt,
						    "extraneous SOA for %s\n",
						    name2));
					continue;
				}
				tmp -= sizeof(u_int16_t);
				if (soa_zinfo(&zp_finish, tmp, eom) == -1)
					goto badsoa;
				dprintf(2, (ddt,
					    "SOA, serial %d\n",
					    zp_finish.z_serial));
				if (serial != zp_finish.z_serial) {
					soacnt = 0;
					got_soa = 0;
					minimum_ttl = 0;
					strcpy(prev_origin, zp->z_origin);
					prev_dname[0] = DEF_DNAME;
					dprintf(1, (ddt,
						    "serial changed, restart\n"
						    ));
					/*
					 * Flush buffer, truncate file
					 * and seek to beginning to restart.
					 */
					fflush(dbfp);
					if (ftruncate(fileno(dbfp), 0) != 0) {
						if (!quiet)
						    syslog(LOG_ERR,
							"ftruncate %s: %m\n",
							tmpname);
						return(XFER_FAIL);
					}
					fseek(dbfp, 0L, 0);
				} else
					break;
#ifdef STUBS
			} else if (zp->z_type == Z_STUB && n == T_NS) {
				nscnt++;
			} else if (zp->z_type == Z_STUB) {
				break;
#endif
			}
		}
		(void) my_close(s);
		if (error == 0) {
#ifdef POSIX_SIGNALS
			(void) sigaction(SIGALRM, &osv,
					 (struct sigaction *)0);
#else
			(void) sigvec(SIGALRM, &osv, (struct sigvec *)0);
#endif
			return XFER_SUCCESS;
		}
		dprintf(2, (ddt, "error receiving zone transfer\n"));
	    } else if (zp_start.z_serial == serial_no) {
		(void) my_close(s);
		dprintf(1, (ddt,
			    "zone up-to-date, serial %u\n",
			    zp_start.z_serial));
		return XFER_UPTODATE;
	    } else {
		(void) my_close(s);
		if (!quiet)
		    syslog(LOG_ERR,
		      "serial from [%s], zone %s: %u lower than current: %u\n",
			   inet_ntoa(sin.sin_addr), zp->z_origin,
			   zp_start.z_serial, serial_no);
		dprintf(1, (ddt,
			    "serial %u lower than current\n",
			    zp_start.z_serial));
		return XFER_FAIL;
	    }
	}
#ifdef POSIX_SIGNALS
	(void) sigaction(SIGALRM, &osv, (struct sigaction *)0);
#else
	(void) sigvec(SIGALRM, &osv, (struct sigvec *)0);
#endif
	if (error)
		return XFER_TIMEOUT;
	return XFER_FAIL;
}

/*
 * Set flag saying to read was interrupted
 * used for a read timer
 */
static SIG_FN
read_alarm()
{
	read_interrupted = 1;
}
 
static int
soa_zinfo(zp, cp, eom)
	register struct zoneinfo *zp;
	register u_char *cp;
	u_char *eom;
{
	register int n;

	if (eom - cp < 3 * sizeof(u_int16_t) + sizeof(u_int32_t))
		return (-1);
	cp += 3 * sizeof(u_int16_t) + sizeof(u_int32_t);
	if ((n = dn_skipname(cp, eom)) == -1)
		return (-1);
	cp += n;
	if ((n = dn_skipname(cp, eom)) == -1)
		return (-1);
	cp += n;
	if (eom - cp < 5 * sizeof(u_int32_t))
		return (-1);
	GETLONG(zp->z_serial, cp);
	GETLONG(zp->z_refresh, cp);
	GETLONG(zp->z_retry, cp);
	GETLONG(zp->z_expire, cp);
	GETLONG(zp->z_minimum, cp);
	return (0);
}

/*
 * Parse the message, determine if it should be printed, and if so, print it
 * in .db file form.
 * Does minimal error checking on the message content.
 */
static int
print_output(msg, msglen, rrp)
	u_char *msg;
	int msglen;
	u_char *rrp;
{
	register u_char *cp;
	register HEADER *hp = (HEADER *) msg;
	u_int32_t addr, ttl;
	int i, j, tab, result, class, type, dlen, n1, n;
	u_char *cp1, data[BUFSIZ];
	u_char *temp_ptr;	/* used to get ttl for RR */
	char *cdata, *origin, *proto, dname[MAXDNAME];
	char *ignore = "";
#ifdef NO_GLUE
	int lend, lenn;
#endif /*NO_GLUE*/

	cp = rrp;
	if ((n = dn_expand(msg, msg + msglen, cp, (u_char *) dname,
		    sizeof(dname))) < 0) {
		hp->rcode = FORMERR;
		return (-1);
	}
	cp += n;
	GETSHORT(type, cp);
	GETSHORT(class, cp);
	GETLONG(ttl, cp);
	GETSHORT(dlen, cp);

	origin = strchr(dname, '.');
	if (origin == NULL)
		origin = "";
	else
		origin++;	/* move past the '.' */
	dprintf(3, (ddt,
		    "print_output: dname %s type %d class %d ttl %d\n",
		    dname, type, class, ttl));
	/*
	 * Convert the resource record data into the internal database format.
	 */
	switch (type) {
	case T_A:
	case T_WKS:
	case T_HINFO:
	case T_UINFO:
	case T_TXT:
	case T_UID:
	case T_GID:
		cp1 = cp;
		n = dlen;
		cp += n;
		break;

	case T_CNAME:
	case T_MB:
	case T_MG:
	case T_MR:
	case T_NS:
	case T_PTR:
		if ((n = dn_expand(msg, msg + msglen, cp, data,
			    sizeof(data))) < 0) {
			hp->rcode = FORMERR;
			return (-1);
		}
		cp += n;
		cp1 = data;
		n = strlen((char *) data) + 1;
		break;

	case T_MINFO:
	case T_SOA:
	case T_RP:
		if ((n = dn_expand(msg, msg + msglen, cp, data,
			    sizeof(data))) < 0) {
			hp->rcode = FORMERR;
			return (-1);
		}
		cp += n;
		cp1 = data + (n = strlen((char *) data) + 1);
		n1 = sizeof(data) - n;
		if (type == T_SOA)
			n1 -= 5 * sizeof(u_int32_t);
		if ((n = dn_expand(msg, msg + msglen, cp, cp1, n1)) < 0) {
			hp->rcode = FORMERR;
			return (-1);
		}
		cp += n;
		cp1 += strlen((char *) cp1) + 1;
		if (type == T_SOA) {
			temp_ptr = cp + 4 * sizeof(u_int32_t);
			GETLONG(minimum_ttl, temp_ptr);
			bcopy((char *) cp, (char *) cp1,
			    n = 5 * sizeof(u_int32_t));
			cp += n;
			cp1 += n;
		}
		n = cp1 - data;
		cp1 = data;
		break;

	case T_MX:
	case T_AFSDB:
		/* grab preference */
		bcopy((char *) cp, (char *) data, sizeof(u_int16_t));
		cp1 = data + sizeof(u_int16_t);
		cp += sizeof(u_int16_t);

		/* get name */
		if ((n = dn_expand(msg, msg + msglen, cp, cp1,
			    sizeof(data) - sizeof(u_int16_t))) < 0)
			return (-1);
		cp += n;

		/* compute end of data */
		cp1 += strlen((char *) cp1) + 1;
		/* compute size of data */
		n = cp1 - data;
		cp1 = data;
		break;

	default:
		dprintf(3, (ddt, "unknown type %d\n", type));
		return ((cp - rrp) + dlen);
	}
	if (n > MAXDATA) {
		dprintf(1, (ddt,
			    "update type %d: %d bytes is too much data\n",
			    type, n));
		hp->rcode = NOCHANGE;	/* XXX - FORMERR ??? */
		return (-1);
	}
	cdata = (char *) cp1;
	result = cp - rrp;

	/*
	 * Only print one SOA per db file
	 */
	if (type == T_SOA) {
		if (got_soa)
			return result;
		else
			got_soa++;
	}

#ifdef NO_GLUE
	/*
	 * If they are trying to tell us info about something that is
	 * not in the zone that we are transfering, then ignore it!
	 * They don't have the authority to tell us this info.
	 *
	 * We have to do a bit of checking here - the name that we are
	 * checking vs is fully qualified & may be in a subdomain of the
	 * zone in question.  We also need to ignore any final dots.
	 */
 	if (!samedomain(dname, domain)) {
		(void) fprintf(dbfp, "; Ignoring info about %s, not in zone %s.\n",
			dname, domain);
		ignore = "; ";
	}
#endif /*NO_GLUE*/

	/*
	 * If the origin has changed, print the new origin
	 */
	if (strcasecmp(prev_origin, origin)) {
		(void) strcpy(prev_origin, origin);
		(void) fprintf(dbfp, "%s$ORIGIN %s.\n", ignore, origin);
	}
	tab = 0;

	if (strcasecmp(prev_dname, dname)) {
		/*
		 * set the prev_dname to be the current dname, then cut off all
		 * characters of dname after (and including) the first '.'
		 */
		char *cutp = strchr(dname, '.');

		(void) strcpy(prev_dname, dname);
		if (cutp)
			*cutp = '\0';

		if (dname[0] == 0) {
			if (origin[0] == 0)
				(void) fprintf(dbfp, "%s.\t", ignore);
			else
				(void) fprintf(dbfp, "%s.%s.\t",
					ignore, origin);	/* ??? */
		} else
			(void) fprintf(dbfp, "%s%s\t", ignore, dname);
		if (strlen(dname) < 8)
			tab = 1;
	} else {
		(void) fprintf(dbfp, "%s\t", ignore);
		tab = 1;
	}

	if (ttl != 0 && ttl != minimum_ttl)
		(void) fprintf(dbfp, "%d\t", (int) ttl);
	else if (tab)
		(void) putc('\t', dbfp);

	(void) fprintf(dbfp, "%s\t%s\t", p_class(class), p_type(type));
	cp = (u_char *) cdata;

	/*
	 * Print type specific data
	 */
	switch (type) {

	case T_A:
		switch (class) {
		case C_IN:
		case C_HS:
			GETLONG(n, cp);
			n = htonl(n);
			(void) fprintf(dbfp, "%s",
				       inet_ntoa(*(struct in_addr *) & n));
			break;
		}
		(void) fprintf(dbfp, "\n");
		break;

	case T_CNAME:
	case T_MB:
	case T_MG:
	case T_MR:
	case T_PTR:
		if (cp[0] == '\0')
			(void) fprintf(dbfp, ".\n");
		else
			(void) fprintf(dbfp, "%s.\n", cp);
		break;

	case T_NS:
		cp = (u_char *) cdata;
		if (cp[0] == '\0')
			(void) fprintf(dbfp, ".\t");
		else
			(void) fprintf(dbfp, "%s.", cp);
		(void) fprintf(dbfp, "\n");
		break;

	case T_HINFO:
		if (n = *cp++) {
			(void) fprintf(dbfp, "\"%.*s\"", (int) n, cp);
			cp += n;
		} else
			(void) fprintf(dbfp, "\"\"");
		if (n = *cp++)
			(void) fprintf(dbfp, " \"%.*s\"", (int) n, cp);
		else
			(void) fprintf(dbfp, "\"\"");
		(void) putc('\n', dbfp);
		break;

	case T_SOA:
		(void) fprintf(dbfp, "%s.", cp);
		cp += strlen((char *) cp) + 1;
		(void) fprintf(dbfp, " %s. (\n", cp);
		cp += strlen((char *) cp) + 1;
		GETLONG(n, cp);
		(void) fprintf(dbfp, "%s\t\t%lu", ignore, n);
		GETLONG(n, cp);
		(void) fprintf(dbfp, " %lu", n);
		GETLONG(n, cp);
		(void) fprintf(dbfp, " %lu", n);
		GETLONG(n, cp);
		(void) fprintf(dbfp, " %lu", n);
		GETLONG(n, cp);
		(void) fprintf(dbfp, " %lu )\n", n);
		break;

	case T_MX:
	case T_AFSDB:
		GETSHORT(n, cp);
		(void) fprintf(dbfp, "%lu", n);
		(void) fprintf(dbfp, " %s.\n", cp);
		break;

	case T_TXT:
		cp1 = cp + n;
		(void) putc('"', dbfp);
		while (cp < cp1) {
			if (i = *cp++) {
				for (j = i ; j > 0 && cp < cp1 ; j--) {
					if ((*cp == '\n') || (*cp == '"')) {
						(void) putc('\\', dbfp);
					}
					(void) putc(*cp++, dbfp);
				}
			}
		}
		(void) fputs("\"\n", dbfp);
		break;

	case T_UINFO:
		(void) fprintf(dbfp, "\"%s\"\n", cp);
		break;

	case T_UID:
	case T_GID:
		if (n == sizeof(u_int32_t)) {
			GETLONG(n, cp);
			(void) fprintf(dbfp, "%lu\n", n);
		}
		break;

	case T_WKS:
		GETLONG(addr, cp);
		addr = htonl(addr);
		(void) fprintf(dbfp, "%s ",
			       inet_ntoa(*(struct in_addr *) & addr));
		proto = protocolname(*cp);
		cp += sizeof(char);
		(void) fprintf(dbfp, "%s ", proto);
		i = 0;
		while (cp < (u_char *) cdata + n) {
			j = *cp++;
			do {
				if (j & 0200)
					(void) fprintf(dbfp, " %s",
					    servicename(i, proto));
				j <<= 1;
			} while (++i & 07);
		}
		(void) fprintf(dbfp, "\n");
		break;

	case T_MINFO:
	case T_RP:
		(void) fprintf(dbfp, "%s.", cp);
		cp += strlen((char *) cp) + 1;
		(void) fprintf(dbfp, " %s.\n", cp);
		break;

	default:
		(void) fprintf(dbfp, "???\n");
	}
	if (ferror(dbfp)) {
		syslog(LOG_ERR, "%s: %m", tmpname);
		exit(XFER_FAIL);
	}
	return result;
}

/*
** SAMEDOMAIN -- Check whether a name belongs to a domain
** ------------------------------------------------------
**
**	Returns:
**		TRUE if the given name lies in the domain.
**		FALSE otherwise.
**
**	Trailing dots are first removed from name and domain.
**	Always compare complete subdomains, not only whether the
**	domain name is the trailing string of the given name.
**
**	"host.foobar.top" lies in "foobar.top" and in "top" and in ""
**	but NOT in "bar.top"
*/

#define sameword(a,b) (strcasecmp(a,b) == 0)

static int
samedomain(name, domain)
char *name;				/* the name under consideration */
char *domain;				/* the name of the domain */
{
	char namebuf[MAXDNAME];		/* copy of the name */
	char domainbuf[MAXDNAME];	/* copy of the domain */
	register int n;
	register char *dot;

	name = strcpy(namebuf, name);
	n = strlen(name);
	if (n > 0 && name[n-1] == '.')
		name[n-1] = '\0';

	domain = strcpy(domainbuf, domain);
	n = strlen(domain);
	if (n > 0 && domain[n-1] == '.')
		domain[n-1] = '\0';

	if (sameword(name, domain))
		return(1);

	if (sameword(domain, ""))
		return(1);

	dot = strchr(name, '.');
	while (dot != NULL)
	{
		if (sameword(dot+1, domain))
			return(1);
		dot = strchr(dot+1, '.');
	}

	return(0);
}

#ifdef SHORT_FNAMES
/*
** This routine handles creating temporary files with mkstemp
** in the presence of a 14 char filename system.  Pathconf()
** does not work over NFS.
*/
filenamecpy(ddtfile, optarg)
char *ddtfile, *optarg;
{
	int namelen, extra, len;
	char *dirname, *filename;

	/* determine the length of filename allowed */
	if((dirname = strrchr(optarg, '/')) == NULL){
		filename = optarg;
	} else {
		*dirname++ = '\0';
		filename = dirname;
	}
	namelen = pathconf(dirname == NULL? "." : optarg, _PC_NAME_MAX);
	if(namelen <= 0)
		namelen = 255;  /* length could not be determined */
	if(dirname != NULL)
		*--dirname = '/';

	/* copy a shorter name if it will be longer than allowed */
	extra = (strlen(filename)+strlen(".XXXXXX")) - namelen;
	if(extra > 0){
		len = strlen(optarg) - extra;
		(void) strncpy(ddtfile, optarg, len);
		ddtfile[len] = '\0';
	} else
		(void) strcpy(ddtfile, optarg);
}
#endif /* SHORT_FNAMES */
