# Mixing C with x86-64 Assembly

## Contents

- Calling C-Functions from Assembly Program
- Calling Assembly Functions from C-Program
- Inline Assembly
- Assemblers

<br>

### Calling C-Functions from Assembly Program
---

- **Reasons** to do so are
  - There are **tens** of standard **C** library functions that can be used for
I/O, specially while working with **floating** point numbers.
  - There are **extensive** set of functions available in the **math** library,
thus making our life **easy**.

```
    nasm -felf64 callputs.nasm
    gcc --static callputs.o -o myexe
    ./myexe
```

<br>

### Calling Assembly Functions from C-Program
---

- **Reasons** to do so are
  - You have assembly code already written that you wish to use.
  - You need to **improve** the speed of a particular function.
  - You want to manipulate SFRs or **memory-mapped I/O** devices.

```
    nasm -felf64 maxof3.nasm
    gcc -c maxof3c.c
    gcc maxof3c.o maxof3.o -o myexe
    ./myexe
```

<br>

### Inline Assembly
---

- It is also possible to include a bit of **assembly** code right inside your **C** file, called "**inline**
**assembly**”. 
- Syntax is ofcourse **compiler** dependent.

<br>

### Assemblers
---

- Every microprocessor **x86, MIPS, ARM, Sun SPARC, Motorola Power PC**, and so
on, has its own **assembly** language, and organizational structure.We are studying the assembly language of **x86-64 microprocessor**, which
can be written in two formats **Intel** and **AT&T**.
- **NASM, YASM, GAS, FASM, MASM** are different **assemblers** that can assemble
the assembly language programs written for x86 microprocessors. Each assembler
has its own way of writing the assembly program and has its own **assembler
directives**.
- Different **assemblers** generate different **object file format** (as per the processor and
OS) from the assembly source files like **ELF32, ELF64, COFF, win32** and so on
- There can be different operating systems **(Linux, Windows, OS/X)**, and the
differences may come into play when we use operating system services using their
respective system call interface. We are using System-V AMD64 ABI.
- Finally using **library** functions from your assembly programs also make the
**difference** since all **linkers** do not work the same way. We are using Linux linker
**(ld)** in this part of the course and may use **gcc** as well