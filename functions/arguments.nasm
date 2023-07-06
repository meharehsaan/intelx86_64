SECTION .text
    global main
main:

    mov rdi, 50      ; Argument no 1
    mov rsi, -15     ; Argument no 2
    mov rdx, 35      ; Argument no 3
    call sumOfThree  ; function call
    ret

sumOfThree:
    add rdi, rsi
    add rdi, rdx
    mov rax, rdi
    ret              ; returns rax value which is 70