@ factorial.s — compute n! iteratively using ARM assembly
@ Input:  R0 = n
@ Output: R0 = n!

    .text
    .global factorial
    .global _start

_start:
    MOV     R0, #6          @ test: 6! = 720
    BL      factorial
    @ result in R0
    MOV     R7, #1          @ syscall: exit
    SWI     0

factorial:
    PUSH    {R4, LR}
    MOV     R4, R0          @ R4 = n (counter)
    MOV     R0, #1          @ R0 = accumulator (start at 1)

loop:
    CMP     R4, #1
    BLE     done            @ if counter <= 1, we're done
    MUL     R0, R4, R0      @ accumulator *= counter
    SUB     R4, R4, #1      @ counter--
    B       loop

done:
    POP     {R4, PC}
