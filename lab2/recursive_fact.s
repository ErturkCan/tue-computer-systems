@ recursive_fact.s — recursive factorial using proper stack frames
@ Demonstrates AAPCS: save LR, use stack for local state

    .text
    .global recursive_fact

recursive_fact:
    PUSH    {R4, LR}        @ save R4 (callee-saved) and return address

    MOV     R4, R0          @ R4 = n (preserved across recursive call)

    CMP     R0, #1
    BLE     base_case       @ if n <= 1, return 1

    SUB     R0, R0, #1      @ argument for recursive call: n-1
    BL      recursive_fact  @ recursive call, result in R0
    MUL     R0, R4, R0      @ n * factorial(n-1)
    B       done

base_case:
    MOV     R0, #1

done:
    POP     {R4, PC}        @ restore R4 and return (PC = saved LR)
