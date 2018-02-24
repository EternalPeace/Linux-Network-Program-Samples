#include "jove.h"
#include <signal.h>
#include <errno.h>

#ifdef	PIPEPROCS	/* only needed for systems with iproc-pipes */

#ifdef	BSD_SIGS
# define pause()	sigpause(0L)
#endif

struct header {
	int	pid,
		nbytes;
	char	buf[10];
};

#define HEADER_SIZE	(2 * sizeof (int))

/* JOVE sends SIGQUIT whenever it wants the kbd process (this program)
   to stop competing for input from the keyboard.  JOVE does this when
   JOVE realizes that there are no more interactive processes running.
   The reason we go through all this trouble is that JOVE slows down
   a lot when it's getting its keyboard input via a pipe. */

private SIGRESULT strt_read proto((int));

private SIGRESULT
hold_read(junk)
int	junk;	/* passed in when invoked by a signal; of no interest */
{
	signal(KBDSIG, strt_read);
	pause();
	SIGRETURN;
}

private SIGRESULT
strt_read(junk)
int	junk;
{
	signal(KBDSIG, hold_read);
	SIGRETURN;
}

int
main(argc, argv)
int	argc;
char	**argv;
{
	struct header	header;
	int	pid,
		n;

	signal(SIGINT, SIG_IGN);
	pid = getpid();
	header.pid = pid;

	hold_read(0);
	for (;;) {
		n = read(0, (UnivPtr) header.buf, sizeof (header.buf));
		if (n == -1) {
			if (errno != EINTR)
				break;
			continue;
		}
		header.nbytes = n;
		write(1, (UnivPtr) &header, HEADER_SIZE + n);
	}
	return 0;
}

#else	/* !PIPEPROCS */

int
main()
{
	return 0;
}

#endif	/* !PIPEPROCS */
