@ array_sum.s — sum an array of 32-bit integers
@ Input:  R0 = pointer to array, R1 = length
@ Output: R0 = sum

    .text
    .global array_sum

array_sum:
    MOV     R2, #0          @ accumulator = 0

sum_loop:
    CMP     R1, #0
    BEQ     sum_done
    LDR     R3, [R0], #4    @ load element and advance pointer by 4 bytes
    ADD     R2, R2, R3
    SUB     R1, R1, #1
    B       sum_loop

sum_done:
    MOV     R0, R2
    BX      LR
