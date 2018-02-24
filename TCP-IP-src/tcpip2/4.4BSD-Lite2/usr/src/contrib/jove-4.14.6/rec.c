/***************************************************************************
 * This program is Copyright (C) 1986, 1987, 1988 by Jonathan Payne.  JOVE *
 * is provided to you without charge, and with no warranty.  You may give  *
 * away copies of JOVE, including sources, provided that this notice is    *
 * included in all the files.                                              *
 ***************************************************************************/

#include "jove.h"
#include "fp.h"
#include "rec.h"

#ifndef	MAC
#	include <sys/file.h>
#endif

private int	rec_fd = -1;
private char	*recfname;
private File	*rec_out;

#ifndef	L_SET
#	define L_SET 0
#endif

private struct rec_head	Header;

private void
recinit()
{
	char	buf[128];

#ifdef	MAC
	swritef(buf, sizeof(buf), "%s/%s", HomeDir, p_tempfile);
#else
	swritef(buf, sizeof(buf), "%s/%s", TmpFilePath, p_tempfile);
#endif
	recfname = copystr(buf);
	recfname = mktemp(recfname);
	rec_fd = creat(recfname, 0644);
	if (rec_fd == -1) {
		complain("Cannot create \"%s\"; recovery disabled.", recfname);
		return;
	}
	/* initialize the record IO */
	rec_out = fd_open(recfname, F_WRITE|F_LOCKED, rec_fd, iobuff, LBSIZE);

	/* Initialize the record header. */
	Header.Uid = getuid();
	Header.Pid = getpid();
	Header.UpdTime = 0L;
	Header.Nbuffers = 0;
	(void) write(rec_fd, (UnivPtr) &Header, sizeof Header);
}

/* Close recfile before execing a child process.
 * Since we might be vforking, we must not change any variables
 * (in particular rec_fd).
 */
void
recclose()
{
	if (rec_fd == -1)
		return;
	(void) close(rec_fd);
}

/* Close and remove recfile before exiting. */


void
recremove()
{
	if (rec_fd == -1)
		return;
	recclose();
	(void) unlink(recfname);
}

private void
putaddr(addr, p)
daddr	addr;
register File	*p;
{
	register char	*cp = (char *) &addr;
	register int	nchars = sizeof (daddr);

	while (--nchars >= 0)
		jputc(*cp++ & 0377, p);
}

private void
putn(cp, nbytes)
register char	*cp;
register size_t	nbytes;
{
	while (nbytes-- > 0)
		jputc(*cp++ & 0377, rec_out);
}

/* Write out the line pointers for buffer B. */

private void
dmppntrs(b)
register Buffer	*b;
{
	register Line	*lp;

	for (lp = b->b_first; lp != NULL; lp = lp->l_next)
		putaddr(lp->l_dline, rec_out);
}

/* dump the buffer info and then the actual line pointers. */

private void
dmp_buf_header(b)
register Buffer	*b;
{
	struct rec_entry	record;
	register Line	*lp;
	register int	nlines = 0;

	for (lp = b->b_first; lp != NULL; lp = lp->l_next, nlines++)
		if (lp == b->b_dot)
			record.r_dotline = nlines;
	strcpy(record.r_fname, b->b_fname ? b->b_fname : NullStr);
	strcpy(record.r_bname, b->b_name);
	record.r_nlines = nlines;
	record.r_dotchar = b->b_char;
	putn((char *) &record, sizeof record);
}

/* Goes through all the buffers and syncs them to the disk. */

int	SyncFreq = 50;

void
SyncRec()
{
	register Buffer	*b;
	static bool	beenhere = NO;

	if (!beenhere) {
		beenhere = YES;
		recinit();	/* Init recover file. */
	}
	if (rec_fd == -1)
		return;
	lseek(rec_fd, 0L, L_SET);
	(void) time(&Header.UpdTime);
	Header.Nbuffers = 0;
	for (b = world; b != NULL; b = b->b_next)
		if (b->b_type == B_SCRATCH || !IsModified(b))
			continue;
		else
			Header.Nbuffers += 1;
	Header.FreePtr = DFree;
	putn((char *) &Header, sizeof Header);
	if (Header.Nbuffers != 0) {
		lsave();	/* this makes things really right */
		SyncTmp();
		for (b = world; b != NULL; b = b->b_next)
			if (b->b_type == B_SCRATCH || !IsModified(b))
				continue;
			else
				dmp_buf_header(b);
		for (b = world; b != NULL; b = b->b_next)
			if (b->b_type == B_SCRATCH || !IsModified(b))
				continue;
			else
				dmppntrs(b);
	}
	flushout(rec_out);
}

/* Full Recover.  What we have to do is go find the name of the tmp
   file data/rec pair and use those instead of the ones we would have
   created eventually.  The rec file has a list of buffers, and then
   the actual pointers.  Stored for each buffer is the buffer name,
   the file name, the number of lines, the current line, the current
   character.  The current modes do not need saving as they will be
   saved when the file name is set.  If a process was running in a
   buffer, it will be lost. */

void
FullRecover()
{
}
