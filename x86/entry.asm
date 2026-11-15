bits 64
; entry point

section .text
	global efi_main
	extern setup_idt
	extern setup_page_tables

efi_main:
	cli ; efi gives us a stack !
	call setup_idt

	xor ecx, ecx
	div ecx

	call setup_page_tables

.stp:   hlt
	jmp .stp

	sti

	; ???
