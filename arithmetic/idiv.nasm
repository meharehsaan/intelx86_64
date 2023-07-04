; Signed Division 

; CBW extends the sign bit of AL into the AH register
; CWD extends the sign bit of AX into the DX register
; CDQ extends the sign bit of EAX into the EDX register

;if eax contains FFFFFF42h then it will extends th bits to EDX register (EDX:EAX) = FFFFFFFF FFFFFF42h

;   mov eax, FFFFFF42h   ; -65
;   CDQ                  ; EDX:EAX = FFFFFFFF FFFFFF42h

SECTION .data
    ; Nothing to write here

SECTION .text
    global _start
_start:


; 16-bit/8-bit signed division

    mov al, -48d     ; dividend (al = d0h)
    CBW              ; extend sign bit of al into ah
    mov bl, 5h        ; divisor 
    IDIV bl          ; AL = f7h or -9, AH = fdh or -3

; 32-bit/16-bit signed division

    xor rax, rax

    mov ax, -400d    ; dividend  ax = fe70h
    CWD              ; extend sign bit of ax into dx (dx=ffffh)
    mov bx, 10d      ; divisor    
    IDIV bx          ; AX = ffd8h or -40, DX = 0000h or 0

; 64-bit/32-bit signed division

    xor rax, rax

    mov eax, -1024d    ; dividend eax = ffffffd0h
    CDQ                ; extend sign bit of eax into edx (edx=ffffffffh)
    mov ebx, 24d       ; divisor 
    IDIV ebx           ; EAX = ffffffd6h or -42, EDX = fffffff0h or -16

; exit 

    mov rax, 60
    mov rdi, 0
    syscall