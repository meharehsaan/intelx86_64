# Procedures/Functions in Assembly Language



In computer programming languages, a procedure, function, sub-routine, or method
is a **named piece of code** (set of instructions) that can be called from a **program** in
order to perform some **specific** task, thus making a program more **structural, easier to understand and manageable**.

## contents
-  Difference b/w procedure and function
-  Defining a procedure in assembly (NASM)
-  Calling/Returning from an Assembly Function
-  Use of Stack in Function Calls
   -  Stack Alignment
   -  Near vs Far procedure
-  Caller Saved vs Callee Saved Registers
-  Example 0x1 (Simple funtion/procedure call)
-  Example 0x2 (using loop instruction)
-  Example 0x3 (Preserving register value)

## Difference b/w procedure and function

- The return statement of a **procedure** returns only control to the calling program.
- The return statement of a **function** returns the control as well as the function’s result value to the calling program.

<br>

### Defining a procedure in assembly (NASM)
---

An assembly **procedure** is defined as a set of logically related instructions having a name that
- is meant to be called from different places
- can accept parameters (via registers, global memory locations, stack)
- do some processing (e.g., add numbers, print string, get input, …)
- may return some value to its caller (via register, global memory location)

```
foo:
    <instructions>
    <code>
    ...
    ...

    ret

call foo     ;x86 instruction to call functions/procedures.
```

- The agreement on how to pass **parameters** and return values, and how to share CPU registers
between **caller** and **callee** is called **calling convention**

<br>

## Calling/Returning from an Assembly Function

- To call a procedure named foo, use the x86 call instruction.
- To shift back the control of execution from a function, use the x86 ret instruction.

```
SECTION .text
    global _start
_start:

    mov rax, 1
    add rax, 2

    call foo    ; call foo function and perform two actions
                ; push rip
                ; jmp foo

foo:
    <instructions>
    ret         ; pop rip
```

<br>

### Use of Stack in Function Calls
---

#### Stack Alignment

The stack pointer rsp should be kept 16 byte aligned upon entry to a function, i.e., the hex value of rsp should end in a zero.

#### Near vs Far Procedure

If the caller and callee both lies in the same CS, the callee is a near procedure and the call instruction pushes only IP on the stack. However, for far procedure call instruction pushes both IP and CS on the stack.

<br>

### Caller Saved vs Callee Saved Registers
---

|                                                                                Scratch / Callee Owned / Caller Saved                                                                                |                                                                       Preserved / Caller Owned / Callee Saved                                                                        |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|                                            In x86_64 nine general purpose register **rax, rdi, rsi, rdx, rcx, r8, r9, r10, r11** fall in this category.                                             |                                           In x86-64, the seven general purpose registers **rbx, rbp, rsp, r12-r15** fall in this category.                                           |
|                                                     They are **callee** (foo) **owned** therfore the callee can **freely** use these registers.                                                     |                                           They are the **caller** (_start) **owned** registers therfore the callee cannot use them freely.                                           |
| They are **caller saved** (callee owned) therefore, (if the caller wants to preserve them) the caller must push them before making the function call and later pop them after the function returns. | They are **callee saved** (caller owned) therefore, (if the callee wants to use them) the callee itself must push them at the start of function and pop them at the end of function. |
|                                                                              Used for passing arguments to functions.                                                                               |                                              Used for local state of the caller that needs to preserved across further function calls.                                               |

<br>

### Example 0x1 (Simple funtion/procedure call)
---

when code executes the printmsg function call generated and before call **rip is pushed** on stack and 
then jmp to **printmsg**: label.

```
SECTION .data
    msg     db  "Awakening Darkness: Unleash the Code", 0xA
    len_msg equ $ - msg

SECTION .text
    global main
main:

    mov  rax, 0x1234567d
    xor  rax, rax
    call printmsg     ; call to function

; exit
    mov rax, 60
    mov rdi, 0
    syscall    

printmsg:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len_msg
    syscall  
    ret              ; return control back
```

<br>

### Example 0x2 (using loop instruction)

---
calling function in loop multiple times function call.

```
SECTION .data
    msg     db  "Transcending Boundaries: Unraveling the Matrix of Reality", 0xA
    len_msg equ $ - msg

SECTION .text
    global main
main:

    mov rcx, 0x10

    repeat:
        call printmsg
        loop repeat        ; repeats until rcx become zero

; exit
    mov rax, 60
    mov rdi, 0
    syscall         

printmsg:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len_msg
    syscall  
    ret
```

<br>

### Example 0x3 (Preserving register value)
---

Preserving the register value to use it after the function terminated.

```
SECTION .data
    msg     db  "Figure out why - before what", 0xA
    len_msg equ $ - msg

SECTION .text
    global main
main:

    mov rcx, 0x10

    repeat:
        push rcx         ; Caller is pushing rcx before calling the function
        call printmsg
        pop  rcx         ; Caller is popping rcx before after the function returns
        loop repeat

; exit
    mov rax, 60
    mov rdi, 0
    syscall         

printmsg:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len_msg
    syscall  
    ret
```

<br>

### Passing and Returning Values from Functions
---

A function may have **arguments/parameters**, which might be **integer/floating** point values as well as addresses pointing to data. This enable a function to operate on different data with each call. Other than parameters, most functions have a **return value** which is commonly an indicator of success or failure.

- In the 16 and 32 bit days, since there were only eight general purpose
registers, therefore, all the arguments were passed by the caller to the
callee by pushing the arguments on the stack.

<br>

| Parameter | Qword | Doubleword |
| :-------: | :---: | :--------: |
|     1     |  rdi  |    edi     |
|     2     |  rsi  |    esi     |
|     3     |  rdx  |    edx     |
|     4     |  rcx  |    ecx     |
|     5     |  r8   |    r8d     |
|     6     |  r9   |    r9d     |
|    >6     | stack |   stack    |

<br>

### Returning Value from Function
---

- The main function is called by the _start function, which contains the startup
code for the C runtime environment.
- Before calling the main function, it do some stuff other than populating the argc
and argv as per the command line arguments passed to the program.
- A function can return to its caller using the ret instruction and before that must
place the value to be returned inside the rax register.
- A function may return to the _start function using the exit call.

```
SECTION .text
    global main
main:

    mov rax, 54
    ret            ; returns 54
```

```
SECTION .text
    global main
main:

    mov rax, 60
    mov rdi, 37
    syscall          ; exits the program and return 37
```

<br>

### Passing Arguments to Function
---

```
SECTION .text
    global main
main:

    mov rdi, 50      ; Argument no 1
    mov rsi, -15     ; Argument no 2
    mov rdx, 35      ; Argument no 3
    call sumOfThree  ; function call
    ret

sumOfThree:
    <implementation>
```