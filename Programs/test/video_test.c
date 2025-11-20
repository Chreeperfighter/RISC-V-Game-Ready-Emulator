#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>

int main(void) {
    const char* path = "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/bad_apple_with_header.raw";

    FILE *fp = fopen(path, "r");

    if (fp == NULL) {
        printf("File open FAILED!\n");
        printf("errno = %d\n", errno);
        printf("Error: %s\n", strerror(errno));
        printf("Path: %s\n", path);
        return 1;
    }

    printf("File opened successfully: %p\n", fp);
    fclose(fp);

    return 0;
}
