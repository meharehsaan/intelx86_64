; Stack 

; Stack works in LIFO (Last In First Out).

section .data
  var db 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x11, 0x22


SECTION .text
    global _start			
_start:

   mov rax, 0x1122334455667788
   push rax
   push var 
   push qword [var]

   pop r8           ; gets value of var pushed in above instruction    
   pop r9           ; gets address of var
   pop rbx	        ; gets value stored in rax

   push 0x42
   pop r11          ; r11 = 0x42

; exit

   mov rax, 60
   mov rdi, 0		
   syscall

