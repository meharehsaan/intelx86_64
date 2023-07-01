; Logical Instructions

; OR Operation

; To set the least significant bits of a number, leaving the other bits unchanged.
; Suppose AL register contain a upper case alphabet, convert it to lower case.

SECTION .text
    global _start
_start:

; To set the least significant bits of a number, leaving the other bits unchanged.

    mov al, 57d
    OR al, 01h      ; sets LSB

; Suppose AL register contain a upper case alphabet, convert it to lower case.
    xor rax, rax

    mov al, 90d     ; Z
    OR al, 20h      ; al become 122d or 7ah which is z

;exit call

    mov rax, 60
    mov rdi, 0
    syscall