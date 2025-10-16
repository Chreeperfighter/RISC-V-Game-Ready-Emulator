MEMORY {
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 512K
    VRAM (rw) : ORIGIN = 0x10000000, LENGTH = 512K
}

SECTIONS {
    . = 0x00000000;
    
    .text : {
        PROVIDE(_text_start = .);
        KEEP(*(.text))   /* Keep _start even with --gc-sections */
        *(.text*)               /* All other code */
        PROVIDE(_etext = .);
    } > RAM
    
    .rodata : {
        *(.rodata*)
    } > RAM

    .data : {
        PROVIDE(__data_start = .);
        *(.data*)
        *(.sdata*)
        . = ALIGN(4);
        PROVIDE(__data_end = .);
        PROVIDE(__global_pointer$ = __data_start + 0x800);
    } > RAM

    .bss (NOLOAD) : {
        . = ALIGN(4);
        PROVIDE(__bss_start = .);
        *(.bss*)
        *(.sbss*)
        *(COMMON)
        . = ALIGN(4);
        PROVIDE(__bss_end = .);
    } > RAM
    
    PROVIDE(_end = ORIGIN(RAM) + LENGTH(RAM));
    
    PROVIDE(__vram_start = ORIGIN(VRAM));
    PROVIDE(__vram_end = ORIGIN(VRAM) + LENGTH(VRAM));
    
    /DISCARD/ : { *(.eh_frame) *(.eh_frame*) }
}
