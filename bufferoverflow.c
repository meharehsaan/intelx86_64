/*
  *  usage: ./a.out AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void f1(char* data){
	char buff[10];
 	strcpy(buff, data);
	printf("The command line received is: %s \n", buff);
}

int main(int argc, char * argv[]){
	if(argc > 1)
		f1(argv[1]);
	else
		printf("No command line received.\n");
   exit(0);
}
