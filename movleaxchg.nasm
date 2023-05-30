SECTION .data
var1	db 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x11, 0x22
var2 dq 0x1122334455667788

SECTION .text

global _start

_start:        
									; mov immediate data to register 
	mov rax, 0xaaaaaaaabbbbbbbb
	mov eax, 0xaaaaaaaa
	mov rax, 0xaaaaaaaabbbbbbbb
	mov al, 0x11
	mov rax, 0xaaaaaaaabbbbbbbb
	mov ah, 0xcc
	mov rax, 0xaaaaaaaabbbbbbbb
	mov ax, 0xdddd
	 
									; mov register to register 
	mov rbp, rax
	mov r10, rbp
	mov r11d, r10d
	mov r12w, r11w	
	mov r13b, r12b
		
									; mov from memory into register 
	mov rsi, qword [var2]
	mov r14d, [var1]
	mov r15w, [var1]
	mov dil, [var1]
	
									; mov from register into memory 
	mov rax, [var2]
	mov byte [var1], ah	
	mov word [var1], ax
	mov dword [var1], eax
	mov qword [var1], rax

									; lea demo gets address of source
	lea rax, [var1]
	lea rbx, [rax] 

									; xchg  
	mov rax, 0x1234567890abcdef
	mov rbx, 0x9999999999999999
	xchg rax, rbx

									; exit call  
	mov rax, 0x3c
	mov rdi, 0		
	syscall
