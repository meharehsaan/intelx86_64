; Conditional JUMP (Signed)

; JO   Jump if overflow OF=1

SECTION .data
    msg db "Now we will set Over flow flag, when OF = 1 Jump is performed ", 0xa
    msglen equ $ - msg

SECTION .text
    global _start
_start:

    JO _exit   ; Overflow flag is not set so jump not performed

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall

    JMP _jump

_exit: 
    mov rax, 60
    mov rdi, 0
    syscall

_jump:

; Perform an ADD operation that results in an overflow

    mov eax, 2147483647d ; Largest signed 32-bit integer (0x7FFFFFFF)
    add eax, 1           ; Attempt to add 1 to the largest integer, causing an overflow

    JO _exit   ; goes to _exit Bcz OF=1