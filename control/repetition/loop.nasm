; Repeition Structure

; Implentation of Loop using loop instruction

SECTION .data
    msg db "Loop instruction implenting loop...", 0xa
    msglen equ $ - msg

SECTION .text
    global _start
_start:

    mov rcx, 20

_looplabel:

    push rcx           ; Preserving the ecx value by pushing it on stack

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen    ; Prints 20 times
    syscall

    pop rcx            ; popping the value

    Loop _looplabel

;exit 

    mov rax, 60
    mov rdi, 0
    syscall