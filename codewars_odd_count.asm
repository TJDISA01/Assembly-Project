; Returns into RAX the quantity of positive odd numbers that come before the provided (odd) number
global oddcount

oddcnt:
    ; RDI contains input, RAX will be return value
    xor rax, rax      ; Zeroes RAX
    xor rcx, rcx      ; Zeroes RCX
    xor rdx, rdx      ; Zeroes RDX
    mov rax, rdi      ; Moves RDI into RAX, dividend is RAX
    mov rcx, 2        ; Moves 2 into RCX, divisor is RCX
    div rcx           ; Divides RAX by RCX, quotient in RAX, remainder in RDX
    ret
