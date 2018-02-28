/*
 * This needs to be assembled by as with the following flag:
 *    -xarch=v8plus
 *
 * Well, technically speaking, these newer, but backward compatible
 * architectures should work, too
 *    -xarch=v9
 *    -xarch=v9a
 *
 * Regardless, once it is compiled, the resulting object code can
 * be linked with C code to provide the following function:
 *
 *  extern unsigned long get_tick(void)
 *
 */
.align 4
.global get_tick
get_tick:
  save    %sp, -96, %sp
  rd %tick, %i0
  ret
  restore
	
