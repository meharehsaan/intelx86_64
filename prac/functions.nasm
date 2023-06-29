; function call in assembly

SECTION .data
    ;nothing

SECTION .bss 
	; nothing

SECTION .text
	global main

main:

    ;taking arguments and calling function
    mov rdi, 50
    mov rsi, -15
    mov rdx, 35
    call sumOfThree     ;function call         
    ret 

;function definition
sumOfThree:
    add rdi, rsi
    add rdi, rdx
    mov rax, rdi
    ret


