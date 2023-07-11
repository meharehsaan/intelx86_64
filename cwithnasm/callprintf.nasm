; Calling Printf C function in nasm
; Ignore warning of executable stack

; So calling C lib function requires gcc compilation to object file.

; Compilation
; nasm -felf64 callprintf.nasm
; gcc --static callprintf.o -o myexe
; ./myexe

SECTION .data
    str: db "The value of integer is %d.", 0xA

SECTION .text

   global main
   extern printf    ; including external printf function

main:
   mov  rdi, str
   mov  rsi, 2023
   mov  rax,  0     ; make rax 0
   call printf      ; calling C function
   mov  rax, 0
   ret