default rel

section .rodata
msg: db "Hello, World!", 0	;Defines variable 'msg' as string 

section .text
global hello
hello:				;Defines the function 'hello'
    lea rax, [msg]		;Sets the variable 'msg' to the RAX register
    ret				;Returns from top of stack to last call
