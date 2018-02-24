/*
 * This file implements functions used by both client and servers in the
 * XNS courier library
 */

/*
 $Log:	misc.c,v $
 * Revision 2.1  87/01/13  16:36:10  ed
 * Added Sequence_of_Unspecified routines for generic use
 * 
 * Revision 2.0  85/11/21  07:22:12  jqj
 * 4.3BSD standard release
 * 
 * Revision 1.2  85/10/21  12:55:26  root
 * Gould version:  added MoveLong routine.
 * 
 * Revision 1.4  85/03/26  06:08:42  jqj
 * Revised public alpha-test version, released 26 March 1985
 * 
 * Revision 1.3  85/03/11  16:37:08  jqj
 * Public alpha-test version, released 11 March 1985
 * 
 * Revision 1.2  85/01/27  07:37:27  jqj
 * finished but undebugged version
 * 
 */

#ifndef lint
static char rcsid[] = "$Header: misc.c,v 2.1 87/01/13 16:36:10 ed Exp $";
#endif

#include <stdio.h>
#include "courier.h"

Unspecified *
Allocate(n)
	LongInteger n;
{
	Unspecified *p;
	extern char *malloc();

	if (n > 100000 || n < 0) {
		fprintf(stderr,
			"Ridiculous request to memory allocator (%d words).\n",
			n);
		exit(1);
		/* NOTREACHED */
	}
	if (n == 0)
		return (0);
	p = (Unspecified *) malloc((unsigned) n*sizeof(Unspecified));
	if (p == 0) {
		fprintf(stderr, "Out of memory.\n");
		exit(1);
	}
	return (p);
}

Deallocate(p)
	Unspecified *p;
{
	if (p != 0)
		free((char *) p);
}


/*
 * Unfortunately, Courier strings are 8 bits and frequently contain
 * NULs ('\000').  Hence we use an encoding scheme in which '\0200'
 * is used as a substitute for '\000'.
 * Note that 0200 is not routinely used in Xerox character encodings.
 * If it does happen to appear in an incoming Courier string, it will
 * be confusing!  More importantly, there is no way to generate a
 * Courier string containing a '\200'.
 */


int
sizeof_String(p)
/* the size in 16-bit words of the serialized data structure */
	String *p;
{
	return ((strlen(*p)+3)/2);
}

clear_String(p)
	String *p;
{
	Deallocate((Unspecified*) *p);
	*p = (String) 0;
	return;
}

int
externalize_String(p, buf)
/* convert to counted-sequence format, translating \0200 to \000 */
	String *p;
	Unspecified *buf;
{
	Cardinal len;
	register int n;
	register int ch;
	register String from, to;

	if (*p == (String) 0) n = 0;
	else {
		n = strlen(*p);
		if (n > 65535) n = 0;
	}
	len = n;
	buf += externalize_Cardinal(&len, buf);
	to = (String) buf;
	from = *p;
	while (--n >= 0) {
		if ((ch = *from++) == '\0200') *to++ = '\000';
		else *to++ = ch;
	}
	return ((len+3)/2);
}

int
internalize_String(p, buf)
/* convert to C format, translating \000 to \0200 and terminating on count */
	String *p;
	Unspecified *buf;
{
	Cardinal len;
	register int n, ch;
	register String from, to;

	buf += internalize_Cardinal(&len, buf);
	*p = to = (String) Allocate(len/2 + 1);
	from = (String) buf;
	for (n = len; n > 0; --n) {
		if ((ch = *from++) == '\000') *to++ = '\0200';
		else *to++ = ch;
	}
	*to = '\000';		/* tie off with a null, finally */
	return ((len+3)/2);
}

int
sizeof_enumeration(p)
	unsigned int *p;
{
	return(sizeof_Cardinal(p));
}

clear_enumeration(p)
	unsigned int *p;
{
	return;				/* no-op */
}

int
externalize_enumeration(p, buf)
	unsigned int *p;		/* enums are same size as int */
	Unspecified *buf;
{
	Cardinal c;
	
	/*
	 * If this truncates, and it will on a Vax or a Sun,
	 * that's because Courier Enumerations are  defined to be
	 * "in the closed interval [0, 65535]."  So, if the value
	 * of the C enum is too big, there's nothing we can do here ...
	 * except possibly to raise an exception.
	 */
	c = *p;
	return(externalize_Cardinal(&c, buf));
}

int
internalize_enumeration(p, buf)
	unsigned int *p;
	Unspecified *buf;
{
	Cardinal c;
	register int s;
	
	s = internalize_Cardinal(&c, buf);
	*p = c;			/* (possibly) expand from short to long */
	
	return(s);
}


void
clear_Sequence_of_Unspecified(p)
	register Sequence_of_Unspecified *p;
{
	Deallocate((Unspecified*) p->sequence);
	p->length = 0;  p->sequence = (Unspecified*) 0;
}

int
externalize_Sequence_of_Unspecified(p, buf)
	register Sequence_of_Unspecified *p;
	register Unspecified *buf;
{
	register Unspecified *bp;
	register int i;

	if (p->sequence == (Unspecified*)0) p->length = 0;
	bp = buf + externalize_Cardinal(&p->length, buf);
	for (i = 0; i < p->length; i++)
		bp += externalize_Unspecified(&p->sequence[i], bp);
	return (bp - buf);
}


int
internalize_Sequence_of_Unspecified(p, buf)
	register Sequence_of_Unspecified *p;
	register Unspecified *buf;
{
	register Unspecified *bp;
	register int i;

	bp = buf + internalize_Cardinal(&p->length, buf);
	p->sequence = (Unspecified *)
		Allocate(p->length * sizeof(Unspecified)/sizeof(Cardinal));
	for (i = 0; i < p->length; i++)
		bp += internalize_Unspecified(&p->sequence[i], bp);
	return (bp - buf);
}

#ifndef MoveLong
int MoveLong(a, b)
	Unspecified *a, *b;
{
	*b++ = *a++;
	*b = *a;
	return(2);
}
#endif

