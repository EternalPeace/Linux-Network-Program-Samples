/*-
 * Copyright (c) 1983, 1985
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#ifndef lint
static char sccsid[] = "@(#)get_names.c	5.1 (Berkeley) 6/6/85";
#endif not lint

#include "talk.h"
#include "ctl.h"
#include <netdb.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

extern CTL_MSG msg;

/*
 * Determine the local and remote user, tty, and machines
 */
void
get_names(argc, argv)
	int argc;
	char *argv[];
{
	char hostname[HOST_NAME_LENGTH];
	char *his_name;
	char *my_name;
	char *my_machine_name;
	char *his_machine_name;
	char *my_tty;
	char *his_tty;
	char *ptr;

	if (argc < 2 ) {
		printf("Usage:	talk user [ttyname]\n");
		exit(-1);
	}
	if (!isatty(0)) {
		printf("Standard input must be a tty, not a pipe or a file\n");
		exit(-1);
	}
	my_name = getlogin();
	if (my_name == NULL) {
		printf("You don't exist. Go away.\n");
		exit(-1);
	}
	gethostname(hostname, sizeof (hostname));
	my_machine_name = hostname;
	my_tty = rindex(ttyname(0), '/') + 1;
	/* check for, and strip out, the machine name of the target */
	for (ptr = argv[1]; *ptr != '\0' && *ptr != '@' && *ptr != ':' &&
	    *ptr != '!' && *ptr != '.'; ptr++)
		;
	if (*ptr == '\0') {
		/* this is a local to local talk */
		his_name = argv[1];
		his_machine_name = my_machine_name;
	} else {
		if (*ptr == '@') {
			/* user@host */
			his_name = argv[1];
			his_machine_name = ptr + 1;
		} else {
			/* host.user or host!user or host:user */
			his_name = ptr + 1;
			his_machine_name = argv[1];
		}
		*ptr = '\0';
	}
	if (argc > 2)
		his_tty = argv[2];	/* tty name is arg 2 */
	else
		his_tty = "";
	get_addrs(my_machine_name, his_machine_name);
	/* Load these useful values into the standard message header */
	msg.id_num = 0;
	strncpy(msg.l_name, my_name, NAME_SIZE);
	msg.l_name[NAME_SIZE - 1] = '\0';
	strncpy(msg.r_name, his_name, NAME_SIZE);
	msg.r_name[NAME_SIZE - 1] = '\0';
	strncpy(msg.r_tty, his_tty, TTY_SIZE);
	msg.r_tty[TTY_SIZE - 1] = '\0';
}
