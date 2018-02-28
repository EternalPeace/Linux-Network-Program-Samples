/* $begin csapp.c */
#include "csapp.h"

/************************** 
 * Error-handling functions
 **************************/
/* $begin errorfuns */
/* $begin unixerror */
void unix_error(char *msg) /* unix-style error */
{
    fprintf(stderr, "%s: %s\n", msg, strerror(errno));
    exit(0);
}
/* $end unixerror */

void posix_error(int code, char *msg) /* posix-style error */
{
    fprintf(stderr, "%s: %s\n", msg, strerror(code));
    exit(0);
}

void dns_error(char *msg) /* dns-style error */
{
    fprintf(stderr, "%s: %s\n", msg, hstrerror(h_errno));
    exit(0);
}

void app_error(char *msg) /* application error */
{
    fprintf(stderr, "%s\n", msg);
    exit(0);
}
/* $end errorfuns */

/*********************************************
 * Wrappers for Unix process control functions
 ********************************************/

/* $begin forkwrapper */
pid_t Fork(void) 
{
    pid_t pid;

    if ((pid = fork()) < 0)
	unix_error("Fork error");
    return pid;
}
/* $end forkwrapper */

void Execve(const char *filename, char *const argv[], char *const envp[]) 
{
    if (execve(filename, argv, envp) < 0)
	unix_error("Execve error");
}

/* $begin wait */
pid_t Wait(int *status) 
{
    pid_t pid;

    if ((pid  = wait(status)) < 0)
	unix_error("Wait error");
    return pid;
}
/* $end wait */

pid_t Waitpid(pid_t pid, int *iptr, int options) 
{
    pid_t retpid;

    if ((retpid  = waitpid(pid, iptr, options)) < 0) 
	unix_error("Waitpid error");
    return(retpid);
}

/* $begin sigaction */
handler_t *Signal(int signum, handler_t *handler) 
{
    struct sigaction action, old_action;

    action.sa_handler = handler;  
    sigemptyset(&action.sa_mask); /* block sigs of type being handled */
    action.sa_flags = SA_RESTART; /* restart syscalls if possible */

    if (sigaction(signum, &action, &old_action) < 0)
	unix_error("Signal error");
    return (old_action.sa_handler);
}
/* $end sigaction */

/* $begin kill */
void Kill(pid_t pid, int signum) 
{
    int rc;

    if ((rc = kill(pid, signum)) < 0)
	unix_error("Kill error");
}
/* $end kill */

void Pause() 
{
    (void)pause();
    return;
}

unsigned int Sleep(unsigned int secs) 
{
    unsigned int rc;

    if ((rc = sleep(secs)) < 0)
	unix_error("Sleep error");
    return rc;
}

unsigned int Alarm(unsigned int seconds) {
    return alarm(seconds);
}
 
void Setpgid(pid_t pid, pid_t pgid) {
    int rc;

    if ((rc = setpgid(pid, pgid)) < 0)
	unix_error("Setpgid error");
    return;
}

pid_t Getpgrp(void) {
    return getpgrp();
}

/********************************
 * Wrappers for Unix I/O routines
 ********************************/

int Open(const char *pathname, int flags, mode_t mode) 
{
    int rc;

    if ((rc = open(pathname, flags, mode))  < 0)
	unix_error("Open error");
    return rc;
}

ssize_t Read(int fd, void *buf, size_t count) 
{
    ssize_t rc;

    if ((rc = read(fd, buf, count)) < 0) 
	unix_error("Read error");
    return rc;
}

ssize_t Write(int fd, const void *buf, size_t count) 
{
    ssize_t rc;

    if ((rc = write(fd, buf, count)) < 0)
	unix_error("Write error");
    return rc;
}

off_t Lseek(int fildes, off_t offset, int whence) 
{
    off_t rc;

    if ((rc = lseek(fildes, offset, whence)) < 0)
	unix_error("Lseek error");
    return rc;
}

