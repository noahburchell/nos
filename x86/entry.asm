; entry point
section .bss
	align 16

stack_base:
	resb 16384
stack_top:

section .text
	global _start
	extern setup_idt

_start:
	cli
	mov rsp, stack_top
	call setup_idt
	sti

	; ???
