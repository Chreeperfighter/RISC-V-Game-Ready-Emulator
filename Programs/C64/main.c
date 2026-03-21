#include <stdio.h>
#include "rv32_time.h"
#include "rv32_input.h"

#define CHIPS_IMPL
#include "rv32_audio.h"
#include "rv32_display.h"
#include "chips/chips_common.h"
#include "chips/m6502.h"
#include "chips/m6526.h"
#include "chips/m6569.h"
#include "chips/m6581.h"
#include "chips/kbd.h"
#include "chips/mem.h"
#include "chips/clk.h"
#include "systems/c1530.h"
#include "chips/m6522.h"
#include "systems/c1541.h"
#include "systems/c64.h"

c64_t sys;

uint8_t chargen_data[4096];
uint8_t basic_data[8192];
uint8_t kernal_data[8192];
uint8_t c1541_rom[24576];

static uint32_t framebuffer[504 * 312];
uint32_t palette[16];
void fill_palette() {
    for (int i = 0; i < 16; i++) palette[i] = m6569_color(i);
}

void audio_cb(const float* samples, int num_samples, void* user_data) {
    int16_t buf[C64_DEFAULT_AUDIO_SAMPLES];
    for (int i = 0; i < num_samples; i++) {
        float s = samples[i];
        if (s >  1.0f) s =  1.0f;
        if (s < -1.0f) s = -1.0f;
        buf[i] = (int16_t)(s * 32767.0f);
    }
    submit_audio(buf, num_samples * sizeof(int16_t));
}

bool load_rom(const char* path, uint8_t* rom, uint32_t rom_size) {
    FILE* f = fopen(path, "rb");
    if (!f) {
        fprintf(stderr, "fatal: can't open %s\n", path);
        return false;
    }
    fread(rom, 1, rom_size, f);
    fclose(f);
    return true;
}

static const struct { SDL_Scancode sdl; int c64; } key_map[] = {
    // Letters
    { SDL_SCANCODE_A, 'A' }, { SDL_SCANCODE_B, 'B' }, { SDL_SCANCODE_C, 'C' },
    { SDL_SCANCODE_D, 'D' }, { SDL_SCANCODE_E, 'E' }, { SDL_SCANCODE_F, 'F' },
    { SDL_SCANCODE_G, 'G' }, { SDL_SCANCODE_H, 'H' }, { SDL_SCANCODE_I, 'I' },
    { SDL_SCANCODE_J, 'J' }, { SDL_SCANCODE_K, 'K' }, { SDL_SCANCODE_L, 'L' },
    { SDL_SCANCODE_M, 'M' }, { SDL_SCANCODE_N, 'N' }, { SDL_SCANCODE_O, 'O' },
    { SDL_SCANCODE_P, 'P' }, { SDL_SCANCODE_Q, 'Q' }, { SDL_SCANCODE_R, 'R' },
    { SDL_SCANCODE_S, 'S' }, { SDL_SCANCODE_T, 'T' }, { SDL_SCANCODE_U, 'U' },
    { SDL_SCANCODE_V, 'V' }, { SDL_SCANCODE_W, 'W' }, { SDL_SCANCODE_X, 'X' },
    { SDL_SCANCODE_Y, 'Y' }, { SDL_SCANCODE_Z, 'Z' },
    // Numbers
    { SDL_SCANCODE_0, '0' }, { SDL_SCANCODE_1, '1' }, { SDL_SCANCODE_2, '2' },
    { SDL_SCANCODE_3, '3' }, { SDL_SCANCODE_4, '4' }, { SDL_SCANCODE_5, '5' },
    { SDL_SCANCODE_6, '6' }, { SDL_SCANCODE_7, '7' }, { SDL_SCANCODE_8, '8' },
    { SDL_SCANCODE_9, '9' },
    // Special keys
    { SDL_SCANCODE_RETURN,    C64_KEY_RETURN   },
    { SDL_SCANCODE_SPACE,     C64_KEY_SPACE    },
    { SDL_SCANCODE_BACKSPACE, C64_KEY_DEL      },
    { SDL_SCANCODE_ESCAPE,    C64_KEY_STOP     },
    { SDL_SCANCODE_HOME,      C64_KEY_HOME     },
    { SDL_SCANCODE_LCTRL,     C64_KEY_CTRL     },
    { SDL_SCANCODE_RCTRL,     C64_KEY_CTRL     },
    { SDL_SCANCODE_LALT,      C64_KEY_CBM      },  // Commodore key
    // Cursor keys
    { SDL_SCANCODE_RIGHT, C64_KEY_CSRRIGHT },
    { SDL_SCANCODE_LEFT,  C64_KEY_CSRLEFT  },
    { SDL_SCANCODE_DOWN,  C64_KEY_CSRDOWN  },
    { SDL_SCANCODE_UP,    C64_KEY_CSRUP    },
    // Function keys
    { SDL_SCANCODE_F1, C64_KEY_F1 }, { SDL_SCANCODE_F2, C64_KEY_F2 },
    { SDL_SCANCODE_F3, C64_KEY_F3 }, { SDL_SCANCODE_F4, C64_KEY_F4 },
    { SDL_SCANCODE_F5, C64_KEY_F5 }, { SDL_SCANCODE_F6, C64_KEY_F6 },
    { SDL_SCANCODE_F7, C64_KEY_F7 }, { SDL_SCANCODE_F8, C64_KEY_F8 },
    // Symbols (unshifted)
    { SDL_SCANCODE_MINUS,        '-' },
    { SDL_SCANCODE_EQUALS,       '=' },
    { SDL_SCANCODE_SEMICOLON,    ':' },
    { SDL_SCANCODE_APOSTROPHE,   ';' },
    { SDL_SCANCODE_COMMA,        ',' },
    { SDL_SCANCODE_PERIOD,       '.' },
    { SDL_SCANCODE_SLASH,        '/' },
    { SDL_SCANCODE_LEFTBRACKET,  '@' },  // @ on C64
    { SDL_SCANCODE_RIGHTBRACKET, '*' },  // * on C64
    { SDL_SCANCODE_BACKSLASH,    0x1C }, // £ on C64
    { SDL_SCANCODE_GRAVE,        C64_KEY_LEFT }, // left arrow ←
    // Shifted symbols (send shifted char directly)
    { SDL_SCANCODE_KP_PLUS,     '+' },
    { SDL_SCANCODE_KP_MINUS,    '-' },
    { SDL_SCANCODE_KP_MULTIPLY, '*' },
    { SDL_SCANCODE_KP_DIVIDE,   '/' },
    { SDL_SCANCODE_KP_ENTER,    C64_KEY_RETURN },
};

