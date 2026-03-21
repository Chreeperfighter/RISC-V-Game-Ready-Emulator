//
// Created by Mark Verbeek on 20.03.26.
//

#ifndef COMMON_RV32_AUDIO_H
#define COMMON_RV32_AUDIO_H

#include "rv32_syscalls.h"

bool init_audio(uint32_t sample_rate, uint8_t channels, uint8_t bits_per_sample);
bool submit_audio(void* buffer, uint32_t len);
uint32_t get_queued_bytes();

#endif //COMMON_RV32_AUDIO_H