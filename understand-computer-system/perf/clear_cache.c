#include "clock.h"

/* $begin clear_cache */
/* Number of bytes in the largest cache to be cleared */ 
#define CBYTES (1<<19)   
#define CINTS (CBYTES/sizeof(int)) 

/* A large array to bring into cache */ 
static int dummy[CINTS]; 
volatile int sink; 
 
/* Evict the existing blocks from the data caches */
void clear_cache() 
{
    int i; 
    int sum = 0; 

    for (i = 0; i < CINTS; i++) 
	dummy[i] = 3; 
    for (i = 0; i < CINTS; i++) 
	sum += dummy[i]; 
    sink = sum; 
}
/* $end clear_cache */
