bits 64

%macro GATE 1
%{1}_gate:
	dw 0 ; offset 0-15
	dw 0 ; selector
	db 0 ; ist
	db 0x8E ; attrib
	dw 0 ; offset 16-31
	dd 0 ; offset 32-63
	dd 0 ; reserved
%endmacro

; SET_GATE interrupt (de, pf)
%macro SET_GATE 1
	lea  rax, [rel %{1}_handler]
	mov  [rel %{1}_gate], ax ; offset bits 0-15
	shr  rax, 16
	mov  [rel %{1}_gate + 6], ax ; offset bits 16-31
	shr  rax, 16
	mov  [rel %{1}_gate + 8], eax ; offset bits 32-63

	mov  ax, cs ; the selector UEFI left you
	mov  [rel %{1}_gate + 2], ax
%endmacro

section .data
align 16

idt:
	GATE de
	GATE db
	GATE nmi
	GATE bp
idt_end:

idtr:
	dw idt_end - de_gate - 1
	dq 0

null_idt:
	dw 0
	dq 0

;;; ???
section .text
	global setup_idt

setup_idt:
	SET_GATE de
	SET_GATE db
	SET_GATE nmi
	SET_GATE bp

	; int 0x000B00B5

	lea  rax, [rel idt]
	mov  [rel idtr + 2], rax
	lidt [rel idtr]
	ret ; ???

;;; ???? /??? ??? ?? ? ?? ? ?? ?? ? ?? ? ? ?? ?? ? ?? ?? ? ?? ? ?

de_handler:
	lidt [rel null_idt]
	int 3
	ret
	; handler

db_handler:
	lidt [rel null_idt]
	int 3
	ret
	; handler

nmi_handler:
	lidt [rel null_idt]
	int 3
	ret
	; handler

bp_handler:
	lidt [rel null_idt]
	int 3
	ret
	; handler
