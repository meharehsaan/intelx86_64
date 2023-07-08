; Calling External Functions placed in some other file
; Multiple file function calling

SECTION .text   
   global main
   extern sum           ; 2 external functions
   extern print
main:

   mov rdi, 150
   mov rsi, 41
   mov rdx, 11
   call sum             ; calling external functons

   mov rdi, rax
   call print           ; prints 202 rax

   ret
