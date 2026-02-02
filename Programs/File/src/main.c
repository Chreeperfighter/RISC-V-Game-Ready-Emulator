#include <stdio.h>

// Much larger BSS to match Doom's size
int huge_array[100000];  // 400KB
static char buffer[50000];

int main() {
    printf("Testing large BSS...\n");

    // Check every 1000th element
    for (int i = 0; i < 100000; i += 1000) {
        if (huge_array[i] != 0) {
            printf("FAIL at index %d: value = %d\n", i, huge_array[i]);
            return 1;
        }
    }

    // Check buffer
    for (int i = 0; i < 50000; i += 1000) {
        if (buffer[i] != 0) {
            printf("FAIL at buffer[%d]: value = %d\n", i, buffer[i]);
            return 1;
        }
    }

    printf("✓ Large BSS properly zeroed!\n");
    return 0;
}