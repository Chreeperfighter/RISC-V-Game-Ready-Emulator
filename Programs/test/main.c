// #include <stdio.h>
// #include "framebuffer_test.h"
// #include "util.h"

#include "util.h"

int add(int a, int b) {
    return a + b;
}

int main(void) {
    int x = 20;
    int y = 50;
    int z = add(x, y);

    return 0;
}