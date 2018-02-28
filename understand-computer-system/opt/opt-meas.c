#include <stdio.h>
#include <stdlib.h>
#include "cpe.h"

/*
 * Compute product of a set of array elements.
 * Function unrolls loops by 3.
*/

/* $begin opt-aprod-c */
int aprod(int a[], int n)
{
    int i, x, y, z;
    int r = 1;
    for (i = 0; i < n-2; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	r = r * x * y * z; /* Product computation */
    }
    for (; i < n; i++)
	r *= a[i];
    return r;
}
/* $end opt-aprod-c */

int aprod1(int a[], int n)
{
    int i, x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = ((r * x) * y) * z; /* A1 */
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r *= a[i];
    return r;
}

int aprod2(int a[], int n)
{
    int i, x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = (r * (x * y)) * z; /* A2 */
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r *= a[i];
    return r;
}

int aprod3(int a[], int n)
{
    int i, x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = r * ((x * y) * z); /* A3 */
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r *= a[i];
    return r;
}

int aprod4(int a[], int n)
{
    int i, x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = r * (x * (y * z)); /* A4 */
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r *= a[i];
    return r;
}

int aprod5(int a[], int n)
{
    int i, x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {    
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = (r * x) * (y * z); /* A5 */
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r *= a[i];
    return r;
}

volatile int sink = 0;

#define SIZE 1024
int a[SIZE];

void t1(int n)
{
    sink = aprod1(a, n);
}

void t2(int n)
{
    sink = aprod2(a, n);
}

void t3(int n)
{
    sink = aprod3(a, n);
}

void t4(int n)
{
    sink = aprod4(a, n);
}

void t5(int n)
{
    sink = aprod5(a, n);
}

int main() {
    printf("A1 CPE = %.2f\n", find_cpe(t1, SIZE));
    printf("A2 CPE = %.2f\n", find_cpe(t2, SIZE));
    printf("A3 CPE = %.2f\n", find_cpe(t3, SIZE));
    printf("A4 CPE = %.2f\n", find_cpe(t4, SIZE));
    printf("A5 CPE = %.2f\n", find_cpe(t5, SIZE));
    return 0;
}








