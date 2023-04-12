; NASM
; First program

SECTION .data
	msg db "Hello World", 0xA ; msg prints on console
	msglen equ $ - msg        ; msg length
	
SECTION .bss
	;nothing to write here

SECTION .text
	global _start
	_start:                   ;start address

;display the above msg on stdout
	mov rax, 1                ; 1 is the write system call number
	mov rdi, 1                ; passing first argument to reg
	mov rsi, msg              ; passing 2nd arg msg to reg
	mov edx, msglen           ; passing 3rd arg msg length
	syscall

;making exit call
	mov rax, 60 ; 60 is the exit call number
	mov rdi, 0
	syscall
