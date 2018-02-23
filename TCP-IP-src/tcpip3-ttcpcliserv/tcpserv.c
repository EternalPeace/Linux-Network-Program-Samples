/*
 * Copyright (c) 1996 W. Richard Stevens.  All rights reserved.
 * Permission to use or modify this software and its documentation only for
 * educational purposes and without fee is hereby granted, provided that
 * the above copyright notice appear in all copies.  The author makes no
 * representations about the suitability of this software for any purpose.
 * It is provided "as is" without express or implied warranty.
 */

#include	"cliserv.h"

int
main()					/* simple TCP server */
{
	struct sockaddr_in	serv, cli;
	char				request[REQUEST], reply[REPLY];
	int					listenfd, sockfd, n, clilen;

	if ( (listenfd = socket(PF_INET, SOCK_STREAM, 0)) < 0)
		err_sys("socket error");

	memset(&serv, 0, sizeof(serv));
	serv.sin_family      = AF_INET;
	serv.sin_addr.s_addr = htonl(INADDR_ANY);
	serv.sin_port        = htons(TCP_SERV_PORT);

	if (bind(listenfd, (SA) &serv, sizeof(serv)) < 0)
		err_sys("bind error");

	if (listen(listenfd, SOMAXCONN) < 0)
		err_sys("listen error");

	for ( ; ; ) {
		clilen = sizeof(cli);
		if ( (sockfd = accept(listenfd, (SA) &cli, &clilen)) < 0)
			err_sys("accept error");

		if ( (n = read_stream(sockfd, request, REQUEST)) < 0)
			err_sys("read error");

		/* process "n" bytes of request[] and create reply[] ... */

		if (write(sockfd, reply, REPLY) != REPLY)
			err_sys("write error");

		close(sockfd);
	}
}
