/* local.h */

#define	ECHO	0x0001

extern FILE	*scrfp;
extern char	scrname[];

extern unsigned int	ttyflags;
extern char		t_flushc, t_intrc, t_quitc, sg_erase, sg_kill;

extern int	errno;

void	errexit(const char *, ...);
void	ttwrite(SOCKET, FILE *, unsigned char *, int);
void	sowrite(SOCKET, FILE *, unsigned char *, int);
void	fsmbuild(void);
int	sputc(const char, SOCKET);

#define	SPUTS(s, sfd)	(send(sfd, s, strlen(s), 0))
