#define DOOM_IMPLEMENTATION
#include "PureDOOM.h"
#include "rv32_display.h"
#include "rv32_input.h"
#include "rv32_time.h"

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>

// ============================================================================
// CONFIGURATION
// ============================================================================

#define DOOM_WIDTH 320
#define DOOM_HEIGHT 200
#define TARGET_FPS 35
#define TARGET_FRAME_US (1000000 / TARGET_FPS)

// ============================================================================
// INPUT MAPPING
// ============================================================================

typedef struct {
    uint8_t scancode;
    int doom_key;
    bool was_down;  // Track previous state for edge detection
} KeyMapping;

// 1:1 SDL scancode value -> Doom key value
static KeyMapping key_mappings[] = {
    // Letters A-Z (SDL 4–29)
    { 4,  DOOM_KEY_A, false },
    { 5,  DOOM_KEY_B, false },
    { 6,  DOOM_KEY_C, false },
    { 7,  DOOM_KEY_D, false },
    { 8,  DOOM_KEY_E, false },
    { 9,  DOOM_KEY_F, false },
    { 10, DOOM_KEY_G, false },
    { 11, DOOM_KEY_H, false },
    { 12, DOOM_KEY_I, false },
    { 13, DOOM_KEY_J, false },
    { 14, DOOM_KEY_K, false },
    { 15, DOOM_KEY_L, false },
    { 16, DOOM_KEY_M, false },
    { 17, DOOM_KEY_N, false },
    { 18, DOOM_KEY_O, false },
    { 19, DOOM_KEY_P, false },
    { 20, DOOM_KEY_Q, false },
    { 21, DOOM_KEY_R, false },
    { 22, DOOM_KEY_S, false },
    { 23, DOOM_KEY_T, false },
    { 24, DOOM_KEY_U, false },
    { 25, DOOM_KEY_V, false },
    { 26, DOOM_KEY_W, false },
    { 27, DOOM_KEY_X, false },
    // NOTE: switched y and z for german Layout
    { 28, DOOM_KEY_Z, false },
    { 29, DOOM_KEY_Y, false },

    // Numbers 0–9 (SDL 30–39)
    { 30, DOOM_KEY_1, false },
    { 31, DOOM_KEY_2, false },
    { 32, DOOM_KEY_3, false },
    { 33, DOOM_KEY_4, false },
    { 34, DOOM_KEY_5, false },
    { 35, DOOM_KEY_6, false },
    { 36, DOOM_KEY_7, false },
    { 37, DOOM_KEY_8, false },
    { 38, DOOM_KEY_9, false },
    { 39, DOOM_KEY_0, false },

    // Control keys
    { 40, DOOM_KEY_ENTER, false },
    { 41, DOOM_KEY_ESCAPE, false },
    { 42, DOOM_KEY_BACKSPACE, false },
    { 43, DOOM_KEY_TAB, false },
    { 44, DOOM_KEY_SPACE, false },

    // Symbols
    { 45, DOOM_KEY_MINUS, false },
    { 46, DOOM_KEY_EQUALS, false },
    { 47, DOOM_KEY_LEFT_BRACKET, false },
    { 48, DOOM_KEY_RIGHT_BRACKET, false },
    // backslash has no Doom equivalent → skip
    { 51, DOOM_KEY_SEMICOLON, false },
    { 52, DOOM_KEY_APOSTROPHE, false },
    // grave has no Doom equivalent → skip
    { 54, DOOM_KEY_COMMA, false },
    { 55, DOOM_KEY_PERIOD, false },
    { 56, DOOM_KEY_SLASH, false },

    // Function keys
    { 58, DOOM_KEY_F1, false },
    { 59, DOOM_KEY_F2, false },
    { 60, DOOM_KEY_F3, false },
    { 61, DOOM_KEY_F4, false },
    { 62, DOOM_KEY_F5, false },
    { 63, DOOM_KEY_F6, false },
    { 64, DOOM_KEY_F7, false },
    { 65, DOOM_KEY_F8, false },
    { 66, DOOM_KEY_F9, false },
    { 67, DOOM_KEY_F10, false },
    { 68, DOOM_KEY_F11, false },
    { 69, DOOM_KEY_F12, false },

    // Arrows
    { 82, DOOM_KEY_UP_ARROW, false },
    { 81, DOOM_KEY_DOWN_ARROW, false },
    { 80, DOOM_KEY_LEFT_ARROW, false },
    { 79, DOOM_KEY_RIGHT_ARROW, false },

    // Modifiers (map both sides to same Doom key)
    { 224, DOOM_KEY_CTRL, false },
    { 228, DOOM_KEY_CTRL, false },
    { 225, DOOM_KEY_SHIFT, false },
    { 229, DOOM_KEY_SHIFT, false },
    { 226, DOOM_KEY_ALT, false },
    { 230, DOOM_KEY_ALT, false },

    // Pause
    { 72, DOOM_KEY_PAUSE, false },
};


#define NUM_KEY_MAPPINGS (sizeof(key_mappings) / sizeof(key_mappings[0]))

// ============================================================================
// FILE I/O - Embedded WAD Support
// ============================================================================

static void* embedded_open(const char* filename, const char* mode) {
    return (void*)fopen(filename, mode);
}

static void embedded_close(void* handle) {
    fclose((FILE*)handle);
}

static int embedded_read(void* handle, void* buf, int count) {
    return (int)fread(buf, 1, (size_t)count, (FILE*)handle);
}

