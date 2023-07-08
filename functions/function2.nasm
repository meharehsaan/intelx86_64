; Functions (Preserving value)

SECTION .data
    msg    db  "While a people preserves its language; it preserves the marks of liberty. We preserved RCX", 0xA
    lenmsg equ $ - msg

SECTION .text
   global main
main:

    mov rcx, 37d

    push rcx
    call printmsg
    pop rcx

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