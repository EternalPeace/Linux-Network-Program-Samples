#include <stdio.h>
#include <stdlib.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, int len)
{
    int i;
    for (i = 0; i < len; i++)
	printf(" %.2x", start[i]);
    printf("\n");
}

void test(int val)
{
    /* $begin extend */
    short sx = val;          /* -12345 */
    unsigned short usx = sx; /* 53191 */
    int   x = sx;            /* -12345 */
    unsigned  ux = usx;      /* 53191 */

    /* $end extend */
    /* $begin extenduy */
    unsigned  uy = x;        /* Mystery! */

    /* $end extenduy */
    /* $begin extend */
    printf("sx  = %d:\t", sx);
    show_bytes((byte_pointer) &sx, sizeof(short));
    printf("usx = %u:\t", usx);
    show_bytes((byte_pointer) &usx, sizeof(unsigned short));
    printf("x   = %d:\t", x);
    show_bytes((byte_pointer) &x, sizeof(int));
    printf("ux  = %u:\t", ux);
    show_bytes((byte_pointer) &ux, sizeof(unsigned));
    /* $end extend */
    /* $begin extenduy */
    printf("uy  = %u:\t", uy);
    show_bytes((byte_pointer) &uy, sizeof(unsigned));
    /* $end extenduy */
}


int main(int argc, char *argv[])
{
    int val = -12345;
    if (argc > 1)
	sscanf(argv[1], "%d", &val);
    test(val);
    return 0;
}



