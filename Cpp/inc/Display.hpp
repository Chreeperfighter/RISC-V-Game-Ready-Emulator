//
// Created by Mark Verbeek on 08.11.25.
//

#ifndef DISPLAY_HPP
#define DISPLAY_HPP

#include "RV32.hpp"

#include <SDL2/SDL.h>

struct DisplayContext {
    SDL_Window *window;
    SDL_Renderer *renderer;
    SDL_Texture *texture;
};

class Display {
public:
    explicit Display(RV32 &obj) : rv32(obj) {}
    void init_display();
    void update_display();
    void cleanup_display();
    DisplayContext &get_context();
private:
    DisplayContext context{};
    RV32 &rv32;
    std::vector<uint8_t> framebuffer;
};



#endif //DISPLAY_HPP
