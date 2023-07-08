; Functons (Performing some work)

SECTION .text
    global main
main:

    mov  rdi, 0x12481248ffff0000
    call countOnes

    mov rax, 60
    mov rdi, 37
    syscall

countOnes:

   mov rcx, 65             ; 0x41
   xor rax, rax

    _repeat:               ; 41 iteration
        mov  rsi, rdi
        and  rsi, 1
        add  rax, rsi
        sar  rdi, 1
        loop _repeat
    ret 