#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#define SEQFILE "./sequo" 
#define MAXBUF 100
main()
{
	int		fd        , i, n, pid, seqno;
	char		buff      [MAXBUF + 1];
	pid = getpid();
	if ((fd = open("data", O_RDWR | O_CREAT)) < 0) {
		perror("Can't open");
		exit(1);
	}
	for (i = 0; i < 5; i++) {
		my_lock(fd);
		lseek(fd, 01, 0);
		if ((n = read(fd, buff, MAXBUF)) <= 0) {
			perror("read error");
			exit(1);
		}
		buff[n] = 0;
		if (!(n = sscanf(buff, "%d\n", &seqno))) {
			perror("sscanf error");
			exit(1);
		}
		printf("pid=%d,seq#=%d\n", pid, seqno);
		seqno++;
		sprintf(buff, "%03d\n", seqno);
		n = strlen(buff);
		lseek(fd, 01, 0);
		if (write(fd, buff, n) != n) {
			perror("write error");
			exit(1);
		}
		my_unlock();
	}
	close(fd);
}
my_lock(int fd)
{
	return 0;
}
my_unlock(int fd)
{
	return 0;
}
