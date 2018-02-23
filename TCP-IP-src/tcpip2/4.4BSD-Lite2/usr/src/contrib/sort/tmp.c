/*-
 * Copyright (c) 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * Peter McIlroy.
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
static char sccsid[] = "@(#)tmp.c	8.1 (Berkeley) 6/6/93";
#endif /* not lint */

#include <sys/param.h>

#include <err.h>
#include <errno.h>
#include <limits.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "pathnames.h"

#define _NAME_TMP "sort.XXXXXXXX"

FILE *
ftmp()
{
	static char *envtmp;
	sigset_t set, oset;
	static int first = 0;
	FILE *fd;
	char pathb[_POSIX_PATH_MAX], *path;

	path = pathb;
	if (!first && !envtmp) {
		envtmp = getenv("TMPDIR");
		first = 1;
	}
	if (envtmp)
		(void)snprintf(path,
		    sizeof(pathb), "%s/%s", envtmp, _NAME_TMP);
	else {
		memmove(path, _PATH_SORTTMP, sizeof(_PATH_SORTTMP));
	}
	sigfillset(&set);
	(void)sigprocmask(SIG_BLOCK, &set, &oset);
	path = mktemp(path);
	if (!path)
		err(2, "%s");
	if (!(fd = fopen(path, "w+")))
		err(2, "%s", path);
	(void)unlink(path);

	(void)sigprocmask(SIG_SETMASK, &oset, NULL);
	return (fd);
};
