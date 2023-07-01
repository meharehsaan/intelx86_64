; Logical Instructions

; NOT Operation

; Calculate the 1s complement of a number.

SECTION .text
    global _start
_start:

    mov al, 72h   ;0111 0010
    NOT al        ; takes 1's compliment = 1000 1101

;exit call

    mov rax, 60
    mov rdi, 0
    syscall