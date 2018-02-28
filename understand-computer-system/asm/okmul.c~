#include <stdio.h>
#include <stdlib.h>

/* $begin oksmul1-c */
/* First attempt.  Does not work */ 
int ok_smul1(int x, int y, int *dest) 
{ 
    int result = 0; 

    *dest = x*y; 
    asm("setae %al"); 
    return result; 
} 
/* $end oksmul1-c */

/* $begin oksmul2-c */
/* Second attempt.  Works in limited contexts */
int dummy = 0; 

int ok_smul2(int x, int y, int *dest) 
{ 
    int result; 

    *dest = x*y; 
    result = dummy; 
    asm("setae %al"); 
    return result; 
} 
/* $end oksmul2-c */

/* $begin oksmul3-c */
/* Uses the extended assembly statement to get reliable code */
int ok_smul3(int x, int y, int *dest) 
{ 
    int result; 

    *dest = x*y; 

    /* Insert the following assembly code:
       setae %bl            # Set low-order byte
       movzbl %bl, result   # Zero extend to be result
    */
    asm("setae %%bl; movzbl %%bl,%0"  
	: "=r" (result)  /* Output    */  
	:                /* No inputs */  
	: "%ebx"         /* Overwrites */  
	);  

    return result; 
} 
/* $end oksmul3-c */

/* $begin okumul-c */
/* Uses the extended assembly statement */
int ok_umul(unsigned x, unsigned y, unsigned *dest) 
{ 
    int result; 

    /* Insert the following assembly code:
       movl  x,%eax         # Get x
       mull  y              # Unsigned multiply by y
       movl  %eax, *dest    # Store low-order 4 bytes at dest
       setae %dl            # Set low-order byte
       movzbl %dl, result   # Zero extend to be result
    */
    asm("movl %2,%%eax; mull %3; movl %%eax,%0; 
           setae %%dl; movzbl %%dl,%1"  
	: "=r" (*dest), "=r" (result) /* Outputs    */  
	: "r"  (x),     "r"  (y)      /* Inputs     */  
	: "%eax", "%edx"              /* Overwrites */ 
	); 

    return result; 
} 
/* $end okumul-c */


int main() {
    int sx, sy, sdest;
    unsigned int ux, uy, udest;

    printf("Enter sx:");
    scanf("%d", &sx);
    printf("Enter sy:");
    scanf("%d", &sy);

    /* test ok_smul1 */
    if (ok_smul1(sx, sy, &sdest))
	printf("ok_smul1: %d*%d=%d does not overflow\n", sx, sy, sdest);
    else
	printf("ok_smul1: %d*%d=%d overflows\n", sx, sy, sdest);

    /* test ok_smul2 */
    if (ok_smul2(sx, sy, &sdest))
	printf("ok_smul2: %d*%d=%d does not overflow\n", sx, sy, sdest);
    else
	printf("ok_smul2: %d*%d=%d overflows\n", sx, sy, sdest);

    /* test ok_smul3 */
    if (ok_smul3(sx, sy, &sdest))
	printf("ok_smul3: %d*%d=%d does not overflow\n", sx, sy, sdest);
    else
	printf("ok_smul3: %d*%d=%d overflows\n", sx, sy, sdest);

    printf("Enter ux:");
    scanf("%u", &ux);
    printf("Enter uy:");
    scanf("%u", &uy);

    if (ok_umul(ux, uy, &udest))
	printf("ok_umul: %u*%u=%u does not overflow\n", ux, uy, udest);
    else
	printf("ok_umul: %u*%u=%u overflows\n", ux, uy, udest);


    exit(0);
} 
