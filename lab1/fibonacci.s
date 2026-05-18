@ fibonacci.s — compute nth Fibonacci number iteratively
@ Input:  R0 = n
@ Output: R0 = fib(n)
@ fib(0)=0, fib(1)=1, fib(2)=1, fib(3)=2, ...

    .text
    .global fibonacci

fibonacci:
    PUSH    {R4, R5, LR}
    CMP     R0, #1
    BLE     fib_base        @ fib(0)=0, fib(1)=1 — return as-is

    MOV     R4, #0          @ prev = fib(n-2) = 0
    MOV     R5, #1          @ curr = fib(n-1) = 1
    SUB     R0, R0, #1      @ loop n-1 times

fib_loop:
    CMP     R0, #0
    BEQ     fib_done
    ADD     R4, R4, R5      @ next = prev + curr
    MOV     R3, R5          @ swap: prev = curr
    MOV     R5, R4          @ curr = next
    MOV     R4, R3
    SUB     R0, R0, #1
    B       fib_loop

fib_done:
    MOV     R0, R5
    POP     {R4, R5, PC}

fib_base:
    POP     {R4, R5, PC}    @ return n unchanged (0 or 1)
