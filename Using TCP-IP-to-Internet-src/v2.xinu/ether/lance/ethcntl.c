/* ethcntl.c - ethcntl */

#include <conf.h>
#include <kernel.h>
#include <network.h>

/*------------------------------------------------------------------------
 * ethcntl - handle ethernet device control() functions
 *------------------------------------------------------------------------
 */
int ethcntl(devptr, func, arg)
struct	devsw	*devptr;
int		func;
char		*arg;		/* contains data for some functions	*/
{
	struct	etblk		*etptr;
        struct	le_init_block	*ib;
	unsigned  int		crc, hash_bit, get_hashbit(), bitindex;
	STATWORD		ps;
	int			reg, bit, i, rv;
	unsigned   char		addr[6];

        etptr = &eth[devptr->dvminor];
        ib    = etptr->etib;
	
	switch ( func )	{
	case EPC_PROMON:		/* turn on promiscuous mode	*/
	        ib->ib_prom = 1;
	        rv = ethstrt(etptr);
		break;
	case EPC_PROMOFF:		/* turn off promiscuous mode	*/
	        ib->ib_prom = 0;
	        rv = ethstrt(etptr);
		break;
	case EPC_MDEL: /* not supported yet */
		rv = OK;
		break;
	case EPC_MADD:
		/* check the limit on no. of addresses */
		disable(ps);
/*	    kprintf("setting etptr->etfilter for %x %x %x %x %x %x\n", 
		arg[0]&0xff, arg[1]&0xff, arg[2]&0xff, arg[3]&0xff,
		arg[4]&0xff, arg[5]&0xff);
*/	
		/* initialize etptr->etfilter */
/*		for (i=0; i < 8; i++)
		    etptr->etfilter[i] = 0;
*/		    
		
		/* reverse address */
		for (i=0; i < EP_ALEN; i++)
		    addr[i] = (unsigned char)arg[5-i]&0xff;
/*    kprintf("recversed address %x %x %x %x %x %x \n", 
	   addr[0], addr[1], addr[2], addr[3], addr[4], addr[5]);
*/		
		crc = get_hashbit(addr, EP_ALEN); 
#ifdef TESTMULTI
		kprintf("ethcntl: crc 0x%x\n", crc);
#endif		
		hash_bit = crc >> 26;
#ifdef TESTMULTI
		kprintf("ethcntl: hashbit 0x%x\n", hash_bit);
#endif
		reg = hash_bit / 16;
		bit = hash_bit % 16;
#ifdef TESTMULTI
		kprintf("ethcntl: reg %d bit %d\n", reg, bit);
#endif		
		set_bit(&etptr->etfilter[reg*2], bit, 1,2);
#ifdef TESTMULTI
    kprintf("etptr->etfilter is %x %x %x %x %x %x %x %x.\n", 
	etptr->etfilter[0], etptr->etfilter[1], etptr->etfilter[2],
	etptr->etfilter[3], etptr->etfilter[4], etptr->etfilter[5],
	etptr->etfilter[6], etptr->etfilter[7]);

#endif	
		/* now set the etptr->etfilter on the board */
		ib->ib_ladrf[0] = etptr->etfilter[0];
		ib->ib_ladrf[1] = etptr->etfilter[1];
		ib->ib_ladrf[2] = etptr->etfilter[2];
		ib->ib_ladrf[3] = etptr->etfilter[3];
		ib->ib_ladrf[4] = etptr->etfilter[4];
		ib->ib_ladrf[5] = etptr->etfilter[5];
		ib->ib_ladrf[6] = etptr->etfilter[6];
		ib->ib_ladrf[7] = etptr->etfilter[7];
		ethstrt(etptr);
		restore(ps);
		rv = OK;
		break;
	default:
		rv = SYSERR;
	}
	return rv;
}


/*------------------------------------------------------------------------
 * get_hashbit - get hashe value, given an Ethernet address
 *------------------------------------------------------------------------
 */
/* 
calculate a 32-bit CRC redundant checksum
**
** This is hash value specifically  the one calculated by
** the Lance Ethernet chip. In this version, the CRC register
** is initialized to all 1's instead of all 0's. This is the
** reverse of how checksums are done in Stallings & Tanenbaum
** (which are presumably standard ways).
**
*/
#define CRC_BITS 32
#define CHAR_BITS 8
unsigned char poly[4] = {0x04, 0xc1, 0x1d, 0xb6};

unsigned int
get_hashbit(msg, len)
unsigned char *msg;
int len;
{
  unsigned char CRC[4];
  int i, j, carry;

  for (i = 0; i < 4; i++) CRC[i] = 0xff;

  /* for each message bit */
  for (i = 0; i < CHAR_BITS*len; i++) {
    carry = get_bit(msg, i, len) ^ get_bit(CRC, 0, 4);
    /* for each CRC bit */
    for (j = 0; j < CRC_BITS - 1; j++) {
      if (get_bit(poly, CRC_BITS - j - 1, 4))
	set_bit(CRC, j, carry ^ get_bit(CRC, j+1, 4), 4);
      else
	set_bit(CRC, j, get_bit(CRC, j+1, 4), 4);
    }
    set_bit(CRC, CRC_BITS - 1, carry, 4);
  }
  return(*((long *) CRC));
}

/*
** get_bit, set_bit -- bit manipulating operations
**
** bits are numbered starting from 0 at the right end
**
** all values set or returned are treated as 0 or 1
*/

int
get_bit(data, i, len)
unsigned char *data;
int i;
int len;
{
  int byte, bit;

  byte = len - (i / CHAR_BITS) - 1;
  bit = i % CHAR_BITS;

  return(!!(data[byte] & (1 << bit)));
}

set_bit(data, i, value, len)
unsigned char *data;
int i;
int value;
int len;
{
  int byte, bit;

  byte = len - (i / CHAR_BITS) - 1;
  bit = i % CHAR_BITS;

  if (value) 
    data[byte] |= (1<<bit);
  else
    data[byte] &= ~(1<<bit);
}
