/* ddi_exchng.c - ddi_exchng */

#include <conf.h>
#include <kernel.h>
#include <network.h>
#include <ospf.h>

/*------------------------------------------------------------------------
 * ddi_exchng - handle Data Descrip. input for EXCHANGE state neighbors
 *------------------------------------------------------------------------
 */
int
ddi_exchng(struct ospf_if *pif, struct ospf_nb *pnb, struct ep *pep)
{
	struct ip	*pip = (struct ip *)pep->ep_data;
	struct ospf	*po = (struct ospf *)((char *)pip + IP_HLEN(pip));
	struct ospf_dd	*pdd = (struct ospf_dd *)po->ospf_data;
	struct ep	*peptmp;

	if (((pdd->dd_control & DDC_MSTR) & pnb->nb_master) ||
	    (!(pdd->dd_control & DDC_MSTR) & !pnb->nb_master) ||
	    (pdd->dd_control & DDC_INIT) ||
	    (pdd->dd_opts != pnb->nb_opts))
		return nb_mismatch(pif, pnb);
	if ((pnb->nb_master && pdd->dd_seq == pnb->nb_seq-1) ||
	    (!pnb->nb_master && pdd->dd_seq == pnb->nb_seq))
		return 0; /* duplicate */
	if ((!pnb->nb_master && pdd->dd_seq != pnb->nb_seq + 1) ||
	    (pnb->nb_master && pdd->dd_seq != pnb->nb_seq))
		return nb_mismatch(pif, pnb);
	if (!pnb->nb_master && lenq(pnb->nb_dsl) == 1) {
		/* slave must save the last packet DEADINTV secs */
		if (pnb->nb_tlastdd == 0)
			pnb->nb_tlastdd = DEADINTV;
	} else if (peptmp = (struct ep *)deq(pnb->nb_dsl))
		freebuf(peptmp);	/* has been acked */
	if (pnb->nb_master)
		pnb->nb_seq++;
	else
		pnb->nb_seq = pdd->dd_seq;
	lsr_queue(pif, pnb, pep);
	if ((pdd->dd_control & DDC_MORE) == 0 &&
	    lenq(pnb->nb_dsl) <= 1) {
		if (headq(pnb->nb_lsrl))
			pnb->nb_state = NBS_LOADING;
		else
			pnb->nb_state = NBS_FULL;
		if (!pnb->nb_master)
			dd_xmit(pif, pnb);
		return 1;
	}
	dd_xmit(pif, pnb);
	return OK;
}
