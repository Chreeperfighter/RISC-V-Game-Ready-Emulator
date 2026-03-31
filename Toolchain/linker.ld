ENTRY(_start)

MEMORY {
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 64M
}

SECTIONS {
    . = 0x00000000;
    
    /* ---- TEXT ---- */
    .text : ALIGN(4) {
        PROVIDE(_text_start = .);
        KEEP(*(.text.init))      /* Ensure _start is first */
        *(.text.startup)
        *(.text)
        *(.text*)
        . = ALIGN(4);
        PROVIDE(_etext = .);
    } > RAM
    
    /* ---- RODATA ---- */
    .rodata : ALIGN(4) {
        *(.rodata)
        *(.rodata*)
        *(.srodata*)
        . = ALIGN(4);
    } > RAM
    
    /* ---- EH FRAME ---- */
    .eh_frame : {
        PROVIDE(__EH_FRAME_BEGIN__ = .);
        KEEP(*(.eh_frame))
        PROVIDE(__EH_FRAME_END__ = .);
    } > RAM
    
    /* ---- DATA ---- */
    .data : ALIGN(4) {
        PROVIDE(__data_start = .);
        PROVIDE(_sdata = .);
        *(.data)
        *(.data*)
        *(.sdata)
        *(.sdata*)
        . = ALIGN(4);
        PROVIDE(__data_end = .);
        PROVIDE(_edata = .);
    } > RAM
    
    /* ---- PREINIT ARRAY ---- */
    .preinit_array : ALIGN(4) {
        PROVIDE_HIDDEN (__preinit_array_start = .);
        KEEP (*(.preinit_array))
        PROVIDE_HIDDEN (__preinit_array_end = .);
    } > RAM
    
    /* ---- INIT ARRAY (constructors) ---- */
    .init_array : ALIGN(4) {
        PROVIDE_HIDDEN (__init_array_start = .);
        /* Merge all init_array sections and sort by priority */
        KEEP (*(SORT_BY_INIT_PRIORITY(.init_array.*)))
        KEEP (*(SORT_BY_INIT_PRIORITY(.ctors.*)))
        KEEP (*(.init_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o) .ctors))
        PROVIDE_HIDDEN (__init_array_end = .);
    } > RAM
    
    /* ---- FINI ARRAY (destructors) ---- */
    .fini_array : ALIGN(4) {
        PROVIDE_HIDDEN (__fini_array_start = .);
        KEEP (*(SORT_BY_INIT_PRIORITY(.fini_array.*)))
        KEEP (*(SORT_BY_INIT_PRIORITY(.dtors.*)))
        KEEP (*(.fini_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o) .dtors))
        PROVIDE_HIDDEN (__fini_array_end = .);
    } > RAM
    
    /* source of .data in flash (simulated) */
    PROVIDE(_sidata = _etext);
    
    /* ---- GLOBAL POINTER ---- */
    PROVIDE(__global_pointer$ = _sdata + 0x800);
    
    /* ---- BSS ---- */
    .bss (NOLOAD) : ALIGN(4) {
        PROVIDE(__bss_start = .);
        PROVIDE(_sbss = .);
        *(.sbss)
        *(.sbss*)
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        PROVIDE(__bss_end = .);
        PROVIDE(_ebss = .);
    } > RAM
    
    /* ---- HEAP AND STACK ---- */
    . = ALIGN(16);
    PROVIDE(_end = .);
    PROVIDE(_heap_end = ORIGIN(RAM) + LENGTH(RAM) - 0x400000);
    PROVIDE(_stack_top = ORIGIN(RAM) + LENGTH(RAM));
    PROVIDE(__stack_top = _stack_top);
    PROVIDE(__stack = _stack_top);
}