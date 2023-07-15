; Getting User Input 

; Output

; What is your name? 0xMehar
; Hello Mr. 0xMehar


SECTION .data   
   msg      db  "What is your name? " 
   msglen  equ  $ - msg  
   msg1      db   "Hello Mr. "
   msg1len  equ  $ - msg1

SECTION .bss   
   name resb 10

SECTION .text   
   global main
   main:

;prompt the user to input his/her name      

      mov rax,1      
      mov rdi,1       
      mov rsi,msg      
      mov rdx,msglen      
      syscall           ;write(1,msg,len)   

;get name from user      

      mov rax,0      
      mov rdi,0       
      mov rsi,name      
      mov rdx,10      
      syscall           ;read(0,name,10) 

;display hello     

      mov rax,1      
      mov rdi,1       
      mov rsi,msg1      
      mov rdx,msg1len      
      syscall          ;write(1,msg1,len)     

;display name      

      mov rax,1      
      mov rdi,1       
      mov rsi,name      
      mov rdx,10      
      syscall          ;write(1,name,10)   

;exit

      mov rax,60      
      mov rdi,0      
      syscall          ;exit(0) 