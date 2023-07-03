; Arthmetic

; ADD (Addition)
; SUB (Subtraction)
; INC (Increment)
; DEC (Decrement)
; CMP (Compare)
; ADC (Add with Carry)
; SBB (Subtract with Borrow)

SECTION .data

    var1 dq 0x42
    var2 dq 0x37

SECTION .text
    global _start
_start:

; ADD/SUB with destination operand as register

    mov rax, 0x01
    ADD rax, qword [var1]       ; 0x43

    mov rax, -1d
    ADD rax, 0x05               ; 4

    mov rbx, 0x09
    SUB rax, rbx                ; rax = rax - rbx
                                ; 0xfffffffffffffffb

; ADD/SUB with destination operand as memory

    xor rax, rax
    mov rax, 0x65
                            ; always specify size when working with memory
    mov rax, qword [var1]
    ADD qword [var2], rax
    ADD qword [var2], 0x02                                

; increment and decrement

    xor rax, rax
    mov rax, 7d

    INC rax       ; 8
    DEC rax       ; 7

; negate

    xor rax, rax
    mov rax, 0x1

    neg rax        ; -1 = 0xffffffffffffffff

; compare

    xor rax, rax
    mov rax, 0x5
    mov rbx, 0x6

    CMP rax, rbx    ; set the flags according to result

; set / clear / complement CF 

    CLC        ; clears the CF
    STC        ; sets the CF
    CMC        ; Compliments the CF

; add with carry

    mov rax, 0
    STC             ; sets the CF
    ADC rax, 0x7    ; rax = rax + (7+CF) => 8
    CLC             ; clears the CF
    ADC rax, 0x2    ; 10 = 0xah

;subtract  with borrow

    mov rax, 0x10   
    SUB rax, 0x8   ; 16 - 8 = 8            ; simple subtract
    STC            ; sets the CF
    SBB rax, 0x4   ; rax - (4+CF) => 3     ; subtracts with borrow
    CLC

    xor rax, rax

; exit 

    mov rax, 60
    mov rdi, 0
    syscall