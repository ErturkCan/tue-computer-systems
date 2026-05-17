# tue-computer-systems

ARM assembly, memory management, and systems programming assignments from TU/e BSc Computer Science & Engineering (Year 1).

Course: **2IC30 Computer Systems** — Eindhoven University of Technology

---

## What this is

Lab work and assignments from the Computer Systems course at TU/e. The course covers processor architecture, instruction sets, memory hierarchy, and systems-level programming in ARM assembly and C.

Posted here as a record of work and for anyone learning low-level programming. Not a solution set — the implementations reflect my own understanding and approach.

---

## Contents

### Lab 1 — ARM Assembly Basics (`lab1/`)
Introduction to the ARMv7 instruction set. Register operations, branching, loops.

```asm
@ Compute sum of array using ARM assembly
sum_array:
    MOV   R2, #0          @ accumulator = 0
loop:
    CMP   R1, #0          @ if length == 0, done
    BEQ   done
    LDR   R3, [R0], #4    @ load element, advance pointer
    ADD   R2, R2, R3      @ accumulator += element
    SUB   R1, R1, #1      @ length--
    B     loop
done:
    MOV   R0, R2          @ return accumulator
    BX    LR
```

**Assignments:** Factorial, Fibonacci, array sum, string reversal in pure ARM assembly.

---

### Lab 2 — Control Flow & Stack (`lab2/`)
Subroutine calls, AAPCS calling convention, stack frame management.

**Assignments:** Recursive factorial via subroutine calls, stack-allocated local variables, nested function calls.

---

### Lab 3 — Memory & Pointers (`lab3/`)
Memory addressing modes, pointer arithmetic in assembly, C and assembly interop.

**Assignments:** Linked list traversal in ARM assembly, pointer-based string manipulation, C function calling into assembly.

---

### Lab 4 — Memory Hierarchy & Cache (`lab4/`)
Cache behavior analysis, memory access patterns, performance implications.

**Assignments:** Matrix multiplication with cache-aware vs naive traversal, measuring cache miss rates, analyzing access patterns.

---

### Lab 5 — Processes & System Calls (`lab5/`)
Linux system calls from C, process management basics.

**Assignments:** File I/O via system calls (no stdlib), fork/exec basics, signal handling.

---

## Key concepts covered

- ARMv7 instruction set (data processing, memory, control flow, SIMD basics)
- AAPCS calling convention (register preservation, stack discipline)
- Memory addressing modes (immediate, register offset, pre/post-increment)
- Cache locality and its performance implications
- C/Assembly interoperability
- Linux system calls at the ABI level

---

## Setup (running ARM assembly on x86 Linux)

```bash
# Install QEMU + ARM GCC toolchain
sudo apt-get install qemu-user gcc-arm-linux-gnueabi

# Assemble and link
arm-linux-gnueabi-as lab1/factorial.s -o factorial.o
arm-linux-gnueabi-ld factorial.o -o factorial

# Run via QEMU
qemu-arm ./factorial
```

Or use the provided Makefile:

```bash
cd lab1/
make
make run
```

---

## Project Structure

```
tue-computer-systems/
├── lab1/
│   ├── factorial.s         # Recursive factorial in ARM assembly
│   ├── fibonacci.s         # Fibonacci sequence
│   ├── array_sum.s         # Array sum
│   └── Makefile
├── lab2/
│   ├── subroutines.s       # AAPCS calling convention examples
│   ├── recursive_fact.s    # Recursive factorial via stack
│   └── Makefile
├── lab3/
│   ├── linked_list.s       # Linked list traversal
│   ├── string_ops.s        # Pointer-based string operations
│   └── Makefile
├── lab4/
│   ├── matrix_naive.c      # Cache-unfriendly matrix multiply
│   ├── matrix_cached.c     # Cache-friendly version
│   └── benchmark.sh        # Performance comparison
├── lab5/
│   ├── file_io.c           # File I/O via syscalls
│   └── process_basics.c    # Fork/exec/wait
├── notes/
│   └── arm_cheatsheet.md   # Personal ARM instruction reference
└── README.md
```

---

## Notes

This is Year 1 coursework. It's not production code — it's learning material. The value is in showing that I can reason at the assembly level, not that the code is optimal.

For TU/e students: write your own implementations. Looking at mine for reference is fine; copying is not.

---

## License

MIT
