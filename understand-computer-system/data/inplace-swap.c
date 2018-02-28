/* $begin inplace-swap */
void inplace_swap(int *x, int *y) 
{ 
    *x = *x ^ *y;  /* Step 1 */ 
    *y = *x ^ *y;  /* Step 2 */ 
    *x = *x ^ *y;  /* Step 3 */ 
} 
/* $end inplace-swap */

