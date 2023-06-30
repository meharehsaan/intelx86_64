;   Bit shift intructions

;   Rotate Right (ROR) Instruction

SECTION .text
    global _start
_start:

;The LSB is placed in the CF and also pushed in place
;of MSB and remaining bits moved one position right.

    mov al, 33
    ROR al, 1         ;rax become 0x90 = 128+16 and CF = 1

    xor rax, rax

    mov al, -12
    ROR al, 2         ;rax become 0x3d = -5 and CF = 0



;exit call

    mov rax, 60
    mov rdi, 0
    syscall