; gdt ???

if youre reading htis im still lost
jmp strt

idtr:
	dw 0x0000
	dq 0x0000000000000000

strt:

lidt [idtr]
int 3
