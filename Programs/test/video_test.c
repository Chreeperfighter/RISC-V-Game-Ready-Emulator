//
// Created by Mark Verbeek on 02.11.25.
//
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>

int main(void) {
    const char* filename = "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/bad_apple_with_header.raw";
    FILE *f = fopen(filename, "r");

    if (!f) {
        printf("Failed to open file, errno=%d\n", errno);
        return 1;
    }

    fclose(f);

    return 0;
}
