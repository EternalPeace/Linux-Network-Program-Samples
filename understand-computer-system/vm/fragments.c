#include "csapp.h"

void heapify(int **binheap, int size, int pos)
{
}

void misc() 
{
    char *bufp;
    int size=0;

/* $begin execve */
Execve("a.out", NULL, NULL);
/* $end execve */


/* $begin mmap */
bufp = Mmap(NULL, size, PROT_READ, MAP_PRIVATE|MAP_ANON, 0, 0);
/* $end mmap */
}

/* $begin garbage */
void garbage() 
{
    int *p = (int *)Malloc(15213);

    return; /* array p is garbage at this point */
}
/* $end garbage */


/* $begin uninitialized */
/* return y = Ax */
int *matvec(int **A, int *x, int n) 
{ 
    int i, j;

    int *y = (int *)Malloc(n * sizeof(int));
    
    for (i = 0; i < n; i++)
	for (j = 0; j < n; j++)
            y[i] += A[i][j] * x[j];
    return y;
}
/* $end uninitialized */

/* $begin bufoverflow */
void bufoverflow() 
{
    char buf[64];

    gets(buf); /* here is the stack buffer overflow bug */
    return;
}
/* $end bufoverflow */

/* $begin makearray1 */
/* Create an nxm array */
int **makeArray1(int n, int m) 
{
    int i;
    int **A = (int **)Malloc(n * sizeof(int));

    for (i = 0; i < n; i++) 
	A[i] = (int *)Malloc(m * sizeof(int));
    return A;
}   
/* $end makearray1 */

/* $begin makearray2 */
/* Create an nxm array */
int **makeArray2(int n, int m) 
{
    int i;
    int **A = (int **)Malloc(n * sizeof(int));

    for (i = 0; i <= n; i++) 
	A[i] = (int *)Malloc(m * sizeof(int));
    return A;
}   
/* $end makearray2 */


/* $begin binheapdelete */
int *binheapDelete(int **binheap, int *size)
{
    int *packet = binheap[0];
    
    binheap[0] = binheap[*size - 1];
    *size--; /* this should be (*size)-- */
    heapify(binheap, *size, 0);
    return(packet);
}
/* $end binheapdelete */

/* $begin search */
int *search(int *p, int val) 
{
    while (*p && *p != val)
	p += sizeof(int); /* should be p++ */
    return p;
}
/* $end search */

/* $begin stackref */
int *stackref () 
{
    int val;

    return &val; 
}  
/* $end stackref */


/* $begin heapref */
int *heapref(int n, int m) 
{
    int i;
    int *x, *y;

    x = (int *)Malloc(n * sizeof(int));

    /* ... */   /* other calls to malloc and free go here */

    free(x);

    y = (int *)Malloc(m * sizeof(int));
    for (i = 0; i < m; i++)
	y[i] = x[i]++;  /* oops! x[i] is a word in a free block */

    return y;
}
/* $end heapref */

/* $begin leak */
void leak(int n) 
{
    int *x = (int *)Malloc(n * sizeof(int));
    
    return;  /* x is garbage at this point */
}
/* $end leak */
