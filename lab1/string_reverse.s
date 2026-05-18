@ string_reverse.s — reverse a null-terminated string in place
@ Input:  R0 = pointer to string
@ Modifies string in place, returns nothing

    .text
    .global string_reverse

string_reverse:
    PUSH    {R4, R5, R6, LR}

    @ Find end of string
    MOV     R1, R0
find_end:
    LDRB    R2, [R1]
    CMP     R2, #0
    BEQ     found_end
    ADD     R1, R1, #1
    B       find_end

found_end:
    SUB     R1, R1, #1      @ R1 now points to last character

swap_loop:
    CMP     R0, R1
    BGE     reverse_done    @ left pointer crossed right pointer

    LDRB    R4, [R0]        @ load char from left
    LDRB    R5, [R1]        @ load char from right
    STRB    R5, [R0]        @ store right char at left
    STRB    R4, [R1]        @ store left char at right
    ADD     R0, R0, #1
    SUB     R1, R1, #1
    B       swap_loop

reverse_done:
    POP     {R4, R5, R6, PC}
