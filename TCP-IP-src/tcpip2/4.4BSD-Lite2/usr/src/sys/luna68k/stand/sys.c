/*
 * Copyright (c) 1992 OMRON Corporation.
 * Copyright (c) 1992, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * OMRON Corporation.
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
 *
 *	@(#)sys.c	8.1 (Berkeley) 6/10/93
 */

#include <sys/param.h>
#include <sys/stat.h>
#include <ufs/ufs/dir.h>
#include <luna68k/stand/saio.h>

ino_t	dlook();

struct dirstuff {
	int loc;
	struct iob *io;
};

openi(n, io)
	register struct iob *io;
{
	register struct dinode *dp;
	int cc;

	io->i_offset = 0;
	io->i_bn = fsbtodb(&io->i_fs, itod(&io->i_fs, n)) + io->i_boff;
	io->i_cc = io->i_fs.fs_bsize;
	io->i_ma = io->i_buf;
	cc = devread(io);
	dp = (struct dinode *)io->i_buf;
	io->i_ino = dp[itoo(&io->i_fs, n)];
	return (cc);
}

find(path, file)
	register char *path;
	struct iob *file;
{
	register char *q;
	char c;
	int n;

	if (path==NULL || *path=='\0') {
		printf("null path\n");
		return (0);
	}

	if (openi((ino_t) ROOTINO, file) < 0) {
		printf("can't read root inode\n");
		return (0);
	}
	while (*path) {
		while (*path == '/')
			path++;
		q = path;
		while(*q != '/' && *q != '\0')
			q++;
		c = *q;
		*q = '\0';
		if (q == path) path = "." ;	/* "/" means "/." */

		if ((n = dlook(path, file)) != 0) {
			if (c == '\0')
				break;
			if (openi(n, file) < 0)
				return (0);
			*q = c;
			path = q;
			continue;
		} else {
			printf("%s: not found\n", path);
			return (0);
		}
	}
	return (n);
}

daddr_t
sbmap(io, bn)
	register struct iob *io;
	daddr_t bn;
{
	register struct dinode *ip;
	int i, j, sh;
	daddr_t nb, *bap;

	ip = &io->i_ino;
	if (bn < 0) {
		printf("bn negative\n");
		return ((daddr_t)0);
	}

	/*
	 * blocks 0..NDADDR are direct blocks
	 */
	if(bn < NDADDR) {
		nb = ip->di_db[bn];
		return (nb);
	}

	/*
	 * addresses NIADDR have single and double indirect blocks.
	 * the first step is to determine how many levels of indirection.
	 */
	sh = 1;
	bn -= NDADDR;
	for (j = NIADDR; j > 0; j--) {
		sh *= NINDIR(&io->i_fs);
		if (bn < sh)
			break;
		bn -= sh;
	}
	if (j == 0) {
		printf("bn ovf %D\n", bn);
		return ((daddr_t)0);
	}

	/*
	 * fetch the first indirect block address from the inode
	 */
	nb = ip->di_ib[NIADDR - j];
	if (nb == 0) {
		printf("bn void %D\n",bn);
		return ((daddr_t)0);
	}

	/*
	 * fetch through the indirect blocks
	 */
	for (; j <= NIADDR; j++) {
		if (blknos[j] != nb) {
			io->i_bn = fsbtodb(&io->i_fs, nb) + io->i_boff;
			io->i_ma = b[j];
			io->i_cc = io->i_fs.fs_bsize;
			if (devread(io) != io->i_fs.fs_bsize) {
				if (io->i_error)
					errno = io->i_error;
				printf("bn %D: read error\n", io->i_bn);
				return ((daddr_t)0);
			}
			blknos[j] = nb;
		}
		bap = (daddr_t *)b[j];
		sh /= NINDIR(&io->i_fs);
		i = (bn / sh) % NINDIR(&io->i_fs);
		nb = bap[i];
		if(nb == 0) {
			printf("bn void %D\n",bn);
			return ((daddr_t)0);
		}
	}
	return (nb);
}

