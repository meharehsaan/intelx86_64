; Conditional JUMP (Unsigned)

; JE    Jump if equal
; JNE   Jump if not equal

; Output 
; Hurrah! AX and BX are equal both contain 10.
; Alas! AX and BX are not equal AX contains 66 and BX conatins 42.

SECTION .data
    msg db "Hurrah! AX and BX are equal both contain 10", 0xa
    msglen equ $ - msg
    msg1 db "Alas! AX and BX are not equal AX contains 66 and BX conatins 42", 0xa
    msglen1 equ $ - msg1

SECTION .text
    global _start
_start:

    mov ax, 10d    ; 10
    mov bx, 0xa    ; 10
    cmp ax, bx     
    je _true       ; goes to line 35

_false:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msglen1
    syscall          ; Alas! AX and BX are not equal AX contains 66 and BX conatins 42

    JMP _exit        ; goes to line 53  (unconditional jump)

_true:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall           ; Hurrah! AX and BX are equal both contain 10

    xor rax, rax
    xor rbx, rbx

    mov ax, 42h   ; 0x42 = 66
    mov bx, 42d   ; 42
    cmp ax, bx
    jne _false    ; goes to line 25 

_exit:

    mov rax, 60
    mov rdi, 0
    syscall