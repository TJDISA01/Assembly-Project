;Hello, World! by Taylor DiSalvo
;Performed with episodes 1 & 2 of a tutorial playlist
;Located here: www.youtube.com/playlist?list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn

;The '.data' section is a built-in region where variables are to be defined
section .data
	;Variable name is 'text' containing the string "Hello, World!"
	;'db' means to 'define bytes' and the '0' simply ends the string with no additional characters
	text db "Hello, World!",0

;The '.text' section is the built-in region where code is to be placed
section .text
	;Defines the label '_start', like creating a function in other languages
	global _start

;This section contains all of the code for the label '_start'
_start:
	;Sets RAX register to 1, gives the 'syscall' have an ID of 1, sys_write
	mov rax, 1
	;Sets RDI register to 1, "Standard Output"
	mov rdi, 1
	;Sets RSI register to string in 'text' variable
	mov rsi, text
	;Sets RDX register to 14, length of string
	mov rdx, 14
	;System call, writing an output of 'text'
	syscall

	;Sets RAX register to 1, gives the 'syscall' have an ID of 1, 'sys_exit'
	mov rax, 60
	;Sets the RDI register to 0, no errorcode present on exit
	mov rdi, 0
	;System call, stops the program
	syscall