int sdl_to_c64(SDL_Scancode sdl) {
    for (int i = 0; i < sizeof(key_map)/sizeof(key_map[0]); i++) {
        if (key_map[i].sdl == sdl) return key_map[i].c64;
    }
    return -1;
}

int main(void) {
    struct DisplayInfo display_info = get_display_info(NULL);
    if (display_info.format != FORMAT_RGBA8888) {
        fprintf(stderr, "fatal: unsupported display format %u, expected RGBA8888\n", display_info.format);
        return 1;
    }
    if (display_info.width != 504 || display_info.height != 312) {
        fprintf(stderr, "fatal: unsupported display resolution %ux%u, expected 504x312\n", display_info.width, display_info.height);
        return 1;
    }
    init_audio(44100, 1, 16);
    if (!load_rom("roms/c64_chargen.rom", chargen_data, sizeof(chargen_data))) {
        return 1;
    }
    if (!load_rom("roms/c64_basic.rom", basic_data, sizeof(basic_data))) {
        return 1;
    }
    if (!load_rom("roms/c64_kernal.rom", kernal_data, sizeof(kernal_data))) {
        return 1;
    }
    if (!load_rom("roms/c1541.rom", c1541_rom, sizeof(c1541_rom))) {
        return 1;
    }
    c64_init(&sys, &(c64_desc_t){
        .roms = {
            .chars = {.ptr = chargen_data, .size = 4096},
            .basic = {.ptr = basic_data, .size = 8192},
            .kernal = {.ptr = kernal_data, .size = 8192},
            .c1541 = {
                .c000_dfff = { .ptr = c1541_rom, .size = 16384 },
                .e000_ffff = { .ptr = c1541_rom + 16384, .size = 8192  },
            },
        },
        .c1541_enabled = false,
        .audio = {
            .callback = {.func = NULL, .user_data = NULL},
            .sample_rate = 44100,
            .num_samples = C64_DEFAULT_AUDIO_SAMPLES,
        }
    });
    fill_palette();
    while (true) {
        if (key_available()) {
            SDL_Scancode key = pop_key();

            if (!(key & KEY_UP)) {
                c64_key_down(&sys, sdl_to_c64(key));
            }
            else {
                c64_key_up(&sys, sdl_to_c64(key ^ KEY_UP));
            }
        }
        c64_exec(&sys, 20000);
        for (int i = 0; i < M6569_FRAMEBUFFER_SIZE_BYTES; i++) {
            framebuffer[i] = palette[sys.fb[i] & 0xF];
        }
        show_framebuffer(framebuffer);
    }
    return 0;
}