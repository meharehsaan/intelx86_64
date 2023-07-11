; Calling Printf C function in nasm
; Ignore warning of executable stack

; So calling C lib function requires gcc compilation to object file.

; Compilation
; nasm -felf64 callputs.nasm
; gcc --static callputs.o -o myexe
; ./myexe

SECTION .data
    msg: db "You’re braver than you believe, stronger than you seem, and smarter than you think."  ; no need for end

SECTION .text

   global main
   extern puts       ; including functions
   extern exit

main:

    lea  rdi, msg   ; getting address of msg
    call puts       ; call to puts function
    mov  rdi, rax
    call exit       ; exit call