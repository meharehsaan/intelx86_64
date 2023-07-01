; Logical Instructions

; XOR Operation
; In XOR operation if different then 1 else 0
; means 1    or    1    = 0
;       1    or    0    = 1

; To clear the entire register bits to zero, XOR the register with itself.
; To convert upper case alphabet to lower case alphabet and vice versa.

SECTION .text
    global _start
_start:

; To clear the entire register bits to zero, XOR the register with itself.

    mov al, 37h
    xor al, al       ; al become 0000 0000

; To convert upper case alphabet to lower case alphabet and vice versa.

    mov al, 65d     ; A
    XOR al, 20h     ; a

;exit call

    mov rax, 60
    mov rdi, 0
    syscall