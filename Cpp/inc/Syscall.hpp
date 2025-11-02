//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef SYSCALL_HPP
#define SYSCALL_HPP
#include <cstdint>

enum class Syscall : uint32_t {
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
    SHOW_BUFFER = 101,
    // a0 -> framebuffer address
    GET_FRAMEBUFFER_INFO = 200,
    // a0 -> address to write info
    // a0 <- status (0: success, != 0: error)
    EXIT = 10,
    // a0 -> exit code
    GET_US = 11,
    // a0 <- time in us
    SLEEP_US = 12,
    // a0 -> time in us
    KEY_AVAILABLE = 13,
    // a0 <- available (0: queue empty)
    GET_KEY = 14,
    // a0 <- key code
    IS_KEY_DOWN = 15,
    // a0 -> key code to check
    // a0 <- key down (1 if down, 0 if up)
    CLEAR_KEY_QUEUE = 16,
    // a0 <- success (0 if success, -1 if fail)
    GET_MOUSE_POS = 17,
    // a0 <- x position
    // a1 <- y position
    IS_MOUSE_BUTTON_DOWN = 18,
    // a0 -> button
    // a0 <- key down (1 if down, 0 if up)
};

#endif //SYSCALL_HPP
