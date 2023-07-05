; Unconditional JUMP

; Output 

; Assembly is bit tricky but gives a low level view of instructions
; Video games are most popular now-a-days 

SECTION .data
    msg db "Assembly is bit tricky but gives a low level view of instructions", 0xa
    msglen equ $ - msg
    msg1 db "Video games are most popular now-a-days", 0xa
    msglen1 equ $ - msg1

SECTION .text
    global _start
_start:

    JMP _learnassembly

_videogames:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msglen1
    syscall

    JMP _exit

_learnassembly:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall

    JMP _videogames

_exit:

    mov rax, 60
    mov rdi, 0
    syscall