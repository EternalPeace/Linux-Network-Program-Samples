#include <stdio.h>
#include <stdlib.h>
/* Illustration of pointers */

/* $begin pointer-c */
struct str {  /* Example Structure */
    int t;
    char v;
};

union uni {   /* Example Union */
    int t;
    char v;
} u;

int g = 15;

void fun(int* xp)
{
    void (*f)(int*) = fun;   /* f is a function pointer */

    /* Allocate structure on stack */
    struct str s = {1,'a'}; /* Initialize structure */

    /* Allocate union from heap */
    union uni *up = (union uni *) malloc(sizeof(union uni));

    /* Locally declared array */
    int *ip[2] = {xp, &g};

    up->v = s.v+1;          

    printf("ip     = %p, *ip    = %p, **ip   = %d\n",
	   ip, *ip, **ip);
    printf("ip+1   = %p, ip[1]  =  %p, *ip[1] = %d\n",
	   ip+1, ip[1], *ip[1]);
    printf("&s.v   = %p, s.v    = '%c'\n", &s.v, s.v);
    printf("&up->v =  %p, up->v  = '%c'\n", &up->v, up->v);  
    printf("f      =  %p\n", f);
    if (--(*xp) > 0)
        f(xp);                /* Recursive call of fun */
}

int test()
{
    int x = 2;
    fun(&x);
    return x;
}
/* $end pointer-c */

int main()
{
  int buf[16];
  /* This little hack is an attempt to get the stack to be in a
     stable position
  */
  int offset = (((int) buf) & 0xFFF);
  int *space = (int *) alloca(offset);
  *space = 0; /* So that don't get complaint of unused variable */
  return test();
}
