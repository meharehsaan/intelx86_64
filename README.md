# intel x86_64 assembly

is an unstructured programming language meaning it provides only extreme `basic programming` control structures.

- Basic Expression.
- R/W over memory.
- Jump Operators.

#### Tells us

- How hardware works
- Optimize program speed and size.
  - For example, use **mov al, 5** instead of **mov eax, 5** if only the lower 8 bits of eax are needed.
- Writing device drivers, `OS kernals`, Compilers and embedded systems.
- Reverse Engineering.

#### In assembly

- No procedure calls **->** argument processing is done manually.
- No loops **->** need to jump instead.
- No variable/functions scope **->** everything is global.

<br>

### Resources

---

- **Playlist ::** [Arif Butt](https://www.youtube.com/watch?v=fYHAnSoCgbk&list=PL7B2bn3G_wfCC2HDSXtMFsskasZ5fdLXz&pp=iAQB)
- **Github ::** [Arif Butt](https://github.com/arifpucit/COAL_VLecs)

<br>

## Contents

In this Repository [intelx86-64-asm](https://github.com/meharehsaan/intelx86-64)

1. `first.nasm` template
2. `Datatypes` in assembly
3. GDB `debugger`
4. `Moving` data instructions
5. `Arithemtic` instruction
6. Bitshifting `rotation` instructions
7. `Logical` instructions
8. Control `jumps`
9. `Functions` in assembly
10. Function calling `conventions`
11. Mixing `C` with `assembly`
12. Getting `input` in assembly
13. Some `practice`

### Compiler

---

I am using `NASM` compiler while others like `GASM` can also be used for assembly compilations and `ld` is the linker in assembly.

```bash
# NASM
nasm -fefl64 filename.nasm     # Compiling file
ld filename.o -o filename      # Linking
./filename                     # Executing binary
```

<br>

## Registers

---

#### General-Purpose Registers (x86)

- EAX (`Accumulator`): Used for arithmetic and logic operations. It is also the primary register for function return values.
- EBX (`Base`): Used as a base pointer for memory access and can be used for other general purposes.
- ECX (`Counter`): Often used as a loop counter or for other specialized counting tasks.
- EDX (`Data`): Used for arithmetic and logic operations. It is also used to hold the high 32-bits of 64-bit results.
- ESI (`Source Index`): Used for source data in string and memory operations.
- EDI (Destination Index): Used for destination data in string and memory operations.
- ESP (`Stack Pointer`): Points to the top of the stack, used for managing the call stack.
- EBP (`Base Pointer`): Points to the base of the current stack frame, used for accessing function parameters and local variables.

#### 64-bit Extension of General-Purpose Registers (x86_64)

- RAX, RBX, RCX, RDX, RSI, RDI: The 64-bit counterparts of their 32-bit equivalents.
- R8 - R15: Additional general-purpose registers available in x86_64 mode, providing more options for data manipulation.

#### Segment Registers (x86)

- CS (Code Segment): Holds the code segment address.
- DS (Data Segment): Holds the data segment address.
- SS (Stack Segment): Holds the stack segment address.
- ES (Extra Segment): Holds an extra data segment address.
- FS, GS: Additional segment registers available for specific purposes in some CPU architectures.

#### Flags Register (EFLAGS/RFLAGS)

- Register used for status & CPU control information out of 64 bits mostly unsed and reserved for future use.
- `Status Flags`
  - MSB
  - Overflow
  - Logic
- `Control Flags`
  - String Operations
  - Direction
- `System Flags`
  - Interrupts
  - Debugging
- Contains various status and control flags, such as carry(CF), zero(ZF), sign(SF), overflow(OF), etc. The flags register is updated automatically by certain instructions.

#### Instruction Pointer (EIP/RIP):

- Points to the next instruction to be executed in the program.

#### SSE Media Regisers

- (XMM0 to XMM7) These are `128-bit registers`, each capable of holding 16 bytes or 4 single-precision floating-point numbers or 2 double-precision floating-point numbers or 16 packed 8-bit integers or 8 packed 16-bit integers.
- XMM8 to XMM15 (Available in x86_64 mode)Additional 128-bit registers that are available only in x86_64 mode, providing more media registers for SIMD operations.

![Registers](/img/registerSet.png)

<br>

## Mnemonics

---

#### x86_64 Assembly Instructions

- mov, add, sub, syscall etc.

#### Pseudo Instructions

- DB, DW, RESB, RESW, EQU

#### Assembler Directives

- SECTION, EXTERN, GLOBAL, BITS

<br>

### SECTION .data

---

The data section is used to define `static` data variables that the program uses during its execution. It includes constants, initialized variables, and arrays.

```
SECTION .data
    myvar db 42   ; Define a byte (8-bit) variable with value 42.
    myarr dw 10, 20, 30, 40  ; Define a word (16-bit) array with values.
```

<br>

### SECTION .bss

---

The BSS (Block Started by Symbol) section is used to define `uninitialized data` variables. These variables are allocated memory, but their initial values are not specified. The BSS section is typically used for variables that will be initialized at `runtime or dynamically` during program execution.

```
SECTION .bss
    buffer resb 100   ; Reserve 100 bytes of memory for the buffer variable.
```

<br>

### SECTION .text

---

The code section is where the `actual` executable instructions of the program are placed. It contains the assembly code that performs various operations and calculations. This section typically starts with a label, followed by the code instructions.

```
SECTION .text
    global _start   ; Entry point of the program

_start:

    mov eax, 1      ; System call number for exit
    mov rdi, 0      ; Exit code 0
    syscall         ; Invoke the system call
```

## Additional Links

- [Learning C](https://github.com/meharehsaan/learning-c)
- [Operating System](https://github.com/meharehsaan/operating-system)
- [System Programming](https://github.com/meharehsaan/system-programming)
- [Socket Programming](https://github.com/meharehsaan/socketprogramming)
- [Buffer Overflow](https://github.com/meharehsaan/bufferoverflow)
- [Linux Utilities](https://github.com/meharehsaan/linux-utilities)
- [Programming Concepts](https://github.com/meharehsaan/progconcepts)
- [Resources](https://github.com/meharehsaan/resources)

---

Best Regards - [Mehar Ehsaan](https://github.com/meharehsaan)
