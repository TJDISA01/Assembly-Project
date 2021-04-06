SECTION .text
global double_integer

double_integer:
  xor rax, rax       ; Zeroes RAX
  mov rax, 2         ; Moves 2 into RAX, the double for multiplication
  mul rdi            ; Multiplies RAX by RDI, product located in RAX
  ret
