MEMORY {
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 8M
}

SECTIONS {
    . = 0x00000000;
    
    .text : ALIGN(4) {
        PROVIDE(_text_start = .);
        KEEP(*(.text.init))      /* Force _start first and keep it */
        *(.text.startup)
        *(.text)
        *(.text*)
        . = ALIGN(4);
        PROVIDE(_etext = .);
    } > RAM
    
    .rodata : ALIGN(4) {
        *(.rodata)
        *(.rodata*)
        *(.srodata*)
        . = ALIGN(4);
    } > RAM

    .data : ALIGN(4) {
        PROVIDE(__data_start = .);
        *(.data)
        *(.data*)
        *(.sdata)
        *(.sdata*)
        . = ALIGN(4);
        PROVIDE(__data_end = .);
    } > RAM
    
    PROVIDE(__global_pointer$ = __data_start + 0x800);

    .bss (NOLOAD) : ALIGN(4) {
        PROVIDE(__bss_start = .);
        *(.sbss)
        *(.sbss*)
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        PROVIDE(__bss_end = .);
    } > RAM
    
    . = ALIGN(16);
    PROVIDE(_end = .);
    PROVIDE(_heap_start = .);
    
    /* ADD THIS LINE: */
    PROVIDE(_stack_top = ORIGIN(RAM) + LENGTH(RAM));
    
    /DISCARD/ : {
        *(.eh_frame)
        *(.eh_frame_hdr)
        *(.comment)
    }
}
