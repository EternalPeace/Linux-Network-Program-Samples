/* icmpdump.c - icmpdump */

#include <conf.h>
#include <kernel.h>
#include <network.h>

/*------------------------------------------------------------------------
 * icmpdump - pretty-print an ICMP packet
 *------------------------------------------------------------------------
 */
int icmpdump(pic, dlen, order)
struct icmp	*pic;
int		dlen;
int		order;
{
	short	cksum, id, seq;
	int	hlen = sizeof(struct icmp);
	int	i;

	if (order & EPO_ICMP) {
		cksum = pic->ic_cksum;
		id = pic->ic_id;
		seq = pic->ic_seq;
	} else {
		cksum = net2hs(pic->ic_cksum);
		id = net2hs(pic->ic_id);
		seq = net2hs(pic->ic_seq);
	}
	kprintf("ICMP:\ttype %d code %d cksum %x\n", pic->ic_type,
		pic->ic_code, cksum & 0xffff);
	switch (pic->ic_type) {
	case ICT_ECHORP:
	case ICT_ECHORQ:
		kprintf("ICMP:\tid %d seq %d\n", id, seq);
		break;
	case ICT_REDIRECT:
		kprintf("ICMP:\tgw ");
		kprintf("%X\n", pic->ic_gw);
		break;
	case ICT_MASKRQ:
	case ICT_MASKRP:
		kprintf("ICMP:\tmask ");
		kprintf("%X\n", pic->ic_gw);
		break;
	}
	hexdump(pic->ic_data, dlen - hlen);
}
