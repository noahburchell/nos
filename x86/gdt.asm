; gdt ???

if youre reading htis im still lost
i think that uefi gives me a gdt? do i use that one ?

jmp strt

idtr:
	dw 0x0000
	dq 0x0000000000000000

strt:

lidt [idtr]
int 3
