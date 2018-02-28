#include <stdio.h>
#include <stdlib.h>
#include "cpe.h"
#include "clock.h"

/*
 * Compute product of a set of array elements.
 * Function unrolls loops by 3.
*/

typedef int data_t;
#define OP +


/* $begin opt-aprod-c */
data_t aprod(data_t a[], int n)
{
    int i;
    data_t x, y, z;
    int r = 1;
    for (i = 0; i < n-2; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	r = r OP x OP y OP z; // Product computation
    }
    for (; i < n; i++)
	r = r OP a[i];
    return r;
}
/* $end opt-aprod-c */

data_t aprod0(data_t a[], int n)
{
    int i;
    data_t x, y, z;
    int r = 1;
    for (i = 0; i < n; i++)
	r = r OP a[i];
    return r;
}

data_t aprod0p(data_t a[], int n)
{
    int i;
    data_t x, y, z;
    data_t *d_end = a+n;
    data_t *p;
    
    int r = 1;
    for (p = a; p < d_end; p++)
	r = r OP *(p);
    return r;
}


data_t aprod1(data_t a[], int n)
{
    int i;
    data_t x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = ((r OP x) OP y) OP z; // A1
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r = r OP a[i];
    return r;
}

data_t aprod2(data_t a[], int n)
{
    int i;
    data_t x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = (r OP (x OP y)) OP z; // A2 
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r = r OP a[i];
    return r;
}

data_t aprod3(data_t a[], int n)
{
    int i;
    data_t x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = r OP ((x OP y) OP z); // A3
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r = r OP a[i];
    return r;
}

data_t aprod4(data_t a[], int n)
{
    int i;
    data_t x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = r OP (x OP (y OP z)); // A4
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r = r OP a[i];
    return r;
}

data_t aprod5(data_t a[], int n)
{
    int i;
    data_t x, y, z;
    int r = 1;
    for (i = 0; i < n; i+= 3) {    
	x = a[i]; y = a[i+1]; z = a[i+2];
	/* $begin opt-assoc-c */
	r = (r OP x) OP (y OP z); // A5
	/* $end opt-assoc-c */
    }
    for (; i < n; i++)
	r = r OP a[i];
    return r;
}

volatile int sink = 0;

#define SIZE 1024
data_t a[SIZE];

void t0(int n)
{
    sink = aprod0(a, n);
}

void t0p(int n)
{
    sink = aprod0p(a, n);
}


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
    mhz(1);
    printf("A0 CPE = %.2f\n", find_cpe(t0, SIZE));
    printf("A0p CPE = %.2f\n", find_cpe(t0p, SIZE));
    printf("A1 CPE = %.2f\n", find_cpe(t1, SIZE));
    printf("A2 CPE = %.2f\n", find_cpe(t2, SIZE));
    printf("A3 CPE = %.2f\n", find_cpe(t3, SIZE));
    printf("A4 CPE = %.2f\n", find_cpe(t4, SIZE));
    printf("A5 CPE = %.2f\n", find_cpe(t5, SIZE));
    return 0;
}








