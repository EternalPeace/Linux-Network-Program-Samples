/* Example of do-while loop */

/* $begin dw-c */
int dw_loop(int x, int y, int n)
{
  do {
    x += n;
    y *= n;
    n--;
  } while ((n > 0) & (y < n)); /* Note use of bitwise '&' */
  return x;
}
/* $end dw-c */
