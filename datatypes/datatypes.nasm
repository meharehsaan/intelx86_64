; Datatypes 

SECTION .data

    msg db "Assembly is bit tricky", 0xa   ; string
    lenmsg equ $ - msg                     ; calculates msg length
    EXIT_STATUS equ 0                      ; constant EXIT_STATUS

    var1 db 10          ; byte variable
    var2 db 0x54        ; byte variable
    var3 db "E"         ; char variable 
    var4 db "Ehsaan"    ; String variable
    var5 dw 0x1234      ; 2 bytes variable (16 bit)
    var6 dd 0x12345678  ; 4 bytes variable (32 bit)
    var7 dq 0x123456789abcdef  ;8 bytes variable (64 bit)

    Arr1 db 0x3a,0xbb,0x43 ; Array of 3 bytes
    Arr2 dd 10, 20, 30     ; Array of 32 bits (4 bytes)

    float1 dd 3.14159    ; IEEE 754 single precision
    float2 dt 3.14159    ; IEEE 754 diuble precision
    float3 do 3.14159    ; IEEE 754 quad precision

    repeat_buffer times 128 db 0x42    ; 128 bit buffer with each byte set to 0x42

SECTION .bss

    bArr resb 12    ; reserve 12 bytes
    wArr resw 5     ; reserve 5 words
    dArr resd 1     ; reserve 1 double word
    qArr resq 10    ; reserve 10 quad words
    tArr rest 5     ; reserve 50 bytes

SECTION .text
    global _start
_start:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, lenmsg
    syscall

    xor rax,rax

; exit call
    mov rax, 60
    mov rdi, EXIT_STATUS
    syscall