ino_t
dlook(s, io)
	char *s;
	register struct iob *io;
{
	register struct direct *dp;
	struct direct *readdir();
	register struct dinode *ip;
	struct dirstuff dirp;
	int len;

	if (s == NULL || *s == '\0')
		return (0);
	ip = &io->i_ino;
	if ((ip->di_mode&IFMT) != IFDIR) {
		printf("not a directory\n");
		printf("%s: not a directory\n", s);
		return (0);
	}
	if (ip->di_size == 0) {
		printf("%s: zero length directory\n", s);
		return (0);
	}
	len = strlen(s);
	dirp.loc = 0;
	dirp.io = io;
	for (dp = readdir(&dirp); dp != NULL; dp = readdir(&dirp)) {
		if(dp->d_ino == 0)
			continue;
		if (dp->d_namlen == len && !strcmp(s, dp->d_name))
			return (dp->d_ino);
	}
	return (0);
}

/*
 * get next entry in a directory.
 */
struct direct *
readdir(dirp)
	register struct dirstuff *dirp;
{
	register struct direct *dp;
	register struct iob *io;
	daddr_t lbn, d;
	int off;

	io = dirp->io;
	for(;;) {
		if (dirp->loc >= io->i_ino.di_size)
			return (NULL);
		off = blkoff(&io->i_fs, dirp->loc);
		if (off == 0) {
			lbn = lblkno(&io->i_fs, dirp->loc);
			d = sbmap(io, lbn);
			if(d == 0)
				return NULL;
			io->i_bn = fsbtodb(&io->i_fs, d) + io->i_boff;
			io->i_ma = io->i_buf;
			io->i_cc = dblksize(&io->i_fs, &io->i_ino, lbn);
			if (devread(io) < 0) {
				errno = io->i_error;
				printf("bn %D: directory read error\n",
					io->i_bn);
				return (NULL);
			}
		}
		dp = (struct direct *)(io->i_buf + off);
		dirp->loc += dp->d_reclen;
		if (dp->d_ino == 0)
			continue;
		return (dp);
	}
}

lseek(fdesc, addr, ptr)
	int fdesc, ptr;
	off_t addr;
{
	register struct iob *io;

	if (ptr != 0) {
		printf("Seek not from beginning of file\n");
		errno = EOFFSET;
		return (-1);
	}
	fdesc -= 3;
	if (fdesc < 0 || fdesc >= NFILES ||
	    ((io = &iob[fdesc])->i_flgs & F_ALLOC) == 0) {
		errno = EBADF;
		return (-1);
	}
	io->i_offset = addr;
	io->i_bn = addr / DEV_BSIZE;
	io->i_cc = 0;
	return (0);
}

getc(fdesc)
	int fdesc;
{
	register struct iob *io;
	register struct fs *fs;
	register char *p;
	int c, lbn, off, size, diff;


	if (fdesc >= 0 && fdesc <= 2)
		return (cngetc());
	fdesc -= 3;
	if (fdesc < 0 || fdesc >= NFILES ||
	    ((io = &iob[fdesc])->i_flgs&F_ALLOC) == 0) {
		errno = EBADF;
		return (-1);
	}
	p = io->i_ma;
	if (io->i_cc <= 0) {
		if ((io->i_flgs & F_FILE) != 0) {
			diff = io->i_ino.di_size - io->i_offset;
			if (diff <= 0)
				return (-1);
			fs = &io->i_fs;
			lbn = lblkno(fs, io->i_offset);
			io->i_bn = fsbtodb(fs, sbmap(io, lbn)) + io->i_boff;
			off = blkoff(fs, io->i_offset);
			size = dblksize(fs, &io->i_ino, lbn);
		} else {
			io->i_bn = io->i_offset / DEV_BSIZE;
			off = 0;
			size = DEV_BSIZE;
		}
		io->i_ma = io->i_buf;
		io->i_cc = size;
		if (devread(io) < 0) {
			errno = io->i_error;
			return (-1);
		}
		if ((io->i_flgs & F_FILE) != 0) {
			if (io->i_offset - off + size >= io->i_ino.di_size)
				io->i_cc = diff + off;
			io->i_cc -= off;
		}
		p = &io->i_buf[off];
	}
	io->i_cc--;
	io->i_offset++;
	c = (unsigned)*p++;
	io->i_ma = p;
	return (c);
}

int	errno;

