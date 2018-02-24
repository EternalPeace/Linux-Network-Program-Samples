/*
 *	from ns.h	4.33 (Berkeley) 8/23/90
 *	$Id: ns_glob.h,v 1.3 1993/12/06 00:43:02 vixie Exp $
 */

/*
 * ++Copyright++ 1986
 * -
 * Copyright (c) 1986
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

/*
 * Global variables for the name server.
 */

#ifdef DEBUG
DECL	int			debug		INIT(0);
DECL	FILE			*ddt		INIT(NULL);
#endif

	/* list of open streams */
DECL	struct qstream		*streamq	INIT(QSTREAM_NULL);

	/* list of datagram interfaces */
DECL	struct qdatagram	*datagramq	INIT(QDATAGRAM_NULL);

	/* often set to the current time */
DECL	struct timeval		tt;

	/* head of allocated queries */
DECL	struct qinfo		*qhead		INIT(QINFO_NULL);

	/* list of forwarding hosts */
DECL	struct fwdinfo		*fwdtab		INIT(NULL);

	/* next forwarded query id */
DECL	int			nsid		INIT(0);

	/* datagram socket */
DECL	int			ds		INIT(-1);

	/* listening TCP socket */
DECL	int			vs		INIT(-1);

	/* received SIGHUP, need to reload db */
DECL	int			needreload	INIT(0);

	/* need to call ns_maint()*/
DECL	int			needmaint	INIT(0);

	/* how often does ns_maint() need to be called? (every 15 minutes) */
DECL	int			maint_interval	INIT(15*60);

	/* need to reload secondary zone(s) */
DECL	int			needzoneload	INIT(0);

	/* need to dump database */
DECL	int			needToDoadump	INIT(0);

	/* need to checkpoint cache */
DECL	int			needToChkpt	INIT(0);

	/* need to dump statistics */
DECL	int			needStatsDump	INIT(0);

#ifdef ALLOW_UPDATES
	/* need to exit (may need to doadump
	 * first, if database has changed since
	 * it was last dumped/booted). Gets
	 * set by shutdown signal handler
	 *  (onintr)
	 */
DECL	int			needToExit	INIT(0);
#endif /* ALLOW_UPDATES */

#ifdef QRYLOG
	/* is query logging turned on? */
DECL	int			qrylog		INIT(0);
#endif /*QRYLOG*/

	/* is this a root server that should therefore not recurse? */
DECL	int			NoRecurse	INIT(0);

/*
 * We keep a list of favored networks headed by nettab.
 * There are three (possibly empty) parts to this list, in this order:
 *	1. directly attached (sub)nets.
 *	2. logical networks for directly attached subnetted networks.
 *	3. networks from the sort list.
 * The value (*elocal) points at the first entry in the second part of the
 * list, if any, while (*enettab) points at the first entry in the sort list.
 */
DECL	struct netinfo		*nettab		INIT(NULL);
DECL	struct netinfo		**elocal	INIT(&nettab);
DECL	struct netinfo		**enettab	INIT(&nettab);

#ifdef XFRNETS
	/* list of nets we're willing to zone transfer to */
DECL	struct netinfo		*xfrnets	INIT(NULL);
#endif

#ifdef BOGUSNS
	/* list of bogus nameservers */
DECL	struct netinfo		*boglist	INIT(NULL);
#endif

	/* loopback net */
DECL	struct netinfo		netloop;

	/* port to which we send queries */
DECL	u_int16_t		ns_port;

	/* Source addr of last packet */
DECL	struct sockaddr_in	from_addr;

	/* Source addr size of last packet */
DECL	int			from_len;

	/* Used by ns_stats */
DECL	time_t			boottime,
				resettime;

	/* next query to retry */
DECL	struct qinfo		*retryqp	INIT(NULL);

	/* default boot file */
#ifdef BOOTFILE
DECL	char			*bootfile	INIT(BOOTFILE);
#else
DECL	char			*bootfile	INIT(_PATH_BOOT);
#endif

	/* default debug output file */
#ifdef DEBUGFILE
DECL	char			*debugfile	INIT(DEBUGFILE);
#else
DECL	char			*debugfile	INIT(_PATH_DEBUG);
#endif

#ifdef WANT_PIDFILE
	/* file to store current named PID */
#ifdef PIDFILE
DECL	char			*PidFile	INIT(PIDFILE);
#else
DECL	char			*PidFile	INIT(_PATH_PIDFILE);
#endif
#endif /*WANT_PIDFILE*/

	/* zone information */
DECL	struct zoneinfo		*zones		INIT(NULL);

	/* number of zones in use */
DECL	int			nzones		INIT(0);

	/* true on slave server */
DECL	int			forward_only	INIT(0);

	/* set if we need a priming */
DECL	int			needs_prime_cache INIT(0);

	/* is cache being primed */
DECL	int			priming		INIT(0);

	/* ptrs to dnames in msg for dn_comp */
DECL	u_char			*dnptrs[40];

	/* number of names in addinfo */
DECL	int			addcount;

	/* name of cache file */
DECL	char			*cache_file;

#ifdef LOCALDOM
	/* our local domain (deprecated in favor of resolv.conf) */
DECL	char			*localdomain;
#endif

#ifdef SLAVE_FORWARD
	/* retry time when a slave */
DECL	int			slave_retry		INIT(4);
#endif

#ifdef STATSFILE
DECL	char			*statsfile	INIT(STATSFILE);
#else
DECL	char			*statsfile	INIT(_PATH_STATS);
#endif

	/* these are too big to init here; see ns_stats.c */
extern	struct stats		stats[];
extern	unsigned long		typestats[];

	/* defined in version.c, can't use DECL/INIT */
extern char		Version[];
