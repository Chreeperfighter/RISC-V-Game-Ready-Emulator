MEMORY {
	ROM (rx) : ORIGIN = 0x00000000, LENGTH = 64K
	RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 128K
}

SECTIONS {
	. = 0x00000000;
	.text : { 
		*(.text) 
	} > ROM
	
	.data : {
		*(.data)
		*(.rodata)
	} > RAM
	
	.bss : {
		*(.bss)
		*(COMMON)
	} > RAM
}