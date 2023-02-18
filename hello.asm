; hello.asm
section .data 
	msg:	db      "Hello, world!",0xa,0x0	; The message to print.
	.len:	equ	$ - msg			; The length of the message.
section .bss
section .text
	global _main

_main:
; Print Hello, world! using the write system call.
	mov     rax, 0x2000004	; The write system call.
	mov     rdi, 0x1	; Write to standard out.
	mov     rsi, msg	; The message to write.
	mov     rdx, msg.len	; The length of the message.
	syscall			; Make the write system call.

; Exit the application as success.
	mov     rax, 0x2000001	; The exit system call.
	mov     rdi, 0x0	; Exit code 0.
	syscall			; Make the exit system call.
