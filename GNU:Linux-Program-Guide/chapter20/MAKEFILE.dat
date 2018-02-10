all:	client server web_client web_server

client:	client.c
	cc -o client client.c

server:	server.c
	cc -o server server.c

web_client:	web_client.c
	cc -o web_client web_client.c

web_server:	web_server.c
	cc -o web_server web_server.c

clean:
	rm -f client server web_client web_server

