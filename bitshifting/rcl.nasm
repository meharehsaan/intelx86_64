;   Bit shift intructions

;   Rotate Carry Left (RCL) Instruction

SECTION .text
    global _start
_start:

;In this MSB is removed and placed in the CF flag and 
;the value of CF is shifted in place of LSB and the 
;remaining bits are moved one position left.

    mov al, 7
    RCL al, 2        ; so al become 0x1c = 28 and CF = 0

    xor rax, rax

    mov al, -8
    RCL al, 1        ; so al become 0xf0 = -16 and CF = 1



;exit call

    mov rax, 60
    mov rdi, 0
    syscall