read(fdesc, buf, count)
	int fdesc, count;
	char *buf;
{
	register i, size;
	register struct iob *file;
	register struct fs *fs;
	int lbn, off;

	errno = 0;
	if (fdesc >= 0 & fdesc <= 2) {
		i = count;
		do {
			*buf = cngetc();
		} while (--i && *buf++ != '\n');
		return (count - i);
	}
	fdesc -= 3;
	if (fdesc < 0 || fdesc >= NFILES ||
	    ((file = &iob[fdesc])->i_flgs&F_ALLOC) == 0) {
		errno = EBADF;
		return (-1);
	}
	if ((file->i_flgs&F_READ) == 0) {
		errno = EBADF;
		return (-1);
	}
	if ((file->i_flgs & F_FILE) == 0) {
		file->i_cc = count;
		file->i_ma = buf;
		file->i_bn = file->i_boff + (file->i_offset / DEV_BSIZE);
		i = devread(file);
		file->i_offset += count;
		if (i < 0)
			errno = file->i_error;
		return (i);
	}
	if (file->i_offset+count > file->i_ino.di_size)
		count = file->i_ino.di_size - file->i_offset;
	if ((i = count) <= 0)
		return (0);
	/*
	 * While reading full blocks, do I/O into user buffer.
	 * Anything else uses getc().
	 */
	fs = &file->i_fs;
	while (i) {
		off = blkoff(fs, file->i_offset);
		lbn = lblkno(fs, file->i_offset);
		size = dblksize(fs, &file->i_ino, lbn);
		if (off == 0 && size <= i) {
			file->i_bn = fsbtodb(fs, sbmap(file, lbn)) +
			    file->i_boff;
			file->i_cc = size;
			file->i_ma = buf;
			if (devread(file) < 0) {
				errno = file->i_error;
				return (-1);
			}
			file->i_offset += size;
			file->i_cc = 0;
			buf += size;
			i -= size;
		} else {
			size -= off;
			if (size > i)
				size = i;
			i -= size;
			do {
				*buf++ = getc(fdesc+3);
			} while (--size);
		}
	}
	return (count);
}

write(fdesc, buf, count)
	int fdesc, count;
	char *buf;
{
	register i;
	register struct iob *file;

	errno = 0;
	if (fdesc >= 0 && fdesc <= 2) {
		i = count;
		while (i--)
			putchar(0, *buf++);
		return (count);
	}
	fdesc -= 3;
	if (fdesc < 0 || fdesc >= NFILES ||
	    ((file = &iob[fdesc])->i_flgs&F_ALLOC) == 0) {
		errno = EBADF;
		return (-1);
	}
	if ((file->i_flgs&F_WRITE) == 0) {
		errno = EBADF;
		return (-1);
	}
	file->i_cc = count;
	file->i_ma = buf;
	file->i_bn = file->i_boff + (file->i_offset / DEV_BSIZE);
	i = devwrite(file);
	file->i_offset += count;
	if (i < 0)
		errno = file->i_error;
	return (i);
}

int	openfirst = 1;

