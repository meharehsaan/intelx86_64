; while loop in nasm

SECTION .data
   data db "While loop will run 10 times", 0xA
   datalen equ $ - data

SECTION .text  
   	 
   global _start   

_start:
   mov rax, 0       ; initializing reg..
   cmp rax, 10      ; comparing rax
   jge _exit        ; jump if rax greater than or equal to 10

_repeat:
                    ; loop instructions
   inc rax
   push rax         ; preserving rax value
		    ;printing data
   mov rax, 1               
   mov rdi, 1                
   mov rsi, data              
   mov edx, datalen           
   syscall

   pop rax
   cmp rax, 10      ; comparing reg..
   jl _repeat       ; jump if rax less than 10

_exit:              ; program exits

   mov rax, 60      
   mov rdi, 0      
   syscall

