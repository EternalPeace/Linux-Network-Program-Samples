/* local.h */

#include <termios.h>

extern FILE	*scrfp;
extern char	scrname[];
extern struct termios	oldtty;

extern char	t_flushc, t_intrc, t_quitc, sg_erase, sg_kill;

extern int	errno;
extern char	*sys_errlist[];
