MEMORY {
    ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 128K
    RAM (rwx) : ORIGIN = 0x00020000, LENGTH = 512K
}

SECTIONS {
    . = 0x00000000;
    .text : {
        PROVIDE(_text_start = .);
        *(.text*)
        *(.rodata*)
        PROVIDE(_etext = .);
    } > ROM

    .data : AT(_etext) {
        PROVIDE(__data_load = LOADADDR(.data));
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
    
    /DISCARD/ : { *(.eh_frame) *(.eh_frame*) }
}
