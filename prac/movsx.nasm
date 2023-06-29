SECTION .data
	var dd 0x10
	var1 dq 0x20

SECTION .text
	global _start
_start:
	movsx rax, dword [var]
	;movsx rax, qword [var1]
	;movsx dword [var], al
	
	mov rax, 60
	mov rdi, 54
	syscall