static int embedded_write(void* handle, const void* buf, int count) {
    return (int)fwrite(buf, 1, (size_t)count, (FILE*)handle);
}

static int embedded_seek(void* handle, int offset, doom_seek_t origin) {
    return fseek((FILE*)handle, offset, origin);
}

static int embedded_tell(void* handle) {
    return (int)ftell((FILE*)handle);
}

static int embedded_eof(void* handle) {
    return feof((FILE*)handle);
}


// ============================================================================
// TIMING
// ============================================================================

typedef struct {
    int32_t start_us;
    int last_tics;
} TimeState;

static TimeState g_time_state = {0};

static void doom_get_time(int* sec, int* usec) {
    int32_t now = get_us(NULL);

    if (g_time_state.start_us == 0) {
        g_time_state.start_us = now;
    }

    int32_t elapsed_us = now - g_time_state.start_us;

    // Convert to DOOM tics (35 Hz = 28571 us per tic)
    int tics = elapsed_us / TARGET_FRAME_US;

    // Prevent excessive catch-up (max 2 tics per frame)
    if (tics > g_time_state.last_tics + 2) {
        tics = g_time_state.last_tics + 2;
    }

    g_time_state.last_tics = tics;

    int32_t time_us = tics * TARGET_FRAME_US;
    *sec = time_us / 1000000;
    *usec = time_us % 1000000;
}

// ============================================================================
// INPUT HANDLING - EVENT-BASED
// ============================================================================

static void process_input(void) {
    for (size_t i = 0; i < NUM_KEY_MAPPINGS; i++) {
        bool is_down = is_key_down(key_mappings[i].scancode);
        bool was_down = key_mappings[i].was_down;

        // Detect key press (transition from up to down)
        if (is_down && !was_down) {
            doom_key_down(key_mappings[i].doom_key);
        }
        // Detect key release (transition from down to up)
        else if (!is_down && was_down) {
            doom_key_up(key_mappings[i].doom_key);
        }

        // Update state for next frame
        key_mappings[i].was_down = is_down;
    }
}

// ============================================================================
// FRAME RATE LIMITING
// ============================================================================

typedef struct {
    int64_t next_frame_time;
} FrameRateLimiter;

static FrameRateLimiter g_limiter = {0};

static void limit_frame_rate(void) {
    int32_t now = get_us(NULL);
    int32_t us = g_limiter.next_frame_time - now;

    if (us > 0) {
        sleep_us(us);
        g_limiter.next_frame_time += TARGET_FRAME_US;
    } else {
        // Running behind - resync to current time
        g_limiter.next_frame_time = now + TARGET_FRAME_US;
    }
}

// ============================================================================
// INITIALIZATION
// ============================================================================

static void initialize_doom(void) {
    // Default command line: start at E1M1
    char* argv[] = {
        "doom",
        NULL
    };
    int argc = 1;

    doom_set_resolution(DOOM_WIDTH, DOOM_HEIGHT);
    doom_set_file_io(
        embedded_open,
        embedded_close,
        embedded_read,
        embedded_write,
        embedded_seek,
        embedded_tell,
        embedded_eof
    );
    doom_set_gettime(doom_get_time);
    doom_init(argc, argv, 0);

}

static void initialize_frame_limiter(void) {
    g_limiter.next_frame_time = get_us(NULL);
}

// ============================================================================
// MAIN GAME LOOP
// ============================================================================
static void run_game_loop(void) {
    struct DisplayInfo display_info = get_display_info(NULL);
    if (display_info.format != FORMAT_RGBA8888) {
        fprintf(stderr, "fatal: unsupported display format %u, expected RGBA8888\n", display_info.format);
        exit(1);
    }
    if (display_info.width != 320 || display_info.height != 200) {
        fprintf(stderr, "fatal: unsupported display resolution %ux%u, expected 320x200\n", display_info.width, display_info.height);
        exit(1);
    }
    int32_t fps_last_time = get_us(NULL);
    int fps_frame_count = 0;

    while (1) {
        process_input();
        doom_update();

        uint8_t* framebuffer = doom_get_framebuffer(4);
        show_framebuffer(framebuffer);

        fps_frame_count++;
        int32_t now = get_us(NULL);
        int32_t elapsed = now - fps_last_time;
        if (elapsed >= 1000000) {
            printf("FPS: %d\n", fps_frame_count * 1000000 / elapsed);
            fps_frame_count = 0;
            fps_last_time = now;
        }

        // limit_frame_rate();
    }
}

static void init_layout() {
    doom_set_default_int("key_up", DOOM_KEY_W);
    doom_set_default_int("key_down", DOOM_KEY_S);
    doom_set_default_int("key_left", DOOM_KEY_LEFT_ARROW);
    doom_set_default_int("Key_right", DOOM_KEY_RIGHT_ARROW);
    doom_set_default_int("key_strafeleft", DOOM_KEY_A);
    doom_set_default_int("key_straferight", DOOM_KEY_D);
    doom_set_default_int("key_fire", DOOM_KEY_F);
    doom_set_default_int("key_use", DOOM_KEY_E);
}

// ============================================================================
// ENTRY POINT
// ============================================================================

int main(int argc, char** argv) {
    (void)argc;
    (void)argv;

    init_layout();
    initialize_doom();
    initialize_frame_limiter();
    run_game_loop();

    return 0;
}