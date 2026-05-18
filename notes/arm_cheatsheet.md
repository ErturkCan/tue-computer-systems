# ARM Assembly Cheatsheet

## Registers
| Register | Purpose |
|----------|---------|
| R0–R3 | Arguments / return values. Caller-saved. |
| R4–R11 | General purpose. **Callee-saved** — must restore if used. |
| R12 (IP) | Intra-procedure scratch. |
| R13 (SP) | Stack pointer. Always 4-byte aligned. |
| R14 (LR) | Link register — holds return address after BL. |
| R15 (PC) | Program counter. |

## AAPCS Calling Convention
- Arguments go in R0–R3 (left to right)
- Return value in R0 (64-bit in R0+R1)
- If using R4–R11 in a function, push them first and pop before returning
- Stack must be 8-byte aligned before any function call

## Common Instructions
```asm
MOV  R0, #5        @ R0 = 5
ADD  R0, R1, R2    @ R0 = R1 + R2
SUB  R0, R1, #1    @ R0 = R1 - 1
MUL  R0, R1, R2    @ R0 = R1 * R2
LDR  R0, [R1]      @ R0 = memory[R1]
STR  R0, [R1]      @ memory[R1] = R0
LDR  R0, [R1, #4]  @ R0 = memory[R1 + 4]
LDR  R0, [R1], #4  @ R0 = memory[R1]; R1 += 4 (post-index)
```

## Branches
```asm
B    label     @ unconditional jump
BL   label     @ branch and link (saves PC+4 into LR)
BX   LR        @ return from function
BEQ  label     @ branch if equal (Z flag set)
BNE  label     @ branch if not equal
BGT  label     @ branch if greater than (signed)
BLT  label     @ branch if less than (signed)
```

## Stack
```asm
PUSH {R4, R5, LR}  @ push registers, SP decrements
POP  {R4, R5, PC}  @ pop registers, PC = LR = return
```
