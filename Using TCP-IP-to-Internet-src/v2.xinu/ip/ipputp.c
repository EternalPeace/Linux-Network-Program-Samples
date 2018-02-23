/* ipputp.c - ipputp */

#include <conf.h>
#include <kernel.h>
#include <network.h>

/*------------------------------------------------------------------------
 * ipputp  -  send a packet to an interface's output queue
 *------------------------------------------------------------------------
 */
int
ipputp(unsigned ifn, IPaddr nh, struct ep *pep)
{
	struct	netif	*pni = &nif[ifn];
	struct	ip	*pip;
	int		hlen, maxdlen, tosend, offset, offindg;

	if (pni->ni_state == NIS_DOWN) {
		freebuf(pep);
		return SYSERR;
	}
	pip = (struct ip *)pep->ep_data;
	if (pip->ip_len <= pni->ni_mtu) {
		pep->ep_nexthop = nh;
		pip->ip_cksum = 0;
		iph2net(pip);
		pep->ep_order &= ~EPO_IP;
		pip->ip_cksum = cksum((WORD *)pip, IP_HLEN(pip));
		return netwrite(pni, pep, EP_HLEN+net2hs(pip->ip_len));
	}
	/* else, we need to fragment it */

	if (pip->ip_fragoff & IP_DF) {
		IpFragFails++;
		icmp(ICT_DESTUR, ICC_FNADF, pip->ip_src, pep, 0);
		return OK;
	}
	maxdlen = (pni->ni_mtu - IP_HLEN(pip)) &~ 7;
	offset = 0;
	offindg = (pip->ip_fragoff & IP_FRAGOFF)<<3;
	tosend = pip->ip_len - IP_HLEN(pip);

	while (tosend > maxdlen) {
		if (ipfsend(pni,nh,pep,offset,maxdlen,offindg) != OK) {
			IpOutDiscards++;
			freebuf(pep);
			return SYSERR;
		}
		IpFragCreates++;
		tosend -= maxdlen;
		offset += maxdlen;
		offindg += maxdlen;
	}
	IpFragOKs++;
	IpFragCreates++;
	hlen = ipfhcopy(pep, pep, offindg);
	pip = (struct ip *)pep->ep_data;
	/* slide the residual down */
	memcpy(&pep->ep_data[hlen], &pep->ep_data[IP_HLEN(pip)+offset],
		tosend);
	/* keep MF, if this was a frag to start with */
	pip->ip_fragoff = (pip->ip_fragoff & IP_MF)|(offindg>>3);
	pip->ip_len = tosend + hlen;
	pip->ip_cksum = 0;
	iph2net(pip);
	pep->ep_order &= ~EPO_IP;
	pip->ip_cksum = cksum((WORD *)pip, hlen);
	pep->ep_nexthop = nh;
	return netwrite(pni, pep, EP_HLEN+net2hs(pip->ip_len));
}
