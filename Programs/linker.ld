MEMORY {
	ROM (rx) : ORIGIN = 0x00000000, LENGTH = 64K
	RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 128K
}

SECTIONS {
	. = 0x00000000;
	.text : { 
		*(.text) 
	} > ROM
	
	.rodata : {
		*(.rodata*)
	} > ROM

	.data : {
		__data_start = .;
        	*(.data*)
        	__data_end = .;
	} > RAM AT > ROM

	.bss : {
        	__bss_start = .;
        	*(.bss*)
        	*(COMMON)
        	__bss_end = .;
	} > RAM
}