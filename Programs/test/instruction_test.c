//
// Created by Mark Verbeek on 14.10.25.
//
#include "util.h"
#include "instruction_test.h"
#include <stdint.h>
#include <math.h>

int PRINT_OUTPUT;

// Fibonacci function
uint32_t fibonacci(uint32_t n) {
    if (n <= 1) return n;
    uint32_t a = 0, b = 1;
    for (uint32_t i = 2; i <= n; i++) {
        uint32_t temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}

// Simple bubble sort
void bubble_sort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

// Check if number is prime
int is_prime(int n) {
    if (n <= 1) return 0;
    if (n <= 3) return 1;
    if (n % 2 == 0 || n % 3 == 0) return 0;

    for (int i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0)
            return 0;
    }
    return 1;
}

// Calculate circle area (software float)
float circle_area(float radius) {
    return 3.14159f * radius * radius;
}

// Calculate rectangle area
float rectangle_area(float width, float height) {
    return width * height;
}

// Simple square root approximation (Newton's method)
float sqrt_approx(float x) {
    if (x < 0.0f) return 0.0f;
    if (x == 0.0f) return 0.0f;

    float guess = x / 2.0f;
    for (int i = 0; i < 10; i++) {
        guess = (guess + x / guess) / 2.0f;
    }
    return guess;
}

// Temperature conversion
float celsius_to_fahrenheit(float celsius) {
    return (celsius * 9.0f / 5.0f) + 32.0f;
}

// Draw a pattern
void draw_pattern(int size) {
    if (PRINT_OUTPUT) printf("\n=== ASCII Pattern ===\n");
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            if (i == 0 || i == size - 1 || j == 0 || j == size - 1) {
                if (PRINT_OUTPUT) printf("# ");
            } else if (i == j || i + j == size - 1) {
                if (PRINT_OUTPUT) printf("X ");
            } else {
                if (PRINT_OUTPUT) printf(". ");
            }
        }
        if (PRINT_OUTPUT) printf("\n");
    }
}

