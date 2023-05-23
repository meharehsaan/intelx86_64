// In assembly some FSF (Fucntion Stack Frame) exists for every function called.

// Procedure Prolog

/*
push rbp
mov rbp, rsp
sub rsp, 0x20
*/

#include <stdio.h>
#include <stdlib.h>
void func2()
{
    // some computation is done
    return;
}
long func1(long a, long b, long c, long d, long e, long f, long g, long h)
{
    func2();
    return 54;
}
int main()
{
    long rv = func1(0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48);
    return rv;
}

// Procedure epilog

/*
LEAVE --> mov rsp, rbp
          pop rbp
RET   --> pop rip
*/