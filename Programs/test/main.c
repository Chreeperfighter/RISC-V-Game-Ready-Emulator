//
// Created by Mark Verbeek on 10.10.25.
//

void print(int x) {
    register int a0 asm("a0") = x;   // put x in a0
    register int a7 asm("a7") = 1;   // syscall number (e.g., 1 = print_int in simulator)
    asm volatile("ecall" : "+r"(a0), "+r"(a7) :: "memory");
}

int multiply(int a, int b) {
    int sum = 0;
    for (int i = 0; i < b; i++) {
        sum += a;
    }
    return sum;
}

int main(void) {
    int x = 30;
    print(multiply(x, x));
}