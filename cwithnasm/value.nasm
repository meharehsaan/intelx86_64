; Mixing C wth Assembly
; nasm -felf64 value.nasm
; Link with C program .o file to run 

SECTION .text   
   global getval

getval:

      mov rax, 37
      ret