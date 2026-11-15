bits 64

section .bss
align 4096
page_table:
	times 4096 db 0

section .text
	global setup_page_tables

setup_page_tables:
	lea rax, [rel page_table]
	mov cr3, rax
	ret
