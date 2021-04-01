; Codewars, "The 'if' function": "https://www.codewars.com/kata/54147087d5c2ebe4f1000805/train/nasm"
global _if

; <-- _if(DIL value, RSI func1, RDX func2) -->
_if:
    cmp dil, 1            ; If dil == 1...
    je .when_true         ; Jump if true...
    jmp .when_false      ; Else...
    
.when_true:
    call rsi              ; Calls RSI, func1
    ret                   ; Returns _if

.when_false:
    call rdx              ; Calls RDX, func2
    ret                   ; Returns _if
; -----> endof _if <-----
