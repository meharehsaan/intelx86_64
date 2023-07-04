; Signed Multiplication 

; When product extends to the higher register CF = OF = 1

SECTION .data
    ; Nothing to write here

SECTION .text
    global _start
_start:

; IMUL using single operand

; 8-bit multiplication

    mov al, -4d       ; 0xfc
    mov bl, 64h
    IMUL bl           ; AX = 0xfe70  & CF = OF = 1

    xor rax, rax

; 16-bit multiplication

    mov ax, -5d          ; 0xfffb
    mov bx, 10d
    IMUL bx              ; DX:AX = ffff ffce  & CF = OF = 0 

    xor rax, rax

; 32-bit multiplication

    mov eax, 375647d
    mov ebx, -427d
    IMUL ebx              ; EDX:EAX =  ffffffff f670788b  & CF = OF = 0

; IMUL using 2 operands

    xor r8, r8
    xor r9, r9

    mov r8, 3456789d
    mov r9, -537d
    IMUL r9, r8   ; r9 = r9 * r8  ; r9 = ffffffff 915b2cf3  & CF = OF = 0 

; IMUL using 3 operands 

    xor r8, r8
    xor r9, r9

    mov r8, 38475342d
    IMUL r9, r8, -34567d     ; r9 = r8 * 34567d    ; r9 = fffffeca 572f41de  & CF = OF =  0

; exit 

    mov rax, 60
    mov rdi, 0
    syscall