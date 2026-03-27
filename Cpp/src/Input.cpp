//
// Created by Mark Verbeek on 08.11.25.
//

#include "Input.hpp"

#include "Config.hpp"
#include "Utils.hpp"

Input::Input(RV32 &cpu, Display &dsp) : rv32(cpu), display(dsp) {
    SDL_Init(SDL_INIT_GAMECONTROLLER);
    // Open any controllers already connected at startup.
    // SDL_CONTROLLERDEVICEADDED is also queued for these during Init, so
    // open_controller guards against opening the same instance twice.
    for (int i = 0; i < SDL_NumJoysticks(); i++) {
        std::cout << "Joystick " << i << ": " << SDL_JoystickNameForIndex(i)
          << " isGameController=" << SDL_IsGameController(i) << "\n";
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
        emulator_warn("Input::open_controller() --> Failed to open controller " + std::to_string(device_index) + ": " + SDL_GetError());
        return;
    }
    SDL_JoystickID id = SDL_JoystickInstanceID(SDL_GameControllerGetJoystick(gc));
    if (controllers.count(id)) {
        SDL_GameControllerClose(gc);
        return;
    }
    // Find first free slot
    int slot = -1;
    for (int i = 0; i < MAX_CONTROLLERS; i++) {
        bool in_use = false;
        for (auto &[jid, s] : controller_slots) {
            if (s == i) { in_use = true; break; }
        }
        if (!in_use) { slot = i; break; }
    }
    if (slot == -1) {
        emulator_warn("Input::open_controller() --> No free controller slots");
        SDL_GameControllerClose(gc);
        return;
    }
    controllers[id] = gc;
    controller_slots[id] = slot;
    std::cout << "Controller " << id << " opened" << std::endl;
}

void Input::close_controller(SDL_JoystickID instance_id) {
    auto cit = controllers.find(instance_id);
    if (cit == controllers.end()) {
        return;
    }
    auto sit = controller_slots.find(instance_id);
    if (sit != controller_slots.end()) {
        rv32.clear_controller_slot(sit->second);
        controller_slots.erase(sit);
    }
    SDL_GameControllerClose(cit->second);
    controllers.erase(cit);
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
        auto it = controller_slots.find(event.cbutton.which);
        if (it != controller_slots.end()) {
            rv32.set_controller_button(it->second,
                static_cast<SDL_GameControllerButton>(event.cbutton.button), true);
        }
    } else if (event.type == SDL_CONTROLLERBUTTONUP) {
        auto it = controller_slots.find(event.cbutton.which);
        if (it != controller_slots.end()) {
            rv32.set_controller_button(it->second,
                static_cast<SDL_GameControllerButton>(event.cbutton.button), false);
        }
    } else if (event.type == SDL_CONTROLLERAXISMOTION) {
        auto it = controller_slots.find(event.caxis.which);
        if (it != controller_slots.end()) {
            rv32.set_controller_axis(it->second,
                static_cast<SDL_GameControllerAxis>(event.caxis.axis),
                static_cast<int16_t>(event.caxis.value));
        }
    }
    return false;
}