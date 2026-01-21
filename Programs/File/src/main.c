#include "syscalls.h"
#include <stdio.h>

int main() {
    /*
    FILE *file = fopen("/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/File/example.txt", "r");
    syscall_breakpoint();
    if (file == NULL) {
        // handle error
        perror("fopen");
        return 1;
    }
    // ... use file ...
    fclose(file);
    */
    int x = 20;
    syscall_breakpoint();
    return 0;
}
