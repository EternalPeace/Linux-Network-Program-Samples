/*
 * This needs to be compiled under cc with the following flag:
 *    -xarch=v8plus
 *
 * Well, technically speaking, these newer, but backward compatible
 * architectures should work, too
 *    -xarch=v9
 *    -xarch=v9a
 *
 * I would have expected that gcc should have been able to compile
 * this with similar flags, such as those below, but it didn't
 * seem to recognize them. Perhaps someone who knows more
 * about the gnu tools could tell you the right flags 
 *    -mv8plus, -mv9, -mv9a
 */

#include <stdio.h>

unsigned long get_tick()
{
  asm ("rd %tick, %i0;");
}

int main (int argc, char *argv[])
{
  unsigned long count;

  while (1)
  {
    count = get_tick();
    printf ("TICK: %u\n", (unsigned)count); fflush (stdout);
  }
}

