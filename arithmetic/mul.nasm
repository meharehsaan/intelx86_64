; Arithmetic muliplication

; When CF and OF are set it means the result is extended to the upper register

SECTION .data

    var1 db 0x42
    var2 dw 0x4237
    var3 dq 0x423789

SECTION .text
    global _start
_start:

; 8 bit multiplication with register multiplier

    mov al, 99h     ; multiplicand
    mov bl, 15h     ; multiplier
    mul bl          ; AX = 0c8dh CF=OF=1

; 16-bit multiplication with multiplier in register

    mov ax, 627h   ; multiplicand
    mov bx, 112h   ; multiplier
    mul bx         ; DX:AX = 0006 95beh  CF=OF=1

; 32-bit multiplication with multiplier in register
; Result become in EAX not entended to EDX

    mov eax, 5454h    ; multiplicand
    mov ebx, 10000h   ; multiplier
    mul ebx           ; EDX:EAX = 00000000 54540000h CF=OF=0
 
    xor rax,rax

; 8-bit multiplication with multiplier in variable

   mov al, 34h         ; multiplicand
   mul byte[var1]      ; AX = 0d68h CF=OF=1

; 16-bit multiplication with multiplier in variable

   mov ax, 647h        ; multiplicand
   mul word[var2]      ; DX:AX = 019f a741h CF=OF=1

; 32-bit multiplication with multiplier in variable

   mov eax, 545454h     ; multiplicand
   mul dword[var3]      ; EDX:EAX = 000015d0 8e72cfh CF=OF=1

; exit call 

    mov rax, 60
    mov rdi, 0
    syscall