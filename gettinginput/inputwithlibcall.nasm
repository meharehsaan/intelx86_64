; getting input using C library call

; Compilation
    ; nasm inputwithlibcall.nasm -felf64
    ; gcc --static inputwithlibcall.o -o myexe
    ; ./myexe

; Output 

;What is your name? Ehsaan
; Hello Mr. Ehsaan

SECTION .data
   formatStr1: db "What is your name? ", 0
   formatStr2: db "Hello Mr. %s", 0xA

SECTION .bss
   name: resb 50

SECTION .text

   global main
   extern printf
   extern gets

main:

;prompt the user to input his/her name
   lea  rdi, formatStr1
   sub  rsp, 8
   call printf

;get name from user
   lea  rdi, name
   call gets

;display hello message with name
   lea  rdi, formatStr2
   lea  rsi, name
   call printf
   add  rdi, 8

;exit
   mov  rax, 60
   mov  rdi, 0
   syscall