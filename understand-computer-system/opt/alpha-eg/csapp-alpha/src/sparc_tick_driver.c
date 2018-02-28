/*
 * Since I couldn't coax gcc into compiling assembly code
 * for sparc versions higher than 8, I decided to write 
 * a version of the function in assembly and link it against 
 * this version of the test program compiled with gcc.
 *
 * To use it, just assemble get_tick.s to create get_tick.o (see 
 * comment in get_tick.s) and link it against this code.
 */

#include <stdio.h>

extern unsigned long get_tick(void);

int main (int argc, char *argv[])
{
  unsigned long count;

  while (1)
  {
    count = get_tick();
    printf ("TICK: %u\n", (unsigned)count); fflush (stdout);
  }
}
