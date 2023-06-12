
SECTION .text
   global _start   
_start:
   mov rax, 0 ; initialize counter

_loopbody:
;loop instructions comes here
   inc rax
   cmp rax, 5
   jl _loopbody

;exit gracefully
   mov rax, 60
   mov rdi, 0     
   syscall
