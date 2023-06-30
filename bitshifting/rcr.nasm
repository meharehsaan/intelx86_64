;   Bit shift intructions

;   Rotate Carry Right (RCR) Instruction

SECTION .text
    global _start
_start:

;In this operation LSB is placed in the CF flag and 
;previous value of CF is shifted in position of MSB.

    mov al, 9
    RCR al, 3         ; so al become 0x42 = 65 and CF = 0

    xor rax, rax

    mov al, -8
    RCR al, 1        ; so al become = -4 and CF = 0



;exit call

    mov rax, 60
    mov rdi, 0
    syscall