#include <stdio.h>
#include <stdlib.h>

/* 
C program that calls assembly function

Compilation 
    gcc -c maxof3c.c
    gcc maxof3c.o maxof3.o -o myexe
    ./myexe

Output 
    maxofthree(15,-23,7) = 15
    maxofthree(10,5,24) = 24
    maxofthree(-19,-138,-10) = -10

*/
extern long maxofthree(long, long, long);    //declaring external assembly function

int main() {
    printf("maxofthree(15,-23,7) = %ld\n", maxofthree(15, -23, 7));
    printf("maxofthree(10,5,24) = %ld\n", maxofthree(10, 5, 24));
    printf("maxofthree(-19,-138,-10) = %ld\n", maxofthree(-19, -138, -10));
    return 0;
}