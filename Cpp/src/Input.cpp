//
// Created by Mark Verbeek on 08.11.25.
//

#include "Input.hpp"

#include <iostream>

#include "Config.hpp"

Input::Input(RV32 &cpu, Display &dsp) : rv32(cpu), display(dsp) {
    // Force HIDAPI for Xbox controllers — required on macOS for BT Xbox controllers
    // to generate SDL_CONTROLLERBUTTONDOWN events instead of generic HID events.
    SDL_SetHint(SDL_HINT_JOYSTICK_HIDAPI_XBOX, "1");
    SDL_SetHint(SDL_HINT_JOYSTICK_HIDAPI, "1");
    SDL_Init(SDL_INIT_GAMECONTROLLER);
    // Open any controllers already connected at startup.
    // SDL_CONTROLLERDEVICEADDED is also queued for these during Init, so
    // open_controller guards against opening the same instance twice.
    for (int i = 0; i < SDL_NumJoysticks(); i++) {
        if (SDL_IsGameController(i)) {
            open_controller(i);
        }
    }
}

Input::~Input() {
    for (auto &[id, gc] : controllers) {
        SDL_GameControllerClose(gc);
    }
}

void Input::open_controller(int device_index) {
    SDL_GameController *gc = SDL_GameControllerOpen(device_index);
    if (!gc) {
        std::cerr << "[Input] Failed to open controller " << device_index
                  << ": " << SDL_GetError() << "\n";
        return;
    }
    SDL_JoystickID id = SDL_JoystickInstanceID(SDL_GameControllerGetJoystick(gc));
    if (controllers.count(id)) {
        // Already open (SDL_CONTROLLERDEVICEADDED fires for controllers that
        // were already connected when SDL_Init ran — don't double-open).
        SDL_GameControllerClose(gc);
        return;
    }
    std::cout << "[Input] Opened controller " << device_index
              << " (instance " << id << "): "
              << SDL_GameControllerName(gc) << "\n";
    controllers[id] = gc;
}

void Input::close_controller(SDL_JoystickID instance_id) {
    auto it = controllers.find(instance_id);
    if (it == controllers.end()) {
        return;
    }
    SDL_GameControllerClose(it->second);
    controllers.erase(it);
}

bool Input::process_event(const SDL_Event &event) {
    int window_w, window_h;
    const DisplayContext context = display.get_context();
    SDL_GetWindowSize(context.window, &window_w, &window_h);
    if (event.type == SDL_QUIT) {
        return true;
    }
    if (event.type == SDL_WINDOWEVENT && event.window.event == SDL_WINDOWEVENT_RESIZED) {
        int scale = std::max(1, std::min(
                                 event.window.data1 / g_config.framebuffer_width,
                                 event.window.data2 / g_config.framebuffer_height
                             ));
        SDL_SetWindowSize(context.window,
                          g_config.framebuffer_width * scale,
                          g_config.framebuffer_height * scale);
    }
    if (event.type == SDL_CONTROLLERDEVICEADDED) {
        open_controller(event.cdevice.which);
    } else if (event.type == SDL_CONTROLLERDEVICEREMOVED) {
        close_controller(event.cdevice.which);
    } else if (event.type == SDL_MOUSEMOTION) {
        const int32_t mouse_x = event.motion.x;
        const int32_t mouse_y = event.motion.y;
        const int32_t scaled_x = (mouse_x * g_config.framebuffer_width) / window_w;
        const int32_t scaled_y = (mouse_y * g_config.framebuffer_height) / window_h;
        rv32.set_mouse_pos(scaled_x, scaled_y);
    } else if (event.type == SDL_MOUSEBUTTONDOWN) {
        const uint32_t button = event.button.button;
        rv32.set_mouse_button(button - 1, true);
    } else if (event.type == SDL_MOUSEBUTTONUP) {
        const uint32_t button = event.button.button;
        rv32.set_mouse_button(button - 1, false);
    } else if (event.type == SDL_KEYDOWN) {
        const SDL_Scancode scancode = event.key.keysym.scancode;
        rv32.add_key_to_queue(scancode);
        rv32.set_key_state(scancode, true);
    } else if (event.type == SDL_KEYUP) {
        const SDL_Scancode scancode = event.key.keysym.scancode;
        rv32.add_key_to_queue(scancode | 0x8000);
        rv32.set_key_state(scancode, false);
    } else if (event.type == SDL_CONTROLLERBUTTONDOWN) {
        const auto button = static_cast<SDL_GameControllerButton>(event.cbutton.button);
        rv32.set_controller_button(button, true);
    } else if (event.type == SDL_CONTROLLERBUTTONUP) {
        const auto button = static_cast<SDL_GameControllerButton>(event.cbutton.button);
        rv32.set_controller_button(button, false);
    } else if (event.type == SDL_CONTROLLERAXISMOTION) {
        const auto axis = static_cast<SDL_GameControllerAxis>(event.caxis.axis);
        const auto value = static_cast<int16_t>(event.caxis.value);
        rv32.set_controller_axis(axis, value);
    }
    return false;
}