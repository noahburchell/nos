#include <stdint.h>

typedef union pml4e {
	uint64_t raw;
	struct {
		uint64_t present        : 1;
		uint64_t writable       : 1;
		uint64_t user           : 1;
		uint64_t write_through  : 1;
		uint64_t cache_disable  : 1;
		uint64_t accessed       : 1;
		uint64_t ignored0       : 1;
		uint64_t reserved0      : 1;
		uint64_t ignored1       : 4;
		uint64_t pdpt_pfn       : 40;
		uint64_t ignored2       : 11;
		uint64_t no_execute     : 1;
	};
} pml4e;

typedef union pdpte {
	uint64_t raw;
	struct {
		uint64_t present        : 1;
		uint64_t writable       : 1;
		uint64_t user           : 1;
		uint64_t write_through  : 1;
		uint64_t cache_disable  : 1;
		uint64_t accessed       : 1;
		uint64_t ignored0       : 1;
		uint64_t reserved0      : 1;
		uint64_t ignored1       : 4;
		uint64_t pd_pfn         : 40;
		uint64_t ignored2       : 11;
		uint64_t no_execute     : 1;
	};
} pdpte;

typedef union pde {
	uint64_t raw;
	struct {
		uint64_t present        : 1;
		uint64_t writable       : 1;
		uint64_t user           : 1;
		uint64_t write_through  : 1;
		uint64_t cache_disable  : 1;
		uint64_t accessed       : 1;
		uint64_t ignored0       : 1;
		uint64_t reserved0      : 1;
		uint64_t ignored1       : 4;
		uint64_t pt_pfn         : 40;
		uint64_t ignored2       : 11;
		uint64_t no_execute     : 1;
	};
} pde;

typedef union pte {
	uint64_t raw;
	struct {
		uint64_t present        : 1;
		uint64_t writable       : 1;
		uint64_t user           : 1;
		uint64_t write_through  : 1;
		uint64_t cache_disable  : 1;
		uint64_t accessed       : 1;
		uint64_t dirty          : 1;
		uint64_t pat            : 1;
		uint64_t global         : 1;
		uint64_t ignored0       : 3;
		uint64_t page_pfn       : 40;
		uint64_t ignored1       : 7;
		uint64_t protection_key : 4;
		uint64_t no_execute     : 1;
	};
} pte;