void Close(int fd) 
{
    int rc;

    if ((rc = close(fd)) < 0)
	unix_error("Close error");
}

int Select(int  n, fd_set *readfds, fd_set *writefds,
	   fd_set *exceptfds, struct timeval *timeout) 
{
    int rc;

    if ((rc = select(n, readfds, writefds, exceptfds, timeout)) < 0)
	unix_error("Select error");
    return rc;
}

void Dup2(int fd1, int fd2) 
{
    if (dup2(fd1, fd2) == -1)
	unix_error("dup2 error");
}

/**************************************
 * Wrapper for memory mapping functions
 **************************************/
void *Mmap(void *addr, size_t len, int prot, int flags, int fd, off_t offset) 
{
    void	*ptr;

    if ((ptr = mmap(addr, len, prot, flags, fd, offset)) == ((void *) -1))
	unix_error("mmap error");
    return(ptr);
}

void Munmap(void *start, size_t length) 
{
    if (munmap(start, length) < 0)
	unix_error("munmap error");
}

/***************************************************
 * Wrappers for dynamic storage allocation functions
 ***************************************************/

void *Malloc(size_t size) 
{
    void *p;

    if ((p  = malloc(size)) == NULL)
	unix_error("Malloc error");
    return p;
}

void *Calloc(size_t nmemb, size_t size) 
{
    void *p;

    if ((p = calloc(nmemb, size)) == NULL)
	unix_error("Calloc error");
    return p;
}

void Free(void *ptr) 
{
    free(ptr);
}

/*********************************************************
 * Error-handling wrappers for the Standard I/O functions.
 *********************************************************/
void Fclose(FILE *fp) 
{
    if (fclose(fp) != 0)
	unix_error("Fclose error");
}

FILE *Fdopen(int fd, const char *type) 
{
    FILE *fp;

    if ((fp = fdopen(fd, type)) == NULL)
	unix_error("Fdopen error");

    return fp;
}

char *Fgets(char *ptr, int n, FILE *stream) 
{
    char *rptr;

    if (((rptr = fgets(ptr, n, stream)) == NULL) && ferror(stream))
	app_error("Fgets error");

    return rptr;
}

FILE *Fopen(const char *filename, const char *mode) 
{
    FILE *fp;

    if ((fp = fopen(filename, mode)) == NULL)
	unix_error("Fopen error");

    return fp;
}

void Fputs(const char *ptr, FILE *stream) 
{
    if (fputs(ptr, stream) == EOF)
	unix_error("Fputs error");
}

size_t Fread(void *ptr, size_t size, size_t nmemb, FILE *stream) 
{
    size_t n;

    if (((n = fread(ptr, size, nmemb, stream)) < nmemb) && ferror(stream)) 
	unix_error("Fread error");
    return n;
}

void Fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream) 
{
    if (fwrite(ptr, size, nmemb, stream) < nmemb)
	unix_error("Fwrite error");
}


/************************************************
 * Wrappers for Pthreads thread control functions
 ************************************************/

void Pthread_create(pthread_t *tidp, pthread_attr_t *attrp, 
		    void * (*routine)(void *), void *argp) 
{
    int rc;

    if ((rc = pthread_create(tidp, attrp, routine, argp)) != 0)
	posix_error(rc, "Pthread_create error");
}

void Pthread_cancel(pthread_t tid) {
    int rc;

    if ((rc = pthread_cancel(tid)) != 0)
	posix_error(rc, "Pthread_cancel error");
}

void Pthread_join(pthread_t tid, void **thread_return) {
    int rc;

    if ((rc = pthread_join(tid, thread_return)) != 0)
	posix_error(rc, "Pthread_join error");
}

void Pthread_detach(pthread_t tid) {
    int rc;

    if ((rc = pthread_detach(tid)) != 0)
	posix_error(rc, "Pthread_detach error");
}

void Pthread_exit(void *retval) {
    pthread_exit(retval);
}

pthread_t Pthread_self(void) {
    return pthread_self();
}
 
