    mov sp, 0
    mov r1, 0
loop:
    push 1
    push 2
    push 3
    push 4
    push 5
    push 6
    push 7
    push 8
    push 9
    
    pop r1
    pop r2
    pop r3
    pop r4
    pop r5
    pop r6
    pop r7
    pop r8
    pop r9
    
    jmp loop