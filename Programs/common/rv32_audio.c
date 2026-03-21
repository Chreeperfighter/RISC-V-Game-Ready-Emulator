//
// Created by Mark Verbeek on 20.03.26.
//

#include "rv32_audio.h"

bool init_audio(uint32_t sample_rate, uint8_t channels, uint8_t bits_per_sample) {
    struct AudioInitArgs {
        uint32_t sample_rate;
        uint32_t channels;
        uint32_t bits_per_sample;
    } args = {sample_rate, channels, bits_per_sample};
    int32_t ret = sys_audio_init(&args);
    if (ret == 0) {
        return true;
    }
    return false;
}

bool submit_audio(void *buffer, uint32_t len) {
    struct AudioSubmitArgs {
        uint32_t buffer_ptr;
        uint32_t len;
    } args = {(uint32_t)buffer, len};
    int32_t ret = sys_audio_submit(&args);
    if (ret == 0) {
        return true;
    }
    return false;
}

uint32_t get_queued_bytes() {
    return sys_audio_get_queued_bytes();
}