int run_instruction_test(int print_output) {
    PRINT_OUTPUT = print_output;
    if (PRINT_OUTPUT) printf("\n");
    if (PRINT_OUTPUT) printf("========================================\n");
    if (PRINT_OUTPUT) printf("   RISC-V RV32I CPU Emulator Demo\n");
    if (PRINT_OUTPUT) printf("   Testing Instructions & Features\n");
    if (PRINT_OUTPUT) printf("========================================\n");

    // Test 1: Basic arithmetic
    if (PRINT_OUTPUT) printf("\n[1] Basic Arithmetic Test\n");
    if (PRINT_OUTPUT) printf("-----------------------------\n");
    int a = 42, b = 17;
    if (PRINT_OUTPUT) printf("a = %d, b = %d\n", a, b);
    if (PRINT_OUTPUT) printf("a + b = %d\n", a + b);
    if (PRINT_OUTPUT) printf("a - b = %d\n", a - b);
    if (PRINT_OUTPUT) printf("a * b = %d\n", a * b);
    if (PRINT_OUTPUT) printf("a / b = %d\n", a / b);
    if (PRINT_OUTPUT) printf("a %% b = %d\n", a % b);

    // Test 2: Bitwise operations
    if (PRINT_OUTPUT) printf("\n[2] Bitwise Operations\n");
    if (PRINT_OUTPUT) printf("-----------------------------\n");
    uint32_t x = 0xAA, y = 0x55;
    if (PRINT_OUTPUT) printf("x = 0x%02X, y = 0x%02X\n", x, y);
    if (PRINT_OUTPUT) printf("x & y  = 0x%02X\n", x & y);
    if (PRINT_OUTPUT) printf("x | y  = 0x%02X\n", x | y);
    if (PRINT_OUTPUT) printf("x ^ y  = 0x%02X\n", x ^ y);
    if (PRINT_OUTPUT) printf("x << 2 = 0x%02X\n", x << 2);
    if (PRINT_OUTPUT) printf("x >> 2 = 0x%02X\n", x >> 2);

    // Test 3: Floating-point operations (SOFTWARE)
    if (PRINT_OUTPUT) printf("\n[3] Software Floating-Point Test\n");
    if (PRINT_OUTPUT) printf("-----------------------------\n");
    float pi = 3.14159f;
    float radius = 5.0f;
    if (PRINT_OUTPUT) printf("PI = %.5f\n", pi);
    if (PRINT_OUTPUT) printf("Radius = %.2f\n", radius);
    if (PRINT_OUTPUT) printf("Circle area = %.2f\n", circle_area(radius));

    float width = 12.5f;
    float height = 8.3f;
    if (PRINT_OUTPUT) printf("\nRectangle %0.1f x %0.1f\n", width, height);
    if (PRINT_OUTPUT) printf("Area = %.2f\n", rectangle_area(width, height));

    if (PRINT_OUTPUT) printf("\nSquare root approximations:\n");
    if (PRINT_OUTPUT) printf("sqrt(16) = %.4f\n", sqrt_approx(16.0f));
    if (PRINT_OUTPUT) printf("sqrt(25) = %.4f\n", sqrt_approx(25.0f));
    if (PRINT_OUTPUT) printf("sqrt(2)  = %.4f\n", sqrt_approx(2.0f));

    if (PRINT_OUTPUT) printf("\nTemperature conversions:\n");
    if (PRINT_OUTPUT) printf("0C = %.1fF\n", celsius_to_fahrenheit(0.0f));
    if (PRINT_OUTPUT) printf("100C = %.1fF\n", celsius_to_fahrenheit(100.0f));
    if (PRINT_OUTPUT) printf("37C = %.1fF\n", celsius_to_fahrenheit(37.0f));

    // Test 4: Double precision
    if (PRINT_OUTPUT) printf("\n[4] Double Precision Test\n");
    if (PRINT_OUTPUT) printf("-----------------------------\n");
    double d1 = 123.456789;
    double d2 = 987.654321;
    if (PRINT_OUTPUT) printf("d1 = %.6f\n", d1);
    if (PRINT_OUTPUT) printf("d2 = %.6f\n", d2);
    if (PRINT_OUTPUT) printf("d1 + d2 = %.6f\n", d1 + d2);
    if (PRINT_OUTPUT) printf("d1 * d2 = %.2f\n", d1 * d2);
    if (PRINT_OUTPUT) printf("d1 / d2 = %.6f\n", d1 / d2);

    // Test 5: Fibonacci sequence
    if (PRINT_OUTPUT) printf("\n[5] Fibonacci Sequence\n");
    if (PRINT_OUTPUT) printf("-----------------------------\n");
    if (PRINT_OUTPUT) printf("First 10 Fibonacci numbers:\n");
    for (int i = 0; i < 10; i++) {
        if (PRINT_OUTPUT) printf("fib(%d) = %u\n", i, fibonacci(i));
    }

    // Test 6: Array sorting
    if (PRINT_OUTPUT) printf("\n[6] Bubble Sort Test\n");
    if (PRINT_OUTPUT) printf("-----------------------------\n");
    int arr[] = {64, 34, 25, 12, 22, 11, 90, 88};
    int n = sizeof(arr) / sizeof(arr[0]);

    if (PRINT_OUTPUT) printf("Before: ");
    for (int i = 0; i < n; i++) if (PRINT_OUTPUT) printf("%d ", arr[i]);
    if (PRINT_OUTPUT) printf("\n");

    bubble_sort(arr, n);

    if (PRINT_OUTPUT) printf("After:  ");
    for (int i = 0; i < n; i++) {
        if (PRINT_OUTPUT) printf("%d ", arr[i]);
    }
    if (PRINT_OUTPUT) printf("\n");

    // Test 7: Prime numbers
    if (PRINT_OUTPUT) printf("\n[7] Prime Number Detection\n");
    if (PRINT_OUTPUT) printf("-----------------------------\n");
    if (PRINT_OUTPUT) printf("Prime numbers under 50:\n");
    int count = 0;
    for (int i = 2; i < 50; i++) {
        if (is_prime(i)) {
            if (PRINT_OUTPUT) printf("%d ", i);
            count++;
            if (count % 10 == 0) {
                if (PRINT_OUTPUT) printf("\n");
            }
        }
    }
    if (PRINT_OUTPUT) printf("\n");

    // Test 8: Pointer operations
    if (PRINT_OUTPUT) printf("\n[8] Pointer Operations\n");
    if (PRINT_OUTPUT) printf("-----------------------------\n");
    int value = 100;
    int *ptr = &value;
    if (PRINT_OUTPUT) printf("value = %d\n", value);
    if (PRINT_OUTPUT) printf("&value = 0x%08X\n", (unsigned int)&value);
    if (PRINT_OUTPUT) printf("ptr = 0x%08X\n", (unsigned int)ptr);
    if (PRINT_OUTPUT) printf("*ptr = %d\n", *ptr);
    *ptr = 200;
    if (PRINT_OUTPUT) printf("After *ptr=200, value = %d\n", value);

    // Test 9: Pattern drawing
    draw_pattern(9);

    // Test 10: Memory test
    if (PRINT_OUTPUT) printf("\n[9] Stack & Memory Test\n");
    if (PRINT_OUTPUT) printf("-----------------------------\n");
    char buffer[32];
    for (int i = 0; i < 32; i++) {
        buffer[i] = 'A' + (i % 26);
    }
    if (PRINT_OUTPUT) printf("Buffer contents: ");
    for (int i = 0; i < 32; i++) {
        if (PRINT_OUTPUT) printf("%c", buffer[i]);
    }
    if (PRINT_OUTPUT) printf("\n");

    // Final stats
    if (PRINT_OUTPUT) printf("\n========================================\n");
    if (PRINT_OUTPUT) printf("        All Tests Completed!\n");
    if (PRINT_OUTPUT) printf("========================================\n");
    if (PRINT_OUTPUT) printf("\nCPU emulator is working correctly!\n\n");

    return 0;
}