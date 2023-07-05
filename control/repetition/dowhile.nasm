; Repeition Structure

; Implentation of Dowhile loop using JL JUMP instruction

SECTION .data
    msg db "Dowhile loop is executing...", 0xa
    msglen equ $ - msg
     msg1 db "Dowhile loop got terminated", 0xa
    msglen1 equ $ - msg1

SECTION .text
    global _start
_start:

    mov rcx, 11d

_dowhile:

    dec rcx
    push rcx

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen    ; Prints 10 times
    syscall

    pop rcx
    cmp rcx, 1d
    jg _dowhile        ; Until rcx greater than 0 loop continues

    JMP _print

_exit:

    mov rax, 60
    mov rdi, 0
    syscall

_print:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msglen1   ; Prints 1 time only
    syscall

    JMP _exit