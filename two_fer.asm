; String concatenation: 'https://pages.hep.wisc.edu/~pinghc/asm4.html'
%macro concatenate 2
	lea rsi, [rel %1]		; put address into the source index, lea works well for this
    	; mov rdi, %3			; put address into the destination index, no need to change (program output)
    	mov rcx, %2          		; put the number of bytes to copy in rcx, times to repeat
  	rep movsb			; repeat copying bytes from rsi to rdi until rcx = 0
%endmacro

; '.ro' means read-only
section .rodata
	text1 db "One for ",0
	len_text1 equ $-text1		; Length: 8 bytes

	default_name db "you",0
	len_default_name equ $-default_name		; Length: 3 bytes, 24 total with 'you' as name

	text2 db ", one for me.",0
	len_text2 equ $-text2 		; Length: 13 bytes

section .text
	global two_fer
; Main function
two_fer:
	mov rax, rdi			; rdi is the program input (the name), will be maintained in rax until end

	mov rdi, rsi			; Clears rdi register to become program output
	jmp concatenate_text1		; Unnessecary jump for code flow, but I like this reminder

concatenate_text1:
	concatenate text1, len_text1	; Combine text1 to rdi, define string and length
	jmp test_for_name

test_for_name:
	cmp rax, 0			; Check if a name was given
	jne copy			; Jump to copy function if rax contains a name
	jmp concatenate_default_name	; Else, jump to concatenate_default_name

concatenate_default_name:
	concatenate default_name, len_default_name
	jmp concatenate_text2

concatenate_text2:
	concatenate text2, len_text2
	jmp exit

exit:
	; Only needs rax and rdi, rax of 60 for exit
	mov rax, 60
	mov rdi, 0			; No exit code, 0
	syscall				; Ends whole program

; Borrowed from Exercism user 'udhos' for this next part to help with my comprehension
; Not using concatenate macro becuase length of input name is unknown
copy:
	mov rsi, rax			; Places given name into unused register for comparison
	cmp byte [rsi], 0		; Checks if rsi is zero... Seems like a weird edge case check, but I'll keep it
	je .stop			; Jumps to the function stop if true
	jmp .loop			; Else, move to .loop

.loop:
	movsb				; Moves a single byte from rsi to rdi
	cmp byte [rsi], 0		; Checks if the new byte is zero, aka the end of the string
	jne .loop			; Repeats the loop if the string still remains
	jmp .stop			; Else, jump to .stop

.stop:
	jmp concatenate_text2		; Jumps to the final concatenation, effectively stopping the copy
