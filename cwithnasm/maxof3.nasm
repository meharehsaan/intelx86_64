; Mixing C wth Assembly
; nasm -felf64 maxof3.nasm
; Link with C program .o file to run 

SECTION .text
   global maxofthree
   maxofthree:
        mov   rax, rdi
        cmp   rax, rsi
        cmovl rax, rsi
        cmp   rax, rdx
        cmovl rax, rdx
        ret    