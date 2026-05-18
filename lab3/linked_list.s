@ linked_list.s — traverse a singly linked list and compute sum
@ Node structure: [value (4 bytes)][next pointer (4 bytes)]
@ Input:  R0 = pointer to head node (NULL = 0)
@ Output: R0 = sum of all node values

    .text
    .global list_sum

list_sum:
    MOV     R1, #0          @ sum = 0
    MOV     R2, R0          @ current = head

traverse:
    CMP     R2, #0
    BEQ     list_done       @ reached NULL, done

    LDR     R3, [R2, #0]    @ R3 = current->value
    ADD     R1, R1, R3      @ sum += value

    LDR     R2, [R2, #4]    @ current = current->next
    B       traverse

list_done:
    MOV     R0, R1
    BX      LR