/*************************************************************
 * Wrappers for Pthreads mutex and condition variable functions
 ************************************************************/

void Pthread_mutex_init(pthread_mutex_t *mutex, pthread_mutexattr_t *attr) 
{
    int rc;

    if ((rc = pthread_mutex_init(mutex, attr)) != 0)
	posix_error(rc, "Pthread_mutex_init error");
}

/* $begin lock */
void Pthread_mutex_lock(pthread_mutex_t *mutex) 
{
    int rc;

    if ((rc = pthread_mutex_lock(mutex)) != 0)
	posix_error(rc, "Pthread_mutex_lock error");
}
/* $end lock */

void Pthread_mutex_unlock(pthread_mutex_t *mutex) 
{
    int rc;

    if ((rc = pthread_mutex_unlock(mutex)) != 0)
	posix_error(rc, "Pthread_mutex_unlock error");
}

void Pthread_cond_init(pthread_cond_t *cond, pthread_condattr_t *attr) 
{
    int rc;

    if ((rc = pthread_cond_init(cond, attr)) != 0)
	posix_error(rc, "Pthread_cond_init error");
}

void Pthread_cond_signal(pthread_cond_t *cond) 
{
    int rc;

    if ((rc = pthread_cond_signal(cond)) != 0)
	posix_error(rc, "Pthread_cond_signal error");
}

void Pthread_cond_broadcast(pthread_cond_t *cond) 
{
    int rc;

    if ((rc = pthread_cond_broadcast(cond)) != 0)
	posix_error(rc, "Pthread_cond_broadcast error");
}

void Pthread_cond_wait(pthread_cond_t *cond, pthread_mutex_t *mutex) 
{
    int rc;

    if ((rc = pthread_cond_wait(cond, mutex)) != 0)
	posix_error(rc, "Pthread_cond_wait error");
}

/* $begin timedwait */
int Pthread_cond_timedwait(pthread_cond_t *cond, 
			   pthread_mutex_t *mutex,
			   struct timespec *abstime) 
{
    int rc = pthread_cond_timedwait(cond, mutex, abstime);

    if ((rc != 0) && (rc != ETIMEDOUT))  
	posix_error(rc, "Pthread_cond_timedwait error");
    return rc;
}  
/* $end timedwait */

/*******************************
 * Wrappers for Posix semaphores
 *******************************/

void Sem_init(sem_t *sem, int pshared, unsigned int value) 
{
    if (sem_init(sem, pshared, value) < 0)
	unix_error("Sem_init error");
}

void P(sem_t *sem) 
{
    if (sem_wait(sem) < 0)
	unix_error("P error");
}

void V(sem_t *sem) 
{
    if (sem_post(sem) < 0)
	unix_error("V error");
}

/**************************** 
 * Sockets interface wrappers
 ****************************/

int Socket(int domain, int type, int protocol) 
{
    int rc;

    if ((rc = socket(domain, type, protocol)) < 0)
	unix_error("Socket error");
    return rc;
}

void Setsockopt(int s, int level, int optname, const void *optval, int optlen) 
{
    int rc;

    if ((rc = setsockopt(s, level, optname, optval, optlen)) < 0)
	unix_error("Setsockopt error");
}

void Bind(int sockfd, struct sockaddr *my_addr, int addrlen) 
{
    int rc;

    if ((rc = bind(sockfd, my_addr, addrlen)) < 0)
	unix_error("Bind error");
}

void Listen(int s, int backlog) 
{
    int rc;

    if ((rc = listen(s,  backlog)) < 0)
	unix_error("Listen error");
}

int Accept(int s, struct sockaddr *addr, int *addrlen) 
{
    int rc;

    if ((rc = accept(s, addr, addrlen)) < 0)
	unix_error("Accept error");
    return rc;
}

void Connect(int sockfd, struct sockaddr *serv_addr, int addrlen) 
{
    int rc;

    if ((rc = connect(sockfd, serv_addr, addrlen)) < 0)
	unix_error("Connect error");
}

