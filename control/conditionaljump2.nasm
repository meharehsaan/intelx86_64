; Conditional JUMP (Unsigned)

; JA    Jump above than
; JAE   Jump above or equal to

; Output

; Means AX is not above BX Again we check comaprision.
; Hurrah! AX is above then BX this time.

SECTION .data
    msg db "Means AX is not above BX Again we check comaprision", 0xa
    msglen equ $ - msg
    msg1 db "Hurrah! AX is above then BX this time", 0xa
    msglen1 equ $ - msg1

SECTION .text
    global _start
_start:

    mov ax, 37d    ; 37
    mov bx, 42h    ; 42 in hex's = 66
    cmp ax, bx
    ja _true      ; AX is not above then BX

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall

    xor rax, rax
    xor rbx, rbx

    mov ax, 37h    ; 37 in hex's = 55
    mov bx, 42d    ; 42 in decimal
    cmp ax, bx
    jae _true      ; AX is above then BX control goes to line 46

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

    JMP _exit       ; goes to line 40 (Unconditional jump)
