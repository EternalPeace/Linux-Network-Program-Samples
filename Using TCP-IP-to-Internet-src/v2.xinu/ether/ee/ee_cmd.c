/* ee_cmd.c - ee_cmd, ee_wait, ee_ack */

#include <conf.h>
#include <kernel.h>
#include <network.h>
#include <i386.h>
#include <ee.h>

/*------------------------------------------------------------------------
 * ee_cmd - issue an Intel 82586 command
 *------------------------------------------------------------------------
 */
int
ee_cmd(ped, cmd, arg1, arg2, arg3)
struct etdev	*ped;
unsigned short	cmd;
char		*arg1, *arg2, *arg3;
{
	struct devsw	*pdev = ped->ed_pdev;
	struct scb	*pscb = ped->ed_scb;
	struct cbl	*pcbl = ped->ed_cbl;

	ee_wait(ped);

	/* build command block */

	pcbl->cbl_status = 0;
	pcbl->cbl_cmd = cmd | EECMD_EL;

	switch (cmd & EECMD_MASK) {
	case EECMD_CONFIG:
		memcpy(pcbl->cbl_cfg, arg1, CFLEN);
		break;
	case EECMD_IASET:
		memcpy(pcbl->cbl_addr, arg1, EP_ALEN);
		break;
	case EECMD_TX:
		pcbl->cbl_tbd = H2IO(ped, ped->ed_tbd);
		break;
	case EECMD_NOP:
		break;	/* not implemented yet */
	case EECMD_MCSET:
		pcbl->cbl_alen = EP_ALEN * (int)arg2;
		memcpy(pcbl->cbl_mca, arg1, pcbl->cbl_alen);
		break;
	}
	pscb->scb_cmd = SCBCMD_CUS;
	pscb->scb_status = 0;
	pscb->scb_cbloff = H2IO(ped, pcbl);

	outb(pdev->dvcsr + CAC, 0);	/* start the 82586	*/
}

/*------------------------------------------------------------------------
 * ee_wait - wait for 82586 to become ready
 *------------------------------------------------------------------------
 */
ee_wait(ped)
struct etdev	*ped;
{
	struct devsw	*pdev = ped->ed_pdev;
	struct scb	*pscb = ped->ed_scb;
	int		i;
	
	for (i=0; i<5000; ++i)
		if (!pscb->scb_cmd)
			return;
	kprintf("ee%d: ee_wait timed out, SCB status %x cmd %x\n",
		pdev->dvminor, pscb->scb_status, pscb->scb_cmd);
}

/*------------------------------------------------------------------------
 * ee_ack - acknowledge status return by Intel 82586
 *------------------------------------------------------------------------
 */
ee_ack(ped, status)
struct etdev	*ped;
unsigned short	status;
{
	struct devsw	*pdev = ped->ed_pdev;
	struct scb	*pscb = ped->ed_scb;

	ee_wait(ped);
	pscb->scb_cmd = status & 0xf000;
	outb(pdev->dvcsr+CAC, 0);
}
