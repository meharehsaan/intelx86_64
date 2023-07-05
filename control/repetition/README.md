## Repetition Structure

<br>

### Implentation
---

- Loops can be implemented in many ways 2 are given below
  - using jump instructions
  - using loop instructions

<br>

- Sometimes we have to **save** a register value which can be **overwritten** by some system instruction while execution of the program so we take help from **stack** by using two instructions. If we have to save value of rcx then.
  - **push rcx**
  - **pop rcx**

### Loop
---

```
    Loop \<label>
```

- Repetition Structure using **JCC** Instructions

- **Remember to preserve the
value of loop counter inside the
body of loop, as it may change
during a system/library/procedure
call**.

- Performs a loop operation using the
**RCX, ECX or CX** register as a counter.

- Each time the LOOP instruction is
executed, the count register is
automatically decremented by one.

- If the counter register rcx is not zero, a
short jump (-128 to 127 from current rip
value) is performed to the label.

- The loop is terminated when the value of
counter register becomes equal to zero,
and program execution continues with
the instruction following the LOOP
instruction.

- Other variations are loope and loopne.

```
SECTION .text
    global start
_start:

    mov rcx, 5 ;initialize counter

_loopbody:
    ; loop instructions

    loop _loopbody

; exit

    mov rax, 60
    mov rdi, 0
    syscall
```


### While loop example 

```
SECTION .data
   data db "While loop will run 10 times", 0xA
   datalen equ $ - data

SECTION .text  
   global _start   
_start:

   mov rax, 0       ; initializing reg..
   cmp rax, 10      ; comparing rax
   jge _exit        ; jump if rax greater than or equal to 10

_repeat:
                    ; loop instructions
   inc rax
   push rax         ; preserving rax value

   mov rax, 1               
   mov rdi, 1                
   mov rsi, data              
   mov edx, datalen           
   syscall

   pop rax

   cmp rax, 10      ; comparing reg..
   jl _repeat       ; jump if rax less than 10

_exit:              ; program exits

   mov rax, 60      
   mov rdi, 0      
   syscall
```