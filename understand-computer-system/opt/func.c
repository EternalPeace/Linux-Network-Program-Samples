/* $begin func */
int f(int);

int func1(x)
{
    return f(x) + f(x) + f(x) + f(x);
}

int func2(x)
{
    return 4*f(x);
}
/* $end func */

/* $begin f */
int counter = 0;

int f(int x)
{
    return counter++;
}
/* $end f */
