
unsigned t2u()
{
    /* $begin t2u */
    int x = -1; 
    unsigned ux = (unsigned) x; 
    /* $end t2u */
    return ux;
}


void explicit_cast()
{
    /* $begin explicit-cast */
    int tx, ty; 
    unsigned ux, uy; 

    tx = (int) ux; 
    uy = (unsigned) ty; 
    /* $end explicit-cast */
}
 
void implicit_cast()
{
    /* $begin implicit-cast */
    int tx, ty; 
    unsigned ux, uy; 

    tx = ux; /* Cast to signed */ 
    uy = ty; /* Cast to unsigned */ 
    /* $end implicit-cast */ 
}

int trunc()
{
    /* $begin trunc */
    int   x = 53191; 
    short sx = (short) x;  /* -12345 */ 
    int   y = sx;          /* -12345 */ 
    /* $end trunc */
    return y;
}
