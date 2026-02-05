#include <stdio.h>

int main() {
    printf("About to call fopen...\n");
    FILE* f = fopen("/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/File/example.txt", "r");
    printf("fopen returned: %p\n", (void*)f);

    if (f) {
        printf("File descriptor: %d\n", fileno(f));
    }

    printf("Hello, World!\n");  // Works!
    fprintf(stderr, "Error!\n"); // Works!

    return 0;
}