open(str, how)
	char *str;
	int how;
{
	register char *cp;
	int i;
	register struct iob *file;
	register struct devsw *dp;
	int fdesc;
	long atol();

	if (openfirst) {
		for (i = 0; i < NFILES; i++)
			iob[i].i_flgs = 0;
		openfirst = 0;
	}

	for (fdesc = 0; fdesc < NFILES; fdesc++)
		if (iob[fdesc].i_flgs == 0)
			goto gotfile;
	_stop("No more file slots");
gotfile:
	(file = &iob[fdesc])->i_flgs |= F_ALLOC;

	/*
	 * parse path strings
	 */
							/* find end of dev type name */
	for (cp = str; *cp && *cp != '('; cp++)
			;
	if (*cp != '(') {
		printf("Bad device\n");
		file->i_flgs = 0;
		errno = EDEV;
		return (-1);
	}
							/* compare dev type name */
	*cp = '\0';
	for (dp = devsw; dp->dv_name; dp++)
		if (!strcmp(str, dp->dv_name))
			break;
	*cp++ = '(';
	if (dp->dv_name == NULL) {
		printf("Unknown device\n");
		file->i_flgs = 0;
		errno = ENXIO;
		return (-1);
	}
	file->i_dev = dp-devsw;
							/* get unit number */
	file->i_unit = *cp++ - '0';
	if (*cp >= '0' && *cp <= '9')
		file->i_unit = file->i_unit * 10 + *cp++ - '0';
	if (file->i_unit < 0 || file->i_unit > 63) {
		printf("Bad unit specifier\n");
		file->i_flgs = 0;
		errno = EUNIT;
		return (-1);
	}
							/* get partition offset */
	if (*cp++ != ',') {
badoff:
		printf("Missing offset specification\n");
		file->i_flgs = 0;
		errno = EOFFSET;
		return (-1);
	}
	file->i_boff = *cp - '0';
							/* check out end of dev spec */
	for (;;) {
		if (*cp == ')')
			break;
		if (*cp++)
			continue;
		goto badoff;
	}
							/* device open */
	devopen(file);
							/* if it's specified only device */
	if (*++cp == '\0') {
		file->i_flgs |= how+1;
		file->i_cc = 0;
		file->i_offset = 0;
		return (fdesc+3);
	}
							/* No, it's specified file */
							/* read super block */
	file->i_ma = (char *)(&file->i_fs);
	file->i_cc = SBSIZE;
	file->i_bn = SBLOCK + file->i_boff;
	file->i_offset = 0;
	if (devread(file) < 0) {
		errno = file->i_error;
		printf("super block read error\n");
		return (-1);
	}

	if ((i = find(cp, file)) == 0) {
		file->i_flgs = 0;
		errno = ESRCH;
		return (-1);
	}

	if (how != 0) {
		printf("Can't write files yet.. Sorry\n");
		file->i_flgs = 0;
		errno = EIO;
		return (-1);
	}

	if (openi(i, file) < 0) {
		errno = file->i_error;
		return (-1);
	}
	file->i_offset = 0;
	file->i_cc = 0;
	file->i_flgs |= F_FILE | (how+1);
	return (fdesc+3);
}

close(fdesc)
	int fdesc;
{
	struct iob *file;

	fdesc -= 3;
	if (fdesc < 0 || fdesc >= NFILES ||
	    ((file = &iob[fdesc])->i_flgs&F_ALLOC) == 0) {
		errno = EBADF;
		return (-1);
	}
	if ((file->i_flgs&F_FILE) == 0)
		devclose(file);
	file->i_flgs = 0;
	return (0);
}

_stop(s)
	char *s;
{
	static int stopped = 0;
	int i;

	if (!stopped) {
		stopped++;
		for (i = 0; i < NFILES; i++)
			if (iob[i].i_flgs != 0)
				close(i);
	}
	printf("%s\n", s);
	exit();
}

ioctl(fdesc, cmd, arg)
	int fdesc, cmd;
	char *arg;
{
	register struct iob *file;
	int error = 0;

	fdesc -= 3;
	if (fdesc < 0 || fdesc >= NFILES ||
	    ((file = &iob[fdesc])->i_flgs&F_ALLOC) == 0) {
		errno = EBADF;
		return (-1);
	}
	switch (cmd) {

	case SAIOHDR:
		file->i_flgs |= F_HDR;
		break;

	case SAIOCHECK:
		file->i_flgs |= F_CHECK;
		break;

	case SAIOHCHECK:
		file->i_flgs |= F_HCHECK;
		break;

	case SAIONOBAD:
		file->i_flgs |= F_NBSF;
		break;

	case SAIODOBAD:
		file->i_flgs &= ~F_NBSF;
		break;

	default:
		error = devioctl(file, cmd, arg);
		break;
	}
	if (error < 0)
		errno = file->i_error;
	return (error);
}

extern char end;
static caddr_t theend = 0;

caddr_t
brk(addr)
 char *addr;
{
	char stkloc;

	if (theend == (caddr_t)0)
		theend = &end;
	if (addr > &stkloc || addr < &end)
		return((caddr_t)-1);
	if (addr > theend)
		bzero(theend, addr-theend);
	theend = addr;
	return(0);
}

caddr_t
sbrk(incr)
 int incr;
{
	caddr_t obrk, brk();

	if (theend == (caddr_t)0)
		theend = &end;
	obrk = theend;
	if (brk(theend+incr) == (caddr_t)-1)
		return((caddr_t)-1);
	return(obrk);
}

int
getpagesize()
{
	return(NBPG);
}

int
getdtablesize()
{
	return(NFILES);
}
