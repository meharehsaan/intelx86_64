; Endians

; In big endian, the most significant byte of a multi-byte data item is stored at the lowest memory address (the first byte).
; In little endian, the least significant byte of a multi-byte data item is stored at the lowest memory address (the first byte).

SECTION .data
	
	var1: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88
	var2: db 0x88, 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11

SECTION .text
    global _start

_start:

	mov rax, [var1]
	mov rbx, [var2] 

;exit call

	mov rax, 60 
	mov rdi, 0
	syscall
