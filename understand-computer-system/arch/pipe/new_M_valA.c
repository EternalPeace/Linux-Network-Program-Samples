#include <stdio.h>
#include "isa.h"
#include "pipeline.h"
#include "stages.h"
#include "sim.h"

/* The following is a default function for pipelines without load bypassing. 
   By putting this in a separate file, it will get linked and used only if
   there is no definition for a signal new_M_valA in the HCL.
*/

int gen_new_M_valA()
{
    return id_ex_curr->vala;
}

