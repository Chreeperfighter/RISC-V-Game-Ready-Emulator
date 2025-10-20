//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef SYSCALL_HPP
#define SYSCALL_HPP
#include <cstdint>

enum class Syscall : uint32_t {
    PUT_CHAR = 1,
    // a0 -> char to print
    GET_CHAR = 2,
    // a0 <- char
    READ = 63,
    // a0 -> fd (0 = stdin, 1 = stdout, 2 = stderr)
    // a1 -> buffer address
    // a2 -> max length
    // a0 <- bytes read
    WRITE = 64,
    // a0 -> fd (0 = stdin, 1 = stdout, 2 = stderr)
    // a1 -> buffer address
    // a2 -> number of bytes
    // a0 <- bytes written
    FSTAT = 80,
    // a0 -> fd (0 = stdin, 1 = stdout, 2 = stderr)
    // a1 -> stat buffer
    // a0 <- status (0: success, -1: error)
    BRK = 214,
    // a0 -> break address (0 = don't change)
    // a0 <- program break address
    GET_CYCLES = 100,
    // a0 <- lower 32 bit
    // a1 <- upper 32 bit
    EXIT =  10
    // a0 -> exit code
};

#endif //SYSCALL_HPP
