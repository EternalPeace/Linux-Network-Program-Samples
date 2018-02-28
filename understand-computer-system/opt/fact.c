/* Benchmark factorials */
#include <stdio.h>
#include "cpe.h"

#define ASIZE 1024

int rfact(int n)
{
    if (n <= 1)
	return 1;
    return n * rfact(n-1);
}

/* $begin fact */
int fact(int n)
{
    int i;
    int result = 1;

    for (i = n; i > 0; i--)
	result = result * i;
    return result;
}
/* $end fact */


/* $begin fact_u2 */
int fact_u2(int n)
/* $end fact_u2 */
{
    int i;
    int result = 1;

    for (i = n; i > 1; i -= 2) {
	result = (result * i) * (i - 1);
    }
    return result;
}


int fact_u2bad(int n)
/* $begin fact_u2 */
{
    int i;
    int result = 1;
    for (i = n; i > 0; i-=2) {
	result = (result * i) * (i-1);
    }
    return result;
}
/* $end fact_u2 */

int fact_u2split(int n)
{
    int i;
    int result = 1;
    for (i = n; i > 1; i-=2) {
	/* $begin fact_u2line */
	result = result * (i * (i - 1));
	/* $end fact_u2line */
    }
    return result;
}

int fact_u2x2(int n)
{
    int i;
    int result0 = 1;
    int result1 = 1;
    for (i = n; i > 1; i-=2) {
	result0 *= i;
	result1 *= (i-1);
    }
    return result0*result1;
}

typedef int (*fact_fun)(int);

#define TEST_COUNT 6

static fact_fun funs[TEST_COUNT] =
{ rfact, fact, fact_u2bad, fact_u2, fact_u2split, fact_u2x2 };

static char *test_descr[TEST_COUNT] =
{ "Recursive", "Iterative", "Unroll X2 (Bad)", "Unroll X2 (Good)",
  "Unroll X2, Split",
  "Unroll X2, Superscalar X2" };

int idx = 0;

static void test(int n)
{
    funs[idx](n);
}

/* Perform functional test of factorial function i */
static void ftest(int i)
{
    int n;
    for (n = 0; n < 10; n++) {
	if (funs[i](n) != rfact(n)) {
	    printf("Oops.  %d! yields %d, should be %d\n",
		   n, funs[i](n), rfact(n));
	    break;
	}
    }
}

static void run_test(int i) 
{
    double cpe;
    printf("Description: %s, ",
	   test_descr[i]);
    idx = i;
    cpe = find_cpe(test, ASIZE);
    /* print results */
    printf("CPE = %.2f\n", cpe);
    ftest(i);
}

int main()
{
    int i;
    for (i = 0; i < TEST_COUNT; i++)
	run_test(i);
    return 0;
}
