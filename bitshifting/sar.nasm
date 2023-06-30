;   Bit shift intructions

;   Logical shift Right (SHR)
;   Shift Arthmatic Right (SAR)      ;SHR and SAR do 2 different things 

SECTION .text
    global _start
_start:

;SHR operation pushes a zero into MSB position 
;and the LSB is shifted to Carry Flag (CF).

    mov rax, 11
    SAR rax, 2           ;2 bits shifted so rax become 0x2 = 2 and CF = 0

    xor rax, rax

    mov rax, -6
    SAR rax, 1           ;1 bit shifted so rax become 0xfffffffffffffffd = -4 and CF = 1

;exit call

    mov rax, 60
    mov rdi, 0
    syscall