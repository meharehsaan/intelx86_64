; Functions Calling

SECTION .data
    msg    db  "Before going to sleep every night, forgive everyone and sleep with a clean heart.", 0xA
    lenmsg equ $ - msg

SECTION .text
   global main
main:

    call printmsg

; exit
    mov rax, 60
    mov rdi, 0
    syscall         

printmsg:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, lenmsg
    syscall  
    ret