/************************
 * DNS interface wrappers 
 ***********************/

/* $begin gethostbyname */
struct hostent *Gethostbyname(const char *name) 
{
    struct hostent *p;

    if ((p = gethostbyname(name)) == NULL)
	dns_error("Gethostbyname error");
    return p;
}
/* $end gethostbyname */

struct hostent *Gethostbyaddr(const char *addr, int len, int type) 
{
    struct hostent *p;

    if ((p = gethostbyaddr(addr, len, type)) == NULL)
	dns_error("Gethostbyaddr error");
    return p;
}


/******************************** 
 * Client/server helper functions
 ********************************/
/*
 * open_clientfd - open connection to server at <hostname, port> 
 *   and return a socket descriptor ready for reading and writing.
 */
/* $begin open_clientfd */
int open_clientfd(char *hostname, int port) 
{
    int clientfd;
    struct hostent *hp;
    struct sockaddr_in serveraddr;

    clientfd = Socket(AF_INET, SOCK_STREAM, 0);

    /* fill in the server's IP address and port */
    hp = Gethostbyname(hostname);
    bzero((char *) &serveraddr, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    bcopy((char *)hp->h_addr, 
	  (char *)&serveraddr.sin_addr.s_addr, hp->h_length);
    serveraddr.sin_port = htons(port);

    /* establish a connection with the server */
    Connect(clientfd, (SA *) &serveraddr, sizeof(serveraddr));
  
    return clientfd;
}
/* $end open_clientfd */

/*  
 * open_listenfd - open and return a listening socket on port
 */
/* $begin open_listenfd */
int open_listenfd(int port) 
{
    int listenfd;
    int optval;
    struct sockaddr_in serveraddr;
  
    /* create a socket descriptor */
    listenfd = Socket(AF_INET, SOCK_STREAM, 0);
 
    /* eliminates "Address already in use" error from bind. */
    optval = 1;
    Setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, 
	       (const void *)&optval , sizeof(int));

    /* listenfd will be an endpoint for all requests to port
       on any IP address for this host */
    bzero((char *) &serveraddr, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET; 
    serveraddr.sin_addr.s_addr = htonl(INADDR_ANY); 
    serveraddr.sin_port = htons((unsigned short)port); 
    Bind(listenfd, (SA *)&serveraddr, sizeof(serveraddr));

    /* make it a listening socket ready to accept connection requests */
    Listen(listenfd, LISTENQ);

    return listenfd;
}
/* $end open_listenfd */

/******************************************
 * I/O helper functions (from Stevens UNP) 
 ******************************************/
/* $begin readn */
ssize_t readn(int fd, void *buf, size_t count) 
{
    size_t nleft = count;
    ssize_t nread;
    char *ptr = buf;

    while (nleft > 0) {
	if ((nread = read(fd, ptr, nleft)) < 0) {
	    if (errno == EINTR)
		nread = 0;      /* and call read() again */
	    else
		return -1;      /* errno set by read() */ 
	} 
	else if (nread == 0)
	    break;              /* EOF */
	nleft -= nread;
	ptr += nread;
    }
    return (count - nleft);    /* return >= 0 */
}
/* $end readn */

/* $begin writen */
ssize_t writen(int fd, const void *buf, size_t count) 
{
    size_t nleft = count;
    ssize_t nwritten;
    const char *ptr = buf;

    while (nleft > 0) {
	if ((nwritten = write(fd, ptr, nleft)) <= 0) {
	    if (errno == EINTR)
		nwritten = 0;    /* and call write() again */
	    else
		return -1;       /* errorno set by write() */
	}
	nleft -= nwritten;
	ptr += nwritten;
    }
    return count;
}
/* $end writen */

/* $begin readline */
static ssize_t my_read(int fd, char *ptr) 
{
    static int read_cnt = 0;
    static char *read_ptr, read_buf[MAXLINE];

    if (read_cnt <= 0) {
    again:
	if ( (read_cnt = read(fd, read_buf, sizeof(read_buf))) < 0) {
	    if (errno == EINTR)
		goto again;
	    return -1;
	} 
	else if (read_cnt == 0)
	    return 0;
	read_ptr = read_buf;
    }
    read_cnt--;
    *ptr = *read_ptr++;
    return 1;
}

ssize_t readline(int fd, void *buf, size_t maxlen) 
{
    int n, rc;
    char c, *ptr = buf;

    for (n = 1; n < maxlen; n++) {  /* notice that loop starts at 1 */
	if ( (rc = my_read(fd, &c)) == 1) {
	    *ptr++ = c;
	    if (c == '\n')
		break;	        /* newline is stored, like fgets() */
	} 
	else if (rc == 0) {
	    if (n == 1)
		return 0;	/* EOF, no data read */
	    else
		break;		/* EOF, some data was read */
	} 
	else
	    return -1;	/* error, errno set by read() */
    }
    *ptr = 0;	/* null terminate like fgets() */
    return n;
}
/* $end readline */

/* 
 * readline_r: Stevens's reentrant readline package
 * (mentioned but not defined in UNP 23.5)
 */

/* $begin readline_r */
static ssize_t my_read_r(Rline *rptr, char *ptr) 
{
    if (rptr->rl_cnt <= 0) {
    again:
	rptr->rl_cnt = read(rptr->read_fd, rptr->rl_buf, 
			    sizeof(rptr->rl_buf));
	if (rptr->rl_cnt < 0) {
	    if (errno == EINTR)
		goto again;
	    else
		return(-1);
	}
	else if (rptr->rl_cnt == 0)
	    return(0);
	rptr->rl_bufptr = rptr->rl_buf;
    }
    rptr->rl_cnt--;
    *ptr = *rptr->rl_bufptr++ & 255;
    return(1);
}

ssize_t readline_r(Rline *rptr) 
{
    int n, rc;
    char c, *ptr = rptr->read_ptr;

    for (n = 1; n < rptr->read_maxlen; n++) { 
	if ( (rc = my_read_r(rptr, &c)) == 1) {
	    *ptr++ = c;
	    if (c == '\n')
		break;
	} else if (rc == 0) {
	    if (n == 1)
		return(0);	/* EOF, no data read */
	    else
		break;		/* EOF, some data was read */
	} else
	    return(-1);	/* error */
    }
    *ptr = 0;
    return(n);
}
/* $end readline_r */

/*
 * readline_rinit - initialization function for readline_r
 */
/* $begin readline_rinit */
void readline_rinit(int fd, void *ptr, size_t maxlen, Rline *rptr) 
{
    rptr->read_fd = fd;		/* save caller's arguments */
    rptr->read_ptr = ptr;
    rptr->read_maxlen = maxlen;
  
    rptr->rl_cnt = 0;		/* and init our counter & pointer */
    rptr->rl_bufptr = rptr->rl_buf;
}
/* $end readline_rinit */

/****************************************************
 * Error-handling wrappers for Stevens's I/O helpers
 ****************************************************/

ssize_t Readn(int fd, void *ptr, size_t nbytes) 
{
    ssize_t n;
  
    if ((n = readn(fd, ptr, nbytes)) < 0)
	unix_error("Readn error");
    return n;
}

void Writen(int fd, void *ptr, size_t nbytes) 
{
    if (writen(fd, ptr, nbytes) != nbytes)
	unix_error("Writen error");
}

ssize_t Readline(int fd, void *ptr, size_t maxlen) 
{
    ssize_t n;
  
    if ((n = readline(fd, ptr, maxlen)) < 0)
	unix_error("Readline error");
    return n;
}

ssize_t Readline_r(Rline *rptr) 
{
    ssize_t n;

    if ( (n = readline_r(rptr)) == -1)
	unix_error("readline_r error");
    return(n);
}

void Readline_rinit(int fd, void *ptr, size_t maxlen, Rline *rptr) 
{
    readline_rinit(fd, ptr, maxlen, rptr);
}
/* $end csapp.c */

