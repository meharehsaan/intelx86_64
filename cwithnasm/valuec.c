#include <stdio.h>
#include <stdlib.h>

/* 
C program that calls assembly function

Compilation 
    gcc -c maxof3c.c
    gcc cvalue.o value.o -o myexe
    ./myexe

Output
    The value returned by Assembly value function = 37 
*/


extern int getval();      //external assembly function declaration     

int main(){ 
   int rv = getval();
   printf("The value returned by Assembly value function = %d \n", rv);
   return 0;
}