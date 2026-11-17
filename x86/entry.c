void entry(void) {
	__asm__ volatile ("cli");
	// set up gdt and idt
	// then destroy uefi page tables and make ours
	__asm__ volatile ("sti");
}
