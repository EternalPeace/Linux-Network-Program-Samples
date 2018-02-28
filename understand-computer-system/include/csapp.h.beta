/* $begin csapp.h */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <setjmp.h>
#include <signal.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <errno.h>
#include <math.h>
#include <pthread.h>
#include <semaphore.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <arpa/inet.h>

/* Simplifies calls to bind(), connect(), and accept() */
/* $begin sockaddrdef */
typedef struct sockaddr SA;
/* $end sockaddrdef */

/* External variables */
extern int h_errno;    /* defined by BIND for DNS errors */ 
extern char **environ; /* defined by libc */

/* Misc constants */
#define	MAXLINE	 8192  /* max text line length */
#define MAXBUF   8192  /* max I/O buffer size */
#define LISTENQ  1024  /* second argument to listen() */

/* Our own error-handling functions */
void unix_error(char *msg);
void posix_error(int code, char *msg);
void dns_error(char *msg);
void app_error(char *msg);

/* Process control wrappers */
pid_t Fork(void);
void Execve(const char *filename, char *const argv[], char *const envp[]);
pid_t Wait(int *status);
pid_t Waitpid(pid_t pid, int *iptr, int options);
void Kill(pid_t pid, int signum);
unsigned int Sleep(unsigned int secs);
void Pause(void);
unsigned int Alarm(unsigned int seconds);
void Setpgid(pid_t pid, pid_t pgid);
pid_t Getpgrp();

/* Sigaction wrapper */
typedef void handler_t(int);
handler_t *Signal(int signum, handler_t *handler);

/* Unix I/O wrappers */
int Open(const char *pathname, int flags, mode_t mode);
ssize_t Read(int fd, void *buf, size_t count);
ssize_t Write(int fd, const void *buf, size_t count);
off_t Lseek(int fildes, off_t offset, int whence);
void Close(int fd);
int Select(int  n, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, 
	   struct timeval *timeout);
void Dup2(int fd1, int fd2);

/* Memory mapping wrappers */
void *Mmap(void *addr, size_t len, int prot, int flags, int fd, off_t offset);
void Munmap(void *start, size_t length);

/* Standard I/O wrappers */
void Fclose(FILE *fp);
FILE *Fdopen(int fd, const char *type);
char *Fgets(char *ptr, int n, FILE *stream);
FILE *Fopen(const char *filename, const char *mode);
void Fputs(const char *ptr, FILE *stream);
size_t Fread(void *ptr, size_t size, size_t nmemb, FILE *stream);
void Fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);

/* Dynamic storage allocation wrappers */
void *Malloc(size_t size);
void *Calloc(size_t nmemb, size_t size);
void Free(void *ptr);

/* Thread control wrappers */
void Pthread_create(pthread_t *tidp, pthread_attr_t *attrp, 
		    void * (*routine)(void *), void *argp);
void Pthread_join(pthread_t tid, void **thread_return);
void Pthread_cancel(pthread_t tid);
void Pthread_detach(pthread_t tid);
void Pthread_exit(void *retval);
pthread_t Pthread_self(void);

/* Semaphore wrappers */
void Sem_init(sem_t *sem, int pshared, unsigned int value);
void P(sem_t *sem);
void V(sem_t *sem);

/* Mutex wrappers */
void Pthread_mutex_init(pthread_mutex_t *mutex, pthread_mutexattr_t *attr);
void Pthread_mutex_lock(pthread_mutex_t *mutex);
void Pthread_mutex_unlock(pthread_mutex_t *mutex);

/* Condition variable wrappers */
void Pthread_cond_init(pthread_cond_t *cond, pthread_condattr_t *attr);
void Pthread_cond_signal(pthread_cond_t *cond);
void Pthread_cond_broadcast(pthread_cond_t *cond);
void Pthread_cond_wait(pthread_cond_t *cond, pthread_mutex_t *mutex);
int Pthread_cond_timedwait(pthread_cond_t *cond, pthread_mutex_t *mutex,
			   struct timespec *abstime);

/* Sockets interface wrappers */
int Socket(int domain, int type, int protocol);
void Setsockopt(int s, int level, int optname, const void *optval, int optlen);
void Bind(int sockfd, struct sockaddr *my_addr, int addrlen);
void Listen(int s, int backlog);
int Accept(int s, struct sockaddr *addr, int *addrlen);
void Connect(int sockfd, struct sockaddr *serv_addr, int addrlen);

/* DNS wrappers */
struct hostent *Gethostbyname(const char *name);
struct hostent *Gethostbyaddr(const char *addr, int len, int type);

/* Stevens's socket I/O functions (UNP, Sec 3.9) */ 
ssize_t readn(int fd, void *vptr, size_t n);
ssize_t writen(int fd, const void *vptr, size_t n);
ssize_t readline(int fd, void *vptr, size_t maxlen); /* non-reentrant */

/* 
 * Stevens's reentrant readline_r package 
 */
/* struct used by readline_r */
/* $begin rline */
typedef struct {
    int read_fd;	/* caller's descriptor to read from */
    char *read_ptr;	/* caller's buffer to read into */
    size_t read_maxlen;	/* max bytes to read */

    /* next three are used internally by the function */
    int rl_cnt;		/* initialize to 0 */
    char *rl_bufptr;	/* initialize to rl_buf */
    char rl_buf[MAXBUF];/* internal buffer */
} Rline;
/* $end rline */

void readline_rinit(int fd, void *ptr, size_t maxlen, Rline *rptr); 
ssize_t	readline_r(Rline *rptr);

/* Wrappers for Stevens's socket I/O helpers */
ssize_t Readn(int fd, void *vptr, size_t n);
void Writen(int fd, void *vptr, size_t n);
ssize_t Readline(int fd, void *vptr, size_t maxlen); 
ssize_t	Readline_r(Rline *); 
void Readline_rinit(int fd, void *ptr, size_t maxlen, Rline *rptr); 

/* Our own client/server helper functions */
int open_clientfd(char *hostname, int portno);
int open_listenfd(int portno);
/* $end csapp.h */
