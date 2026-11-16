bits 64

section .bss
align 4096
pml4: resb 4096
pdpt: resb 4096
pd:   resb 4096

section .text
	global setup_page_tables

setup_page_tables:
	lea rax, [rel pdpt]
	mov cr3, rax
	ret
