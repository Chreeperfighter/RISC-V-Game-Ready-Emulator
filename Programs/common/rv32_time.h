//
// Created by Mark Verbeek on 11.03.26.
//

#ifndef COMMON_RV32_TIME_H
#define COMMON_RV32_TIME_H

#include <stdint.h>
#include <stdbool.h>

uint32_t get_us(bool* ok);
bool sleep_us(uint32_t duration_us);

#endif //COMMON_RV32_TIME_H