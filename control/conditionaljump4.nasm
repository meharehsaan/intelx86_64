; Conditional JUMP (Signed)

; JG    Jump if greater than
; JGE   Jump if greater or equal to

; Output

;Alas! AX is less than BX
;Hurrah! AX is now greater than BX

SECTION .data
    msg db "Alas! AX is less than BX", 0xa
    msglen equ $ - msg
    msg1 db "Hurrah! AX is now greater than BX", 0xa
    msglen1 equ $ - msg1

SECTION .text
    global _start
_start:


    mov ax, -37d    ; -37
    mov bx, -42h    ; -66
    cmp bx, ax
    jg _true        ; AX is less then BX (condition false)

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall

    xor rax, rax
    xor rbx, rbx

    mov ax, -42d    ; -42
    cmp ax, -37h
    jge _true

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

    JMP _exit       ; goes to line _exit (Unconditional jump)    
