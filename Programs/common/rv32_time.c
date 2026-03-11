//
// Created by Mark Verbeek on 11.03.26.
//

#include "rv32_time.h"
#include "rv32_syscalls.h"

uint32_t get_us(bool* ok) {
    uint32_t us;
    int32_t err = sys_get_us(&us);
    if (err == 0) {
        *ok = true;
    }
    else {
        *ok = false;
    }
    return us;
}
bool sleep_us(uint32_t duration_us) {
    int32_t err = sys_sleep_us(&duration_us);
    if (err == 0) {
        return true;
    }
    return false;
}