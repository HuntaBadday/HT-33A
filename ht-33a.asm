#subruledef reg {
    r1 => 1`4
    r2 => 2`4
    r3 => 3`4
    r4 => 4`4
    r5 => 5`4
    r6 => 6`4
    r7 => 7`4
    r8 => 8`4
    r9 => 9`4
    r10 => 10`4
    r11 => 11`4
    r12 => 12`4
    r13 => 13`4
    r14 => 14`4
    r15 => 15`4
    
    sp => 14`4
    st => 15`4
}

#ruledef {
    ; 0b00 @ 0b000000 @ 0b0000 @ 0b0000
    nop => 0x0000
    jmp {op1: reg} => 0b00000001 @ op1 @ 0b0000
    jmp {addr: u16} => 0b1000000100000000 @ addr
    
    mov {op1: reg}, {op2: reg} => 0b00000010 @ op1 @ op2
    mov {op1: reg}, {data: i16} => 0b10000010 @ op1 @ 0b0000 @ data
    
    mov {op1: reg}, [{op2: reg}] => 0b00000011 @ op1 @ op2
    mov {op1: reg}, [{addr: u16}] => 0b10000011 @ op1 @ 0b0000 @ addr
    
    mov [{op1: reg}], {op2: reg} => 0b00000100 @ op2 @ op1
    mov [{op1: reg}], {data: u16} => 0b10000100 @ 0b0000 @ op1 @ data
    mov [{addr: u16}], {op2: reg} => 0b10000100 @ op2 @ 0b0000 @ addr
    
    push {op1: reg} => 0b00 @ 0b000110 @ op1 @ 0b0000
    push {data: i16} => 0b10 @ 0b000110 @ 0b0000 @ 0b0000 @ data
    
    pop {op1: reg} => 0b00 @ 0b000111 @ op1 @ 0b0000
    
    jsr {op1: reg} => 0b00 @ 0b001000 @ op1 @ 0b0000
    jsr {addr: u16} => 0b10 @ 0b001000 @ 0b0000 @ 0b0000 @ addr
    
    hlt => 0b00 @ 0b001111 @ 0b0000 @ 0b0000
    
    ; ================
    
    add {op1: reg}, {op2: reg} => 0b00 @ 0b010000 @ op1 @ op2
    add {op1: reg}, {data: i16} => 0b10 @ 0b010000 @ op1 @ 0b0000 @ data
    add {data: i16}, {op2: reg} => 0b10 @ 0b010000 @ 0b0000 @ op2 @ data
    
    adc {op1: reg}, {op2: reg} => 0b00 @ 0b010001 @ op1 @ op2
    adc {op1: reg}, {data: i16} => 0b10 @ 0b010001 @ op1 @ 0b0000 @ data
    adc {data: i16}, {op2: reg} => 0b10 @ 0b010001 @ 0b0000 @ op2 @ data
    
    sub {op1: reg}, {op2: reg} => 0b00 @ 0b010010 @ op1 @ op2
    sub {op1: reg}, {data: i16} => 0b10 @ 0b010010 @ op1 @ 0b0000 @ data
    sub {data: i16}, {op2: reg} => 0b10 @ 0b010010 @ 0b0000 @ op2 @ data
    
    sbc {op1: reg}, {op2: reg} => 0b00 @ 0b010011 @ op1 @ op2
    sbc {op1: reg}, {data: i16} => 0b10 @ 0b010011 @ op1 @ 0b0000 @ data
    sbc {data: i16}, {op2: reg} => 0b10 @ 0b010011 @ 0b0000 @ op2 @ data
    
    shl {op1: reg} => 0b00 @ 0b010100 @ op1 @ 0b0000
    
    rol {op1: reg} => 0b00 @ 0b010101 @ op1 @ 0b0000
    
    shr {op1: reg} => 0b00 @ 0b010110 @ op1 @ 0b0000
    
    ror {op1: reg} => 0b00 @ 0b010111 @ op1 @ 0b0000
    
    and {op1: reg}, {op2: reg} => 0b00 @ 0b011000 @ op1 @ op2
    and {op1: reg}, {data: i16} => 0b10 @ 0b011000 @ op1 @ 0b0000 @ data
    and {data: i16}, {op2: reg} => 0b10 @ 0b011000 @ 0b0000 @ op2 @ data
    
    or {op1: reg}, {op2: reg} => 0b00 @ 0b011001 @ op1 @ op2
    or {op1: reg}, {data: i16} => 0b10 @ 0b011001 @ op1 @ 0b0000 @ data
    or {data: i16}, {op2: reg} => 0b10 @ 0b011001 @ 0b0000 @ op2 @ data
    
    xor {op1: reg}, {op2: reg} => 0b00 @ 0b011010 @ op1 @ op2
    xor {op1: reg}, {data: i16} => 0b10 @ 0b011010 @ op1 @ 0b0000 @ data
    xor {data: i16}, {op2: reg} => 0b10 @ 0b011010 @ 0b0000 @ op2 @ data
    
    not {op1: reg} => 0b00 @ 0b011011 @ op1 @ 0b0000
    
    sec => 0b00 @ 0b011110 @ 0b0000 @ 0b0000
    clc => 0b00 @ 0b011111 @ 0b0000 @ 0b0000
    
    if {op1: reg}, {op2: reg} => 0b00 @ 0b100000 @ op1 @ op2
    if {op1: reg}, {data: i16} => 0b10 @ 0b100000 @ op1 @ 0b0000 @ data
    if {data: i16}, {op2: reg} => 0b10 @ 0b100000 @ 0b0000 @ op2 @ data
    
    ifn {op1: reg}, {op2: reg} => 0b00 @ 0b100001 @ op1 @ op2
    ifn {op1: reg}, {data: i16} => 0b10 @ 0b100001 @ op1 @ 0b0000 @ data
    ifn {data: i16}, {op2: reg} => 0b10 @ 0b100001 @ 0b0000 @ op2 @ data
    
    beq {op1: reg} => 0b00 @ 0b100010 @ op1 @ 0b0000
    beq {addr: u16} => 0b10 @ 0b100010 @ 0b0000 @ 0b0000 @ addr
    
    bne {op1: reg} => 0b00 @ 0b100011 @ op1 @ 0b0000
    bne {addr: u16} => 0b10 @ 0b100011 @ 0b0000 @ 0b0000 @ addr
    
    bcs {op1: reg} => 0b00 @ 0b100100 @ op1 @ 0b0000
    bcs {addr: u16} => 0b10 @ 0b100100 @ 0b0000 @ 0b0000 @ addr
    
    bcc {op1: reg} => 0b00 @ 0b100101 @ op1 @ 0b0000
    bcc {addr: u16} => 0b10 @ 0b100101 @ 0b0000 @ 0b0000 @ addr
    
    bmi {op1: reg} => 0b00 @ 0b100110 @ op1 @ 0b0000
    bmi {addr: u16} => 0b10 @ 0b100110 @ 0b0000 @ 0b0000 @ addr
    
    bpl {op1: reg} => 0b00 @ 0b100111 @ op1 @ 0b0000
    bpl {addr: u16} => 0b10 @ 0b100111 @ 0b0000 @ 0b0000 @ addr
}

#ruledef {
    cmp {op1: reg}, {op2: reg} => 0b01 @ 0b010010 @ op1 @ op2
    cmp {op1: reg}, {data: i16} => 0b11 @ 0b010010 @ op1 @ 0b0000 @ data
    cmp {data: i16}, {op2: reg} => 0b11 @ 0b010010 @ 0b0000 @ op2 @ data
    
    bit {op1: reg}, {op2: reg} => 0b01 @ 0b011000 @ op1 @ op2
    bit {op1: reg}, {data: i16} => 0b11 @ 0b011000 @ op1 @ 0b0000 @ data
    bit {data: i16}, {op2: reg} => 0b11 @ 0b011000 @ 0b0000 @ op2 @ data
}

#bits 16
