;printing string in nasm


SECTION .data
   msg db "EHSAAN", 0xA
   len_msg equ $ - msg

SECTION .text
   global main
   main:
      mov rax, 0x123456789abcdef0
      xor rax, rax
      call printmsg     ;function call
      
; program exit instructions
      mov rax, 60
      mov rdi, 0
      syscall         
      
;printmsg function definition
printmsg:
      mov rax, 1
      mov rdi, 1 
      mov rsi, msg
      mov rdx, len_msg
      syscall                      ;prints the string 
      ret
