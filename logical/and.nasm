; Logical Instructions

; AND Operation

; To check whether a given number in AL register is even or odd.
; To clear the higher order bits of AX register to zero.
; To clear the sign bit of a number in AL register, leaving the other bits unchanged.
; To clear the even number of bits of a register, leaving the other bits unchanged.

SECTION .text
    global _start
_start:

; To check whether a given number in AL register is even or odd.
    mov al, 11d
    AND al, 01h       ; al becomes 0000 0001 means odd number

    xor rax, rax

    mov al, 10d
    AND al, 01h       ; al become 0000 0000 means even number


; To clear the higher order bits of AL register to zero.
    xor rax, rax
    
    mov al, 66
    AND al, 0fh       ; al become AND with 0000 1111 and al become 0000 0010

; To clear the sign bit of a number in AL register, leaving the other bits unchanged.
    xor rax, rax

    mov al, -5d
    AND al, 7fh       ; al become = 0111 1011

; To clear the even number of bits of a register, leaving the other bits unchanged.
    xor rax, rax

    mov al, 37d
    AND al, aah       ; clear even number bits

;exit call

    mov rax, 60
    mov rdi, 0
    syscall