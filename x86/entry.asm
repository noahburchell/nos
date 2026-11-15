bits 64
; entry point

section .text
	global efi_main
	extern setup_idt

efi_main:
	cli ; efi gives us a stack !
	call setup_idt

	xor ecx, ecx
	div ecx

.stp:   hlt
	jmp .stp

	sti

	; ???
