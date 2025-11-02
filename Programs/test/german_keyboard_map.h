#ifndef GERMAN_KEYBOARD_MAP_H
#define GERMAN_KEYBOARD_MAP_H

#include <stdint.h>
#include <stdbool.h>
#include "SDL_scancode.h"

// German QWERTZ keyboard layout mapping
// Returns the character for a given scancode and shift state
static inline uint32_t german_scancode_to_char(uint16_t scancode, bool shift) {
    // Remove release bit if present
    scancode &= 0x7FFF;
    
    if (!shift) {
        // Without Shift
        switch (scancode) {
            // Letters (lowercase)
            case SDL_SCANCODE_A: return 'a';
            case SDL_SCANCODE_B: return 'b';
            case SDL_SCANCODE_C: return 'c';
            case SDL_SCANCODE_D: return 'd';
            case SDL_SCANCODE_E: return 'e';
            case SDL_SCANCODE_F: return 'f';
            case SDL_SCANCODE_G: return 'g';
            case SDL_SCANCODE_H: return 'h';
            case SDL_SCANCODE_I: return 'i';
            case SDL_SCANCODE_J: return 'j';
            case SDL_SCANCODE_K: return 'k';
            case SDL_SCANCODE_L: return 'l';
            case SDL_SCANCODE_M: return 'm';
            case SDL_SCANCODE_N: return 'n';
            case SDL_SCANCODE_O: return 'o';
            case SDL_SCANCODE_P: return 'p';
            case SDL_SCANCODE_Q: return 'q';
            case SDL_SCANCODE_R: return 'r';
            case SDL_SCANCODE_S: return 's';
            case SDL_SCANCODE_T: return 't';
            case SDL_SCANCODE_U: return 'u';
            case SDL_SCANCODE_V: return 'v';
            case SDL_SCANCODE_W: return 'w';
            case SDL_SCANCODE_X: return 'x';
            case SDL_SCANCODE_Y: return 'z';  // QWERTZ: Y key is Z
            case SDL_SCANCODE_Z: return 'y';  // QWERTZ: Z key is Y
            
            // Numbers
            case SDL_SCANCODE_1: return '1';
            case SDL_SCANCODE_2: return '2';
            case SDL_SCANCODE_3: return '3';
            case SDL_SCANCODE_4: return '4';
            case SDL_SCANCODE_5: return '5';
            case SDL_SCANCODE_6: return '6';
            case SDL_SCANCODE_7: return '7';
            case SDL_SCANCODE_8: return '8';
            case SDL_SCANCODE_9: return '9';
            case SDL_SCANCODE_0: return '0';
            
            // Special characters (German layout)
            case SDL_SCANCODE_MINUS: return 0xDF;        // ß
            case SDL_SCANCODE_EQUALS: return 0xB4;       // ´ (acute accent) - not in basic set
            case SDL_SCANCODE_LEFTBRACKET: return 0xFC;  // ü
            case SDL_SCANCODE_RIGHTBRACKET: return '+';
            case SDL_SCANCODE_BACKSLASH: return '#';
            case SDL_SCANCODE_SEMICOLON: return 0xF6;    // ö
            case SDL_SCANCODE_APOSTROPHE: return 0xE4;   // ä
            case SDL_SCANCODE_GRAVE: return '^';
            case SDL_SCANCODE_COMMA: return ',';
            case SDL_SCANCODE_PERIOD: return '.';
            case SDL_SCANCODE_SLASH: return '-';
            case SDL_SCANCODE_NONUSBACKSLASH: return '<';
            
            // Whitespace
            case SDL_SCANCODE_SPACE: return ' ';
            case SDL_SCANCODE_TAB: return '\t';
            case SDL_SCANCODE_RETURN: return '\r';
            case SDL_SCANCODE_BACKSPACE: return '\b';
            
            default: return 0;  // Unknown/unmapped key
        }
    } else {
        // With Shift
        switch (scancode) {
            // Letters (uppercase)
            case SDL_SCANCODE_A: return 'A';
            case SDL_SCANCODE_B: return 'B';
            case SDL_SCANCODE_C: return 'C';
            case SDL_SCANCODE_D: return 'D';
            case SDL_SCANCODE_E: return 'E';
            case SDL_SCANCODE_F: return 'F';
            case SDL_SCANCODE_G: return 'G';
            case SDL_SCANCODE_H: return 'H';
            case SDL_SCANCODE_I: return 'I';
            case SDL_SCANCODE_J: return 'J';
            case SDL_SCANCODE_K: return 'K';
            case SDL_SCANCODE_L: return 'L';
            case SDL_SCANCODE_M: return 'M';
            case SDL_SCANCODE_N: return 'N';
            case SDL_SCANCODE_O: return 'O';
            case SDL_SCANCODE_P: return 'P';
            case SDL_SCANCODE_Q: return 'Q';
            case SDL_SCANCODE_R: return 'R';
            case SDL_SCANCODE_S: return 'S';
            case SDL_SCANCODE_T: return 'T';
            case SDL_SCANCODE_U: return 'U';
            case SDL_SCANCODE_V: return 'V';
            case SDL_SCANCODE_W: return 'W';
            case SDL_SCANCODE_X: return 'X';
            case SDL_SCANCODE_Y: return 'Z';  // QWERTZ: Y key is Z
            case SDL_SCANCODE_Z: return 'Y';  // QWERTZ: Z key is Y
            
            // Shifted numbers (German layout)
            case SDL_SCANCODE_1: return '!';
            case SDL_SCANCODE_2: return '"';
            case SDL_SCANCODE_3: return 0xA7;  // § (section sign)
            case SDL_SCANCODE_4: return '$';
            case SDL_SCANCODE_5: return '%';
            case SDL_SCANCODE_6: return '&';
            case SDL_SCANCODE_7: return '/';
            case SDL_SCANCODE_8: return '(';
            case SDL_SCANCODE_9: return ')';
            case SDL_SCANCODE_0: return '=';
            
            // Shifted special characters (German layout)
            case SDL_SCANCODE_MINUS: return '?';
            case SDL_SCANCODE_EQUALS: return '`';        // ` (grave accent)
            case SDL_SCANCODE_LEFTBRACKET: return 0xDC;  // Ü
            case SDL_SCANCODE_RIGHTBRACKET: return '*';
            case SDL_SCANCODE_BACKSLASH: return '\'';
            case SDL_SCANCODE_SEMICOLON: return 0xD6;    // Ö
            case SDL_SCANCODE_APOSTROPHE: return 0xC4;   // Ä
            case SDL_SCANCODE_GRAVE: return 0xB0;        // ° (degree sign)
            case SDL_SCANCODE_COMMA: return ';';
            case SDL_SCANCODE_PERIOD: return ':';
            case SDL_SCANCODE_SLASH: return '_';
            case SDL_SCANCODE_NONUSBACKSLASH: return '>';
            
            // Whitespace (unchanged)
            case SDL_SCANCODE_SPACE: return ' ';
            case SDL_SCANCODE_TAB: return '\t';
            case SDL_SCANCODE_RETURN: return '\r';
            case SDL_SCANCODE_BACKSPACE: return '\b';
            
            default: return 0;  // Unknown/unmapped key
        }
    }
}

// Helper to check if a scancode is a modifier key
static inline bool is_modifier_key(uint16_t scancode) {
    scancode &= 0x7FFF;  // Remove release bit
    return (scancode == SDL_SCANCODE_LSHIFT || 
            scancode == SDL_SCANCODE_RSHIFT);
}

#endif // GERMAN_KEYBOARD_MAP_H