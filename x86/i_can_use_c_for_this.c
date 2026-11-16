#include <stdint.h>

typedef struct gate_descriptor {
	uint16_t offset_low;
	uint16_t selector;
	uint8_t  ist;
	uint8_t  type_attrib;
	uint16_t offset_mid;
	uint32_t offset_high;
	uint32_t zero;
} __attribute__((packed)) gate_descriptor;

typedef struct idtr {
	uint16_t limit;
	uint64_t base;
} __attribute__((packed)) idtr;

/*
  what is a gdt even for? i cannot use efi one and i need a tss

????
???

gdt:
limit word
base qword

gtd entry?:
word limit
word base
byte base
byte access
octet limit
octet flags
byte base


who the fuck made this fuckign thing this is fucked
????

*/
