; Mul instruction

SECTION .data
	; nothing 

SECTION .bss 
	; nothing

SECTION .text
	global _start

_start:
; multiply the 2 registers and store the value in AX

	mov al, 0x4   ; multiplicand
	mov bl, 0x10  ; multiplier
	mul bl        ;
	

	mov rax, 1
	mov rdi, 0
	syscall    ; exits
