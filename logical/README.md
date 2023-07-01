## Logical Instructions

A brief description of Logical instructions and the rules.

![Bit manipulation](../img/bitmanipulation.png)

In these Instructions

- **Destination** operand can be a **register** and **memory**
- **Source** operand can be an **immediate value** / **register** / **memory**
- The OF and CF flags are cleared; the **SF, ZF, and PF** flags
are set according to the result. The state of the AF flag is undefined

---
<br>

### compilation

- nasm -felf64 filename.nasm
- ld filename.o -o filename
- ./filename

---
<br>

### Bitwise AND Instruction

Destination = Source & Destination

```bash
    AND dest, source
```

- **Usage** Used to clear specific bits while preserving the others. A **0** mask
bit clears the corresponding bits, while a **1** mask bit preserves the
corresponding bits.

#### Examples 

- To check whether a given number in AL register is even or odd.
- To clear the higher order bits of AX register to zero.
- To clear the sign bit of a number in AL register, leaving the other bits unchanged.
- To clear the even number of bits of a register, leaving the other bits unchanged.
- Suppose AL register contains the ASCII code of a lower case alphabet, convert it to upper case.
- Suppose AL register contain a ASCII code of a decimal digit, convert it to decimal number (atoi).

---
<br>

### Bitwise OR Instruction

Destination = Source | Destination

```bash
    OR dest, source
```

- **Usage** Used to set specific bits while preserving the others. A **1** mask
bit sets the corresponding bits, while a **0** mask bit preserves the
corresponding bits.

#### Examples 

- To set the least significant bits of a number, leaving the other bits unchanged.
- Suppose AL register contain a upper case alphabet, convert it to lower case.
- Suppose AL register contain a decimal digit, covert it to its corresponding ASCII code (itoa).

---
<br>

### Bitwise NOT Instruction

Destination =  ~Destination

```bash
    NOT dest
```

- **Usage** to perform 1’s complement.

#### Examples

- Calculate the 1s complement of a number.

---
<br>

### Bitwise XOR Instruction

Destination =  Source ^ Destination

```bash
    XOR dest, source
```

- **Usage** Used to complement specific bits, while preserving the others. A
**1** mask bit complements the corresponding bits, while a **0** mask bit
preserves the corresponding bits.

#### Examples

- To clear the entire register bits to zero, XOR the register with itself.
- To convert upper case alphabet to lower case alphabet and vice versa.

---
<br>

### Bitwise Test Instruction

operand1 & operand2

```bash
    TEST operand1, operand2
```

- **Usage** Used to test whether bit(s) in the first operand is/are having a value of 1.
- **ZF flag** is affected in this TEST instructions and tells the result of operation it returns nothing.

#### Examples

- To check if AL contains a positive or negative number.
- To check if AL contains a zero, we need to test all the bits.
- To check if AL contains an even or an odd number, we need to test the least significant bit.
- To check if AL contains ASCII code of lower or upper case alphabet.


