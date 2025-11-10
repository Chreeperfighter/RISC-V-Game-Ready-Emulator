//
// Created by Mark Verbeek on 08.11.25.
//

#ifndef INPUT_HPP
#define INPUT_HPP

#include "RV32.hpp"
#include "Display.hpp"

#include <SDL2/SDL.h>

class Input {
public:
    explicit Input(RV32 obj) : rv32(obj) {}
    bool process_event(const SDL_Event &event, const DisplayContext &display);
private:
    RV32 &rv32;
};



#endif //INPUT_HPP
