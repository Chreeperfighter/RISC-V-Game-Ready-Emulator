//
// Created by Mark Verbeek on 10.10.25.
//

void print(int x) {
    register int a0 asm("a0") = x;   // put x in a0
    register int a7 asm("a7") = 1;   // syscall number (e.g., 1 = print_int in simulator)
    asm volatile("ecall" : "+r"(a0), "+r"(a7) :: "memory");
}

int main(void) {
    // --- Arithmetic ---
    int a = 5;
    int b = 3;
    int sum = a + b;     // ADD
    int diff = a - b;    // SUB
    int prod = 0;
    for (int i = 0; i < b; i++) {  // MUL via loop, since no M-extension
        prod += a;
    }
    print(sum);   // expect 8
    print(diff);  // expect 2
    print(prod);  // expect 15

    // --- Logical ---
    int x = 0b1100;
    int y = 0b1010;
    print(x & y);  // AND -> 0b1000 = 8
    print(x | y);  // OR  -> 0b1110 = 14
    print(x ^ y);  // XOR -> 0b0110 = 6
    print(~x);     // NOT -> ~0b1100 = 0xFFFFFFF3 (-13 in 32-bit)

    // --- Shifts ---
    int z = 1;
    print(z << 3);  // SLL -> 8
    print(16 >> 2); // SRL -> 4 (logical shift)
    print(-16 >> 2);// SRA -> -4 (arithmetic shift)

    // --- Memory test ---
    int arr[4] = {10, 20, 30, 40};
    int val = arr[2]; // load
    print(val);       // expect 30
    arr[1] = 99;      // store
    print(arr[1]);    // expect 99

    // --- Branch test ---
    int flag = 0;
    if (sum > prod) {
        flag = 1;
    } else {
        flag = 2;
    }
    print(flag); // expect 2, because 8 < 15

    return 0;
}