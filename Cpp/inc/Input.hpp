//
// Created by Mark Verbeek on 08.11.25.
//

#ifndef INPUT_HPP
#define INPUT_HPP

#include "RV32.hpp"
#include "Display.hpp"

#include <SDL2/SDL.h>
#include <unordered_map>

class Input {
public:
    explicit Input(RV32 &cpu, Display &dsp);

    ~Input();

    bool process_event(const SDL_Event &event);

private:
    void open_controller(int device_index);

    void close_controller(SDL_JoystickID instance_id);

    RV32 &rv32;
    Display &display;
    std::unordered_map<SDL_JoystickID, SDL_GameController *> controllers;
};


#endif //INPUT_HPP