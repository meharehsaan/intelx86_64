;   Bit shift intructions

;   Rotate Left (ROL) Instruction

SECTION .text
    global _start
_start:

;The MSB is placed in the CF and also pushed in the LSB.
;Remaining bits moved towards the left.

    mov rax, 33
    ROL rax, 1         ;rax become 0x42 = 66 and CF = 0

    xor rax, rax

    mov rax, -12
    ROL rax, 2         ;rax become 0xffffffffffffffd3 = -48 and CF = 1


;exit call

    mov rax, 60
    mov rdi, 0
    syscall