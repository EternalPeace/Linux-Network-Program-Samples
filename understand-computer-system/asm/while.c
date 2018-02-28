
/* Example of while loop */

/* $begin while-c */
int loop_while(int a, int b)
{
  int i = 0;
  int result = a;
  while (i < 256) {
    result += a;
    a -= b;
    i += b;
  }
  return result;
}
/* $end while-c */

/* $begin while-gotoc */
int loop_while_goto(int a, int b)
{
  int i = 0;
  int result = a;
 loop:
  result += a;
  a -= b;
  i += b;
  if (i <= 255)
    goto loop;
  return result;
}
/* $end while-gotoc */
