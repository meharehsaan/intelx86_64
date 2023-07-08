// Buffer Overflow using cmd Arguments
// cmd line argument =  AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
// it over writes the rip in stack

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void f1(char *data)
{
    char buff[10];
    strcpy(buff, data);
    printf("The Argument received is: %s \n", buff);
}

int main(int argc, char *argv[])
{
    if (argc > 1)
        f1(argv[1]);
    else
        printf("Please give at least one command line Argument.\n");
    exit(0);
}