%macro exit 0
	mov rax, 60
	mov rdi, 0
	syscall
%endmacro

%macro print 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

%macro input 2
	mov rax, 0
	mov rdi, 0
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

section .data
	msgInput db "What is your name? " ;Length: 19
	text1 db "One for " ;Length: 8
	text2 db ", one for me." ;Length: 13
	msgError db "One for you, one for me." ;Length: 24

section .bss
	name resb 16

section .text
	global _two_fer

_two_fer:
	print msgInput 19
	input name, 16
	;add more here
	exit
