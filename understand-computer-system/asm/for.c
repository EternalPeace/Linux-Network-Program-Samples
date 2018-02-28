/* Deciphering a for loop */

/* $begin for-c */
int loop(int x, int y, int n)
{
  int result = 0;
  int i;
  for (i = n-1; i >= 0; i = i-x) {
    result += y * x;
  }
  return result;
}
/* $end for-c */

#if 0
/* $begin for-prob-c */
int loop(int x, int y, int n)
{
  int result = 0;
  int i;
  for (i = ____; i ____ ; i = ___ ) {
    result += _____ ;
  }
  return result;
}
/* $end for-prob-c */
#endif
