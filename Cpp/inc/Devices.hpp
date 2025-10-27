//
// Created by Mark Verbeek on 19.10.25.
//

#ifndef DISPLAYCONTROLLER_HPP
#define DISPLAYCONTROLLER_HPP

#include <atomic>
#include <thread>

struct Display {
    static constexpr uint32_t DISPLAY_ORIGIN = 0x0;
    static constexpr uint32_t DISPLAY_WIDTH_ORIGIN = 0x4;
    static constexpr uint32_t DISPLAY_HEIGHT_ORIGIN = 0x8;
    static constexpr uint32_t ENABLE_BIT = 0x1;
    static constexpr uint32_t NEW_FRAME_BIT = 0x2;
    static constexpr uint32_t READY_BIT = 0x4;
    static constexpr uint32_t AUTO_REFRESH_BIT = 0x8;

    bool enabled;
    std::atomic<bool> new_frame;
    bool ready;
    bool auto_refresh;
    uint32_t width;
    uint32_t height;

    void get_bytes(uint8_t* buffer, const size_t buffer_size) const {
        if (buffer_size != 12) return;

        uint32_t control = 0;
        control |= static_cast<uint32_t>(enabled);
        control |= static_cast<uint32_t>(new_frame) << 1;
        control |= static_cast<uint32_t>(ready) << 2;
        control |= static_cast<uint32_t>(auto_refresh) << 3;

        std::memcpy(buffer + DISPLAY_ORIGIN, &control, sizeof(uint32_t));
        std::memcpy(buffer + DISPLAY_WIDTH_ORIGIN, &width, sizeof(uint32_t));
        std::memcpy(buffer + DISPLAY_HEIGHT_ORIGIN, &height, sizeof(uint32_t));
    }
};

#endif //DISPLAYCONTROLLER_HPP
