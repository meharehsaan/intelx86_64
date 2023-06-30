;   Shift Instructions

;   Logical shift Left (SHL)
;   Shift Arithmatic Left (SAL)      ;SHL and SAL are same

;   Number are stored in form of 2's compliment in memory


SECTION .text
    global _start
_start:

;SHL operation pushes a zero into least signidicant bit(LSB) position 
;and the most significant bit(MSB) is shifted to Carry Flag (CF)

    mov rax, 5d
    SHL rax, 2     ;shifting 2 bits so rax become 0x14 = 16

    xor rax, rax   ;to clear rax register

    mov rax, -1d
    SHL rax, 2     ;2 bits shifted so rax become 0xfffffffffffffffc = -4

;SAL same as SHL have the same opcode it's just like menomonic synonym 
;like jne and jnz

    xor rax, rax

    mov rax, 33d
    SAL rax, 1     ; 1 bit shifted so rax become 0x42 = 66

    xor rax, rax

    mov rax, -7d
    SAL rax, 3     ; 3 bits shifted so rax become 0xffffffffffffffc8 = -56


;exit call

    mov rax, 60
    mov rdi, 0
    syscall
