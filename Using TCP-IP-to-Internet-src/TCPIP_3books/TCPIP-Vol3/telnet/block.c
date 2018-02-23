/* block.c - bcopy, bzero */

/*------------------------------------------------------------------------
 * bcopy - copy a block of memory to another
 *------------------------------------------------------------------------
 */
int
bcopy(from, to, count)
char	*from, *to;
int	count;
{
	while (count-- > 0)
		*to++ = *from++;
}

/*------------------------------------------------------------------------
 * bzero - zero a block of memory
 *------------------------------------------------------------------------
 */
int
bzero(mem, count)
char	*mem;
int	count;
{
	while (count-- > 0)
		*mem = '\0';
}
