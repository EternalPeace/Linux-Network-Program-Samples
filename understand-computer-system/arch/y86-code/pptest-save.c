/* Test of x86 push and pop instructions */
#include <stdio.h>
#include <stdlib.h>

/* This function returns 0, indicating that pushl %esp pushes the old value of %esp */

/* $begin pushtest-c */
int pushtest()
{
    int rval;
    /* Insert the following assembly code:
       movl %esp,%eax   # Save stack pointer
       pushl %esp       # Push stack pointer
       popl  %edx       # Pop it back
       subl  %edx,%eax  # 0 or 4
       movl  %eax,rval  # Set as return value
    */
  asm("movl %%esp,%%eax;pushl %%esp;popl %%edx;subl %%edx,%%eax;movl %%eax,%0"
	: "=r" (rval)
	: /* No Input */
	: "%edx", "%eax");
    return rval;
}
/* $end pushtest-c */

/* This function returns tval.
   This indicates that popl %esp causes %esp to be set to popped value */

/* $begin poptest-c */
int poptest(int tval)
{
    int rval;
    /* Insert the following assembly code:
       pushl tval     # Save tval on stack
       movl %esp,%edx # Save stack pointer
       popl %esp      # Pop to stack pointer.
       movl %esp,rval # Set popped value as return value
       movl %edx,%esp # Restore original stack pointer
    */
    asm("pushl %1; movl %%esp,%%edx; popl %%esp; movl %%esp,%0; movl %%edx,%%esp"
	: "=r" (rval)
	: "r" (tval)
	: "%edx");
    return rval;
}
/* $end poptest-c */

int main(int argc, char *argv[])
{
    printf("Push test yields  0x%x\n", pushtest());
    if (argc > 1)
	printf("Pop test yields  0x%x\n", poptest(atoi(argv[1])));
    return 0;
}
