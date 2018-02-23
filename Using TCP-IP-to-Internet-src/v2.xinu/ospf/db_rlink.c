/* db_rlink.c - db_rlink */

#include <conf.h>
#include <kernel.h>
#include <network.h>
#include <ospf.h>

Bool rlok(struct ospf_if *);

/*------------------------------------------------------------------------
 *  db_rlink - add self-originated router link ads to database
 *------------------------------------------------------------------------
 */
void
db_rlink(struct ospf_if *pif)
{
	int		ifn;
	struct ospf_ar	*par = pif->if_area;
	struct ospf_db	*pdb;
	struct ospf_lsa	lsa;
	struct ospf_ra	*pra;
	struct ospf_rl	*prl;

	lsa.lsa_age = 0;
	lsa.lsa_opts = pif->if_opts;
	lsa.lsa_type = LST_RLINK;
	lsa.lsa_lsid = pif->if_rid;
	lsa.lsa_rid = pif->if_rid;
	lsa.lsa_seq = LSA_ISEQ;
	lsa.lsa_len = LSA_RLEN;
	pra = (struct ospf_ra *) lsa.lsa_data;

	pra->ra_opts = 0;
	pra->ra_nlinks = 0;
	prl = (struct ospf_rl *)pra->ra_data;
	for (pif=par->ar_if; pif; pif=pif->if_next) {
		ifn = pif - &ospf_if[0];
		if (nif[ifn].ni_state != NIS_UP)
			continue;
		switch (pif->if_state) {
		case IFS_DOWN:
			continue;
		case IFS_PT2PT:
		case IFS_LOOPBACK:
			continue;	/* not supported yet */
		default:	/* all states with designated router	*/
			if (rlok(pif)) {
				prl->rl_lid = pif->if_dipa;
				prl->rl_data = nif[ifn].ni_ip;
				prl->rl_type = RAT_TRANSIT;
				prl->rl_ntos = 0;
				prl->rl_metric = pif->if_metric;
				break;
			} /* else, fall through */
		case IFS_WAITING:
			prl->rl_lid = nif[ifn].ni_subnet;
			prl->rl_data = nif[ifn].ni_mask;
			prl->rl_type = RAT_STUB;
			prl->rl_ntos = 0;
			prl->rl_metric = pif->if_metric;
			break;
		}
		pra->ra_nlinks++;
		prl = (struct ospf_rl *)((char *)prl + MINRLLEN);
	}
/* cksum here */
}

Bool
rlok(struct ospf_if *pif)
{
/* FIX ME - check for adjacencies according to p66, last bullet */
	return TRUE;
}
