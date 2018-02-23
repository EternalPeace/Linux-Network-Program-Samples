/* x_ns.c - x_ns */

#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <network.h>

/*------------------------------------------------------------------------
 *  x_ns  -  (command ns) interact with the host name server cache
 *------------------------------------------------------------------------
 */
COMMAND	x_ns(stdin, stdout, stderr, nargs, args)
int	stdin, stdout, stderr, nargs;
char	*args[];
{
	char	str[128], ipstr[64];
	IPaddr	ip;
	int	ac;

	for (ac=1; ac < nargs; ++ac) {
		if ((ip = name2ip(args[ac])) == SYSERR)
			strcpy(ipstr, "not resolved");
		else
			ip2dot(ipstr, ip);
		sprintf(str, "\"%s\": %s\n", args[ac], ipstr);
		write(stdout, str, strlen(str));
	}
	return OK;
}
