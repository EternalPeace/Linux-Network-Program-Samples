/* Default connections for writeback */

#include <stdio.h>
#include "isa.h"
#include "pipeline.h"
#include "stages.h"
#include "sim.h"

/* The following is a default function for logic connecting the 
   MW pipe register to the write ports of the register file.
   This version gets used when there is no definition for
   signals w_dstE, w_valE, w_dstM, and w_valM in the HCL.
*/

int gen_w_dstE()
{
    return mem_wb_curr->deste;
}

int gen_w_valE()
{
    return mem_wb_curr->vale;
}

int gen_w_dstM()
{
    return mem_wb_curr->destm;
}

int gen_w_valM()
{
    return mem_wb_curr->valm;
}
