#include <stdio.h>
#include <stdlib.h>
#include "cpe.h"

/* Copy 2-dimensional array */

#define ASIZE 2048

void copyij(int src[ASIZE][ASIZE], int dst[ASIZE][ASIZE])
{
  int i,j;
  for (i = 0; i < ASIZE; i++)
    for (j = 0; j < ASIZE; j++)
      dst[i][j] = src[i][j];
}

void copyji(int src[ASIZE][ASIZE], int dst[ASIZE][ASIZE])
{
  int i,j;
  for (j = 0; j < ASIZE; j++)
    for (i = 0; i < ASIZE; i++)
      dst[i][j] = src[i][j];
}


int a[ASIZE][ASIZE];
int b[ASIZE][ASIZE];

void funij(int n)
{
  copyij(a,b);  
}

void funji(int n)
{
  copyji(a,b);  
}

int main()
{
  double tji = measure_function(funji, 0);
  double tij = measure_function(funij, 0);
  printf("ij: Array size %d, Cycles = %.0f, CPE = %.2f\n",
	 ASIZE, tij, tij/(ASIZE*ASIZE));
  printf("ji: Array size %d, Cycles = %.0f, CPE = %.2f\n",
	 ASIZE, tji, tji/(ASIZE*ASIZE));
  return 0;
}

