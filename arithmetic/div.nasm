; Arithmetic Division


; 32 bit dividend
; mov dx, 0h     (high dividend)
; mov ax, 8005h  (low dividend)
; mov cx, 100h   (divisor)
; DIV cx  means   DX:AX / CX and Remainder is stored in DX and Quotient in AX

SECTION .data
    ; Nothing to write here

SECTION .text
    global _start
_start:

; 16-bit/8-bit division 

    mov ax, 82d ; dividend
    mov bl, 4d  ; divisor
    DIV bl      ; AL = 20h & AH = 02h

; 32-bit/16-bit division

    mov dx, 0000h     ; dividend (high)
    mov ax, 0876h     ; dividend (low)
    mov cx, 100h      ; divisor
    DIV cx            ; AX = 0008h & DX = 0076h

; 64-bit/32-bit division

    mov edx, 000003h      ; dividend (high)
    mov eax, 000075h      ; dividend (low)
    mov ecx, 1000h        ; divisor
    DIV ecx               ; EAX = 00300000h & EDX = 00000075h

; Divide over flow error

    xor rax, rax

    mov dx, 64h           ;dividend (high)
    mov ax, 0000h         ;dividend (low)
    mov cx, 10h           ;divisor
    DIV cx                ;Quotient 60000h cannot fit in AX  
; Stopped reason :: SIGFPE

; exit 

    mov rax, 60
    mov rdi, 0
    syscall