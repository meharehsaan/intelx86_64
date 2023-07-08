// Function calling

#include <stdio.h>
#include <stdlib.h>

void func2()
{
    // instructions
    return;
}

long func1(long a, long b, long c, long d, long e, long f, long g, long h)
{
    func2();      // FSF is created on function call
    return 54;
}

int main()
{
    long rv = func1(0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48);
    return rv;
}