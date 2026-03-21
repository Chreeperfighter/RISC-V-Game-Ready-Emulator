//
// Created by Mark Verbeek on 20.03.26.
//

#include "../inc/Audio.hpp"

Audio::~Audio() {
    if (audio_device != 0) {
        SDL_CloseAudioDevice(audio_device);
        SDL_QuitSubSystem(SDL_INIT_AUDIO);
    }
}

bool Audio::init(uint32_t sample_rate, uint8_t channels, uint8_t bits_per_sample) {
    if (audio_device != 0) {
        SDL_CloseAudioDevice(audio_device);
        audio_device = 0;
    }
    if (SDL_InitSubSystem(SDL_INIT_AUDIO) < 0)
        return false;

    SDL_AudioSpec desired{};
    SDL_AudioSpec obtained{};
    desired.freq = sample_rate;
    desired.channels = channels;
    desired.samples = 1024;
    desired.format = bits_per_sample == 8 ? AUDIO_U8 : AUDIO_S16SYS;

    audio_device = SDL_OpenAudioDevice(nullptr, 0, &desired, &obtained, 0);
    if (audio_device == 0) {
        return false;
    }

    bytes_per_second = obtained.freq * obtained.channels * SDL_AUDIO_BITSIZE(obtained.format) / 8;
    hardware_buffer_bytes = obtained.size;
    SDL_PauseAudioDevice(audio_device, 0);
    return true;
}

void Audio::submit(const void *data, uint32_t len) {
    if (audio_device == 0)
        return;
    // Calculate exactly how long to wait for the queue to drain to 1 frame,
    // rather than polling with SDL_Delay(1) which overshoots due to OS timer resolution.
    // SDL_GetQueuedAudioSize includes the hardware buffer, so account for it in the threshold.
    // We allow 1 hw buffer + 1 chunk ahead before sleeping.
    uint32_t queued = SDL_GetQueuedAudioSize(audio_device);
    uint32_t threshold = hardware_buffer_bytes + len;
    if (queued > threshold && bytes_per_second > 0) {
        uint32_t wait_ms = (uint32_t)((uint64_t)(queued - threshold) * 1000 / bytes_per_second);
        if (wait_ms > 0)
            SDL_Delay(wait_ms);
    }
    SDL_QueueAudio(audio_device, data, len);
}

uint32_t Audio::get_queued_bytes() const {
    if (audio_device == 0) {
        return 0;
    }
    return SDL_GetQueuedAudioSize(audio_device);
}