#include <stdio.h>
#include <stdlib.h>

int array[] = {0xd, 0xc0, 0xb00, 0xa000};

/* $begin sum-c */
int Sum(int *Start, int Count)
{
  int sum = 0;
  while (Count) {
    sum += *Start;
    Start++;
    Count--;
  }
  return sum;
}
/* $end sum-c */

/* $begin rsum-c */
int rSum(int *Start, int Count)
{
    if (Count <= 0)
	return 0;
    return *Start + rSum(Start+1, Count-1);
}
/* $end rsum-c */

void Prog()
{
  int val = Sum(array, 4);
  printf("0x%x\n", val);
  exit(0);
}

int main()
{
  Prog();
  return 0;
}
