; Logical Instructions

; TEST Operation

; To check if AL contains a positive or negative number.
; To check if AL contains a zero, we need to test all the bits.

SECTION .text
    global _start
_start:

; To check if AL contains a positive or negative number.

    mov al, 5d
    TEST al, 80h       ; ZF = 1

    xor rax, rax

    mov al, -5d
    TEST al, 80h       ; ZF = 0

;If ZF is set to one, the number inside register is positive else negative

    xor rax, rax

; To check if AL contains a zero, we need to test all the bits.

    mov al, 10d
    TEST al, 8fh       ; ZF = 0

    xor rax, rax

    mov al, 00h
    TEST al, 8fh       ; ZF = 1 means al is 0000 0000

;exit call

    mov rax, 60
    mov rdi, 0
    syscall