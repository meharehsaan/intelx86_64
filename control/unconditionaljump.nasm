; Unconditional JUMP 

; JMP dest
; JMP <label>

; Short JUMP :: Short jump within -128 to +127 bytes from the current instruction.
; Near JUMP  :: Near jump to any address within the current code segment.
; Far JUMP   :: Far jump to any address in the memory address space.

;<label> where control goes after JMP <label> instruction

; Output 
; Hurrah! I got printed on console

SECTION .data
    msg db "Hurrah! I got printed on console", 0xa
    msglen equ $ - msg
    msg1 db "Alas! I am not printed on console", 0xa
    msglen1 equ $ - msg1
    
SECTION .text
    global _start
_start:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall

    JMP _gotoexit ; Jumps at line 32

; this code is skipped
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msglen1
    syscall

_gotoexit:

    mov rax, 60
    mov rdi, 0
    syscall