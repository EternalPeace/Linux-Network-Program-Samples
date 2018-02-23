/* rtadd.c - rtadd */

#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <network.h>

struct	route *rtnew(IPaddr, IPaddr, IPaddr, unsigned,unsigned,unsigned);
void rtinit(void);
int rthash(IPaddr);

/*------------------------------------------------------------------------
 *  rtadd  -  add a route to the routing table
 *------------------------------------------------------------------------
 */
int
rtadd(IPaddr net, IPaddr mask, IPaddr gw, unsigned metric,
	unsigned intf, unsigned ttl)
{
	struct	route	*prt, *srt, *prev;
	Bool		isdup;
	int		hv, i;

	if (!Route.ri_valid)
		rtinit();

	prt = rtnew(net, mask, gw, metric, intf, ttl);
	if (prt == (struct route *)SYSERR)
		return SYSERR;

	/* compute the queue sort key for this route */
	prt->rt_key = 0;
	for (i=0; i<32; ++i)
		prt->rt_key += (mask >> i) & 1;
	wait(Route.ri_mutex);

	/* special case for default routes */
	if (net == RT_DEFAULT) {
		if (Route.ri_default)
			RTFREE(Route.ri_default);
		Route.ri_default = prt;
		signal(Route.ri_mutex);
		return OK;
	}
	prev = NULL;
	hv = rthash(net);
	isdup = FALSE;
	for (srt=rttable[hv]; srt; srt = srt->rt_next) {
		if (prt->rt_key > srt->rt_key)
			break;
		if (srt->rt_net == prt->rt_net &&
	    	    srt->rt_mask == prt->rt_mask) {
			isdup = TRUE;
			break;
		}
		prev = srt;
	}
	if (isdup) {
		struct	route	*tmprt;

		if (srt->rt_gw == prt->rt_gw) {
			/* just update the existing route */
#ifdef	RIP
			if (dorip) {
				srt->rt_ttl = ttl;
				if (srt->rt_metric != metric) {
					if (metric == RTM_INF)
						srt->rt_ttl = RIPZTIME;
					send(rippid, 0);
				}
			}
#endif	/* RIP */
			srt->rt_metric = metric;
			RTFREE(prt);
			signal(Route.ri_mutex);
			return OK;
		}
		/* else, someone else has a route there... */
		if (srt->rt_metric <= prt->rt_metric) {
			/* no better off to change; drop the new one */

			RTFREE(prt);
			signal(Route.ri_mutex);
			return OK;
		}
#ifdef	RIP
		else if (dorip)
			send(rippid, 0);
#endif	/* RIP */
		tmprt = srt;
		srt = srt->rt_next;
		RTFREE(tmprt);
	}
#ifdef	RIP
	else if (dorip)
		send(rippid, 0);
#endif	/* RIP */
	prt->rt_next = srt;
	if (prev)
		prev->rt_next = prt;
	else
		rttable[hv] = prt;
	signal(Route.ri_mutex);
	return OK;
}
