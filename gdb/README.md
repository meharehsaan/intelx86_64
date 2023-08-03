# GDB Debugger

**Debigging** is the art and science of **finding** and **eliminating** bugs in a computer program.

The purpose of a debugger such as **GDB** is to allow you to see what is going on **inside** another program while it executes -- or what another program was doing at the moment it crashed.

### Debuggers

- GDB
- Redare2
- Strace
- Softice

### Benefits
---

- Runtime analysis of the binaries.
- Manipulating program flow.
- Disassembly.
- Reverse Engineering and Cracking bianaries.

#### Loading program in GDB

Gives a prompt of command line interface

```
    gdb exefile
```

#### Commands
---

```
    info sources     <!-- Display source files -->   
    info functions   <!-- Functions in executable -->   
    info variables   <!-- Gives global variables -->   
    objcopy strip nm
    setargs <arg1> <arg2>     <!-- Set arguments then run program -->
    run <arg1> <arg2>         <!-- Argument can also given like this -->
    list file <line#no>
    list file <func-name>
```

#### Breakpoints

Once hit then user can **modify** variables and CPU **registers** as well as **memory** addresses.

```
    info break          <!-- Show information about existing breakpoints -->
    break <line#no>
    break <func-name>
    break <memory-address>
```

After Breakpoint **run** the program 

Breakoints can be **enabled/disabled/delete/clear**
```
    enable/disable/delete/clear <breakpoint>
```

#### Watchpoints

```
    watch <var-name>
    enable/disable/delete/clear <watchpoint>
```

#### Stepping through code 

```
    continue/c/ci      <!-- continue until next breakpoint -->
    next/n/ni          <!-- next intruction not dive in function -->
    step/s/si          <!-- next instruction and dive in function -->
    finish             <!-- Continue until current function -->
```

#### Format chars

- Integer/signed **d**
- interger/unsigned **u**
- integer in hec **x**
- integer in octal **o**
- integer in binary **b**
- floating number **f**
- int, char **c**
- Address **a**
- c-string **s**

#### Display and modify variables


```
    whatis <var-name>
    print /format-char <var-name>
    set <var-name> = <value>
    info display
```

#### Convenience variables

Not part of the actual program 

```
    set $i = 5
    set $name = "some string"
    print $i
    print $name
```

Built-in and user-defined functions can be called using them.

#### Conditional break

```
    info break 
    break <line#no> if <condition>
    break 37 if ctr == 5
```

#### TUI mode 

Text user interface of gdb to use **command** window, **Source**, **Assembly** and **Register** windows all together. **PEDA** plugin can also be used.

```
    gdb -q -tui
    enable tui
    focus src/asm/regs/cmd
    c          <!-- continue program execution -->
```