/* x_igmp.c - x_igmp */

#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <network.h>

/*------------------------------------------------------------------------
 *  x_igmp  -  (command igmp) application to join/leave IGMP host groups
 *------------------------------------------------------------------------
 */
COMMAND	x_igmp(stdin, stdout, stderr, nargs, args)
int	stdin, stdout, stderr, nargs;
char	*args[];
{
	IPaddr	mcast;

	if (nargs != 3) {
		write(stderr, "usage: igmp (join | leave) <group>\n", 35);
		return SYSERR;
	}
	mcast = dot2ip(args[2]);
	if (!IP_CLASSD(mcast)) {
		write(stderr, "igmp: illegal group address\n", 28);
		return SYSERR;
	}
	if (strcmp(args[1], "join") == 0)
		return hgjoin(NI_PRIMARY, mcast, 1);
	else if (strcmp(args[1], "leave") == 0)
		return hgleave(NI_PRIMARY, mcast);
	/* else */
	write(stderr, "usage: igmp (join | leave) <group>\n", 35);
	return SYSERR;
}
