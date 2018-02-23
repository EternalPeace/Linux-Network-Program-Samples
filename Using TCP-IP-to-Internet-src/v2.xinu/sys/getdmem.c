/* getdmem.c - getdmem initdmamem */

#include <conf.h>
#include <kernel.h>
#include <mark.h>
#include <mem.h>
#include <network.h>

long nextdma;
long dmaend;

MARKER dmamark;

/*------------------------------------------------------------------------
 * getdmem  --  allocate heap that can be used for DVMA transfers on the
 *              Sun 3 for device storage, returning lowest WORD address
 *------------------------------------------------------------------------
 */
SYSCALL getdmem(nbytes)
    long nbytes;
{
    long ret;
    
#ifdef DEBUG
    kprintf("getdmem(%ld,phys,virt) called\n",nbytes);
#endif    
    
    if (unmarked(dmamark)) {
	mark(dmamark);
	initdmamem(DMA_NBYTES);
    }

    if ((nextdma + nbytes) <= dmaend) {
	ret = nextdma;
	nextdma += nbytes;
	return(ret);
    }
    else {
	panic("No more memory for DMA buffers");
	return(SYSERR);
    }
}


initdmamem(nbytes)
     long nbytes;
{
    int npages;
    long virt;
    long pmem;

#ifdef DEBUG
    kprintf("initdmamem(%ld) called\n",nbytes);
#endif    

    npages = nbytes / PAGESIZE;

    /* allocate enough heap, plus extra to page allign */
    pmem = (long)getmem(nbytes + PAGESIZE);
#ifdef DEBUG
    kprintf("Getmem returns 0x%lx\n",(unsigned long) pmem);
#endif    
    pmem = ((long) pmem + (PAGESIZE-1)) & ~PAGEMASK;
#ifdef DEBUG
    kprintf("pmem rounded up to 0x%lx\n",(unsigned long) pmem);
#endif    

    virt = pmem | DMA_VM_START;
#ifdef DEBUG
    kprintf("starting at virtual address 0x%lx\n",virt);
#endif    

#ifdef DEBUG
    kprintf("Allocating %ld pages for DMA use\n",npages);
#endif    
    setsmreg(virt, npages*12);
    map(virt, npages*PAGESIZE, pmem, PM_MEM);

    dmaend  = virt + (npages*PAGESIZE) - 1;
    nextdma = virt;
    return(OK);
}


