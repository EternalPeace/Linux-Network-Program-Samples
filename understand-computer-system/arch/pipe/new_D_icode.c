#include <stdio.h>
#include "isa.h"
#include "pipeline.h"
#include "stages.h"
#include "sim.h"

/* The following is a default function for pipelines with
   single cycle popl implementations.
   By putting this in a separate file, it will get linked and used only if
   there is no definition for a signal new_D_icode in the HCL.
*/

int gen_new_D_icode()
{
    return if_id_next->icode;
}
