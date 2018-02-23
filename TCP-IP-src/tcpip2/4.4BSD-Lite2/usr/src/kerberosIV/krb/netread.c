/*
 * $Source: /mit/kerberos/src/lib/krb/RCS/netread.c,v $
 * $Author: jtkohl $
 *
 * Copyright 1987, 1988 by the Massachusetts Institute of Technology.
 *
 * For copying and distribution information, please see the file
 * <mit-copyright.h>.
 */

#ifndef	lint
static char rcsid_netread_c[] =
"$Header: netread.c,v 4.1 88/11/15 16:47:21 jtkohl Exp $";
#endif	lint

#include <mit-copyright.h>

/*
 * krb_net_read() reads from the file descriptor "fd" to the buffer
 * "buf", until either 1) "len" bytes have been read or 2) cannot
 * read anymore from "fd".  It returns the number of bytes read
 * or a read() error.  (The calling interface is identical to
 * read(2).)
 *
 * XXX must not use non-blocking I/O
 */

int
krb_net_read(fd, buf, len)
int fd;
register char *buf;
register int len;
{
    int cc, len2 = 0;

    do {
	cc = read(fd, buf, len);
	if (cc < 0)
	    return(cc);		 /* errno is already set */
	else if (cc == 0) {
	    return(len2);
	} else {
	    buf += cc;
	    len2 += cc;
	    len -= cc;
	}
    } while (len > 0);
    return(len2);
}
