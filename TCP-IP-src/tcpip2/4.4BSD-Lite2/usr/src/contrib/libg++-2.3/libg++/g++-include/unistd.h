#ifndef _G_unistd_h
#define _G_unistd_h 1

#include <_G_config.h>

extern "C" {

#if _G_HAVE_UNISTD
#ifndef _G_USE_PROTOS
#define chmod __hide_chmod
#define chown __hide_chown
#define execl __hide_execl
#define execlp __hide_execlp
#define execle __hide_execle
#define fchown __hide_fchown
#define ioctl __hide_ioctl
#define setgid __hide_setgid
#define setuid __hide_setuid
#endif
#ifdef _AIX
// AIX's unistd.h defines int rename (const char *old, const char *new).
// This is not legal ANSI.  It causes a C++ syntax error (because of 'new').
#define new __new
#endif
#include_next <unistd.h>
#ifdef _AIX
#undef new
#endif
#ifndef _G_USE_PROTOS
#undef chmod
#undef chown
#undef execl
#undef execle
#undef execlp
#undef fchown
#undef ioctl
#undef setgid
#undef setuid
#endif
#else
#ifndef SEEK_SET
#define SEEK_SET        0
#define SEEK_CUR        1
#define SEEK_END        2
#endif

#ifndef F_OK
#define F_OK            0
#endif
#ifndef X_OK
#define X_OK            1
#endif
#ifndef W_OK
#define W_OK            2
#endif
#ifndef R_K
#define R_OK            4
#endif
#endif

#ifdef __GNUG__
extern void volatile _exit(int);
#else
void _exit(int);
#endif

extern unsigned alarm _G_ARGS((unsigned));
extern char    *brk _G_ARGS((const char *));
extern int      chdir _G_ARGS((const char*));
extern int      chmod  _G_ARGS((const char*, _G_mode_t));
extern int      chown (const char*, _G_uid_t, _G_gid_t);
extern int      close _G_ARGS((int));
extern char*    crypt _G_ARGS((const char*, const char*));
extern int      dup _G_ARGS((int));
extern int      dup2 _G_ARGS((int, int));
extern int	encrypt _G_ARGS((char*, int));
extern int      execl (const char*, const char *, ...);
extern int      execle (const char*, const char *, ...);
extern int      execlp (const char*, const char*, ...);
extern int      exect _G_ARGS((const char*, char * const *, char * const *));
extern int      execv _G_ARGS((const char*,  char * const *));
extern int      execve _G_ARGS((const char*, char * const *, char * const *));
extern int      execvp _G_ARGS((const char*,  char * const *));
extern int      fchown (int, _G_uid_t, _G_gid_t);
extern pid_t	fork _G_ARGS((void));
extern int      fsync _G_ARGS((int));
extern int      ftruncate _G_ARGS((int, _G_off_t));
extern char*    getcwd _G_ARGS((char*, _G_size_t));
extern int      getdomainname _G_ARGS((char*, int));
extern int      getdtablesize _G_ARGS((void));
extern int      getgroups _G_ARGS((int, gid_t []));
extern uid_t geteuid _G_ARGS((void));
extern gid_t getegid _G_ARGS((void));
extern gid_t getgid _G_ARGS((void));
extern long     gethostid _G_ARGS((void));
extern int      gethostname _G_ARGS((char*, int));
extern pid_t getpgrp _G_ARGS((...));
extern pid_t getpid _G_ARGS((void));
extern pid_t getppid _G_ARGS((void));
extern char*    getlogin _G_ARGS((void));
extern char*    getpass _G_ARGS((const char*));
extern uid_t getuid _G_ARGS((void));
extern int      ioctl (int, int, ... );
extern int      isatty _G_ARGS((int));
extern int      link _G_ARGS((const char*, const char*));
extern int      mkstemp _G_ARGS((char*));
extern char*    mktemp _G_ARGS((char*));
extern int      nice _G_ARGS((int));
extern int      pause _G_ARGS((void));
extern int      pipe _G_ARGS((int*));
extern int      readlink _G_ARGS((const char*, char*, int));
extern int      rename _G_ARGS((const char*, const char*));
extern int      rmdir _G_ARGS((const char*)); 
extern char*	sbrk _G_ARGS((int));
extern int      syscall _G_ARGS((int, ...));
extern int      setgid (gid_t);
extern int      sethostname _G_ARGS((const char*, int));
extern int	setpgrp _G_ARGS((pid_t, pid_t));
extern int      setregid _G_ARGS((gid_t, gid_t));
extern int      setreuid _G_ARGS((uid_t, uid_t));
extern int      setuid (uid_t);
extern unsigned sleep _G_ARGS((unsigned));
extern void     swab _G_ARGS((void*, void*, int));
extern int      symlink _G_ARGS((const char*, const char*));
extern long     sysconf _G_ARGS((int));
extern int      truncate _G_ARGS((const char*, off_t));
extern char*    ttyname _G_ARGS((int));
extern int      ttyslot _G_ARGS((void));
//extern int   umask _G_ARGS((int)); /* commented out for now; wrong for SunOs4.1 */
extern int      unlink _G_ARGS((const char*));
extern pid_t	vfork _G_ARGS((void));
extern int      vadvise _G_ARGS((int));
extern int      vhangup _G_ARGS((void));
extern off_t lseek _G_ARGS((int, long long, int));
extern _G_ssize_t read _G_ARGS((int, void*, _G_size_t));
extern _G_ssize_t write _G_ARGS((int, const void*, _G_size_t));
extern int      access _G_ARGS((const char*, int));
#ifndef hpux
extern int      flock _G_ARGS((int, int));
#endif

}

#endif
