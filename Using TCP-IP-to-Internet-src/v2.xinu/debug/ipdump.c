/* ipdump.c - ipdump */

#include <conf.h>
#include <kernel.h>
#include <network.h>

/*------------------------------------------------------------------------
 * ipdump - pretty-print an IP packet to the console
 *------------------------------------------------------------------------
 */
int ipdump(pip, order)
struct ip	*pip;
int		order;
{
	short	ip_len, ip_id, ip_fragoff, ip_cksum;
	int	i, hlen, dlen;

	if (order & EPO_IP) {
		ip_len = pip->ip_len;
		ip_id = pip->ip_id;
		ip_fragoff = pip->ip_fragoff;
		ip_cksum = pip->ip_cksum;
	} else {
		ip_len = net2hs(pip->ip_len);
		ip_id = net2hs(pip->ip_id);
		ip_fragoff = net2hs(pip->ip_fragoff);
		ip_cksum = net2hs(pip->ip_cksum);
	}
	kprintf("IP:\tver %d len %d tos %x\n", pip->ip_verlen>>4,
		pip->ip_verlen & 0xf, pip->ip_tos);
	kprintf("IP:\tlen %d ident %u fragoff %x\n", ip_len, ip_id,
		ip_fragoff);
	kprintf("IP:\tproto %d", pip->ip_proto);
	kprintf(" ttl %d cksum %x\n", pip->ip_ttl, ip_cksum & 0xffff);
	kprintf("IP:\tsrc %X dst %X\n", net2hl(pip->ip_src),
		net2hl(pip->ip_dst));
	if (ip_fragoff & IP_FRAGOFF)
		return OK;
	hlen = IP_HLEN(pip);
	dlen = ip_len - hlen;

	switch (pip->ip_proto) {
	case IPT_UDP:
		return udpdump((char *)pip+hlen, dlen, order);
	case IPT_TCP:
		return tcpdump((char *)pip+hlen, dlen, order);
	case IPT_ICMP:
		return icmpdump((char *)pip+hlen, dlen, order);
/*
	case IPT_IGMP:
		return igmpdump((char *)pip+hlen, dlen, order);
*/
	case IPT_OSPF:
		return ospfdump((char *)pip+hlen, dlen, order);
	default:
		break;
	}
	return OK;
}
