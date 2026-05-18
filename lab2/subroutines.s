@ subroutines.s — AAPCS calling convention examples
@ Demonstrates proper register saving, stack discipline, nested calls

    .text
    .global add_three, max_of_three

@ add_three(a, b, c) → a + b + c
@ R0=a, R1=b, R2=c, returns in R0
add_three:
    ADD     R0, R0, R1
    ADD     R0, R0, R2
    BX      LR

@ max_of_three(a, b, c) → largest value
@ R0=a, R1=b, R2=c, returns in R0
max_of_three:
    CMP     R0, R1
    MOVLT   R0, R1          @ R0 = max(a, b)
    CMP     R0, R2
    MOVLT   R0, R2          @ R0 = max(max(a,b), c)
    BX      LR
