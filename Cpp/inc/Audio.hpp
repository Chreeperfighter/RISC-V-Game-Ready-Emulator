//
// Created by Mark Verbeek on 20.03.26.
//

#ifndef CPP_AUDIO_HPP
#define CPP_AUDIO_HPP

#include <SDL2/SDL.h>
#include <cstdint>

class Audio {
public:
    ~Audio();

    bool init(uint32_t sample_rate, uint8_t channels, uint8_t bits_per_sample);

    void submit(const void *data, uint32_t len);

    uint32_t get_queued_bytes() const;

private:
    SDL_AudioDeviceID audio_device = 0;
    uint32_t bytes_per_second = 0;
    uint32_t hardware_buffer_bytes = 0;
};


#endif //CPP_AUDIO_HPP