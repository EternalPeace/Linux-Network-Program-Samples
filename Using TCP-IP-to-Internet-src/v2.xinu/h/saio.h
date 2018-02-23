/*-
 * Copyright (c) 1991, 1992 Berkeley Software Design, Inc. All rights reserved.
 * The Berkeley Software Design Inc. software License Agreement specifies
 * the terms and conditions for redistribution.
 *
 *	BSDI $Id: saio.h,v 1.2 1997/09/21 19:26:19 dls Dist dls $
 */

#include <sys/param.h>
#include <ufs/fs.h>
#include <ufs/dinode.h>
#include <string.h>
#include "saerrno.h"

/*
 * This struct iob was originally created by grepping for
 * member names in the (cleaned up) net2 source...
 * The indirect block cache assumes NINDIR(fs) == 1.
 */
struct iob {
	int	i_adapt;	/* device dependent adapter number? */
	u_long	i_bn;		/* absolute block number on volume */
	u_long	i_boff;		/* offset to base of partition in sectors */
	int	i_cc;		/* transfer size in bytes */
	int	i_ctlr;		/* device dependent controller number? */
	int	i_dev;		/* index for iob[] according to dev.c */
	int	i_error;	/* set but not used in net2 code */
	int	i_flgs;		/* F_* flags */
	char	*i_ma;		/* address to copy into / from */
	off_t	i_off;		/* byte offset in file */
	int	i_part;		/* partition number (0-7) */
	int	i_unit;		/* logical unit */
	struct	dinode i_ino;	/* on-disk inode for file */
	struct	fs i_fs;	/* filesystem struct for this filesystem */
	char	i_buf[MAXBSIZE];	/* filesystem block buffer */
	daddr_t	i_ibno[NIADDR];		/* indirect block number cache */
	daddr_t	i_iblock[NIADDR][MAXBSIZE / sizeof (daddr_t)];	/* ib cache */
};

/*
 * File structures for file descriptors 3 - NFILE.
 * This isn't defined anywhere; we need to pick a file for it, probably sys.c.
 * Evidence for usage comes from ls.c and stat.c.
 */
extern struct iob iob[];
#define	SOPEN_MAX	3

/*
 * Defines for i_flgs, derived by grepping net2 source
 * and examination of dev.c (for F_TYPEMASK).
 */
#define	F_ALLOC		0x01		/* set if file was opened */
#define	F_FILE		0x02		/* set if this is a named file */
#define	F_RDDATA	0x04		/* set for a read transaction */
#define	F_READ		0x08		/* open for reading */
#define	F_WRDATA	0x10		/* set for a write transaction */
#define	F_WRITE		0x20		/* open for writing */

#define	F_TYPEMASK	(F_RDDATA|F_WRDATA)

/*
 * Struct devsw was created by looking for member names in stand/dev.c,
 * then matching them to parameters in conf.c.
 */
struct devsw {
	char	*dv_name;
	int	(*dv_strategy) __P((struct iob *, int));
	int	(*dv_open) __P((struct iob *));
	void	(*dv_close) __P((struct iob *));
	int	(*dv_ioctl) __P((struct iob *, int, caddr_t));
};

extern struct devsw devsw[];

struct stat;

int bmap __P((struct iob *, daddr_t, daddr_t *));
int bread __P((struct iob *, char *, daddr_t, size_t));
int close __P((int));
void devclose __P((struct iob *));
int devioctl __P((struct iob *, int, caddr_t));
int devopen __P((struct iob *));
int devread __P((struct iob *));
int devwrite __P((struct iob *));
volatile void exit __P((int));
int findfs __P((struct iob *));
int findinode __P((struct iob *, unsigned long));
int fstat __P((int, struct stat *));
int getc __P((int));
int getfile __P((char *, int));
char *gets __P((char *));
int ioctl __P((int, u_long, caddr_t));
off_t lseek __P((int, off_t, int));
int namei __P((struct iob *, char *));
int nodev __P((struct iob *));
int noioctl __P((struct iob *, int, caddr_t));
void nullsys __P((struct iob *));
int open __P((char *, int));
void printf __P((const char *, ...));
int putchar __P((int));
int read __P((int, void *, size_t));
int stat __P((char *, struct stat *));
char *strerror __P((int));
void _stop __P((char *));
void wait __P((int));
int write __P((int, void *, size_t));
