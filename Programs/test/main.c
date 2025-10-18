#include <stdint.h>

volatile uint64_t result = 0; // prevent optimization

int main(void) {
    const uint64_t iterations = 1000000000ULL; // 1 billion
    uint64_t a = 0x123456789ABCDEF0ULL;
    uint64_t b = 0x0FEDCBA987654321ULL;
    uint64_t c = 0xCAFEBABEDEADBEEFULL;

    for (uint64_t i = 0; i < iterations; i++) {
        a ^= (b + c);
        b += (a << 3) ^ (c >> 2);
        c = (b * 33) ^ (a >> 7);
        a = (a << 1) | (a >> 63); // rotate left
        b = (b >> 1) | (b << 63); // rotate right
        c += a ^ b ^ i;
    }

    result = a ^ b ^ c; // write final value so compiler keeps it
    return 0;
}
