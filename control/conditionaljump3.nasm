; Conditional JUMP (Unsigned)

; JB    Jump if below than
; JBE   Jump if below or equal to

; Output

; Hurrah! AX is below then BX


SECTION .data
    msg db "Alas! I didnot got printed on console", 0xa
    msglen equ $ - msg
    msg1 db "Hurrah! AX is below then BX", 0xa
    msglen1 equ $ - msg1

SECTION .text
    global _start
_start:

mov ax, 37d        ; 37
    mov bx, 42h    ; 42 in hex's = 66
    cmp ax, bx
    jb _true       ; AX is below then BX control goes to line 46

; this code didnot get executed

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall

    xor rax, rax
    xor rbx, rbx

    mov ax, 37h    ; 37 in hex's = 55
    mov bx, 42d    ; 42 in decimal
    cmp bx, ax
    jbe _true

_exit:

    mov rax, 60
    mov rdi, 0
    syscall

_true: 

    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msglen1
    syscall

    JMP _exit       ; goes to line 42 (Unconditional jump)    
