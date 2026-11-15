null_idt:
	dw 0x0000
	dq 0x0000000000000000

de_handler:
	lidt [rel null_idt]
	int 3
	; handler

de_gate:
	dw 0x0000 ; offset
	dw 0x0000 ; selector
	db 0x00 ; ist
	db 0x8E ; attrib
	dw 0x0000 ; offset 2
	dd 0x00000000 ; offset 3
	dd 0x00000000 ; zero

idtr:
	dw idt_end - de_gate - 1
	dq de_gate

;;; ???
section .text
	global setup_idt

setup_idt:
	lea  rax, [rel de_handler]
	mov  [rel de_gate], ax ; bits 0-15
	shr  rax, 16
	mov  [rel de_gate + 6], ax ; bits 16-31
	shr  rax, 16
	mov  [rel de_gate + 8], eax ; bits 32-63
	lidt [rel idtr]

	int 0x000B00B5
;;; ???? /??? ??? ?? ? ?? ? ?? ?? ? ?? ? ? ?? ?? ? ?? ?? ? ?? ? ?
