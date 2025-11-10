#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "MinecraftRegular_Bmg3.h"
#include "display.h"
#include "keyboard.h"
#include "timer.h"
#include "german_keyboard_map.h"

// Constants
#define MAX_LINE_LENGTH 1024
#define MAX_COMMAND_LENGTH 64
#define MAX_ARGS_LENGTH 256
#define CURSOR_BLINK_US 500000
#define POLL_DELAY_US 32000
#define PROMPT_TEXT "mark@rv32i: "
#define PROMPT_COLOR 0x24d686
#define TEXT_COLOR 0xFFFFFF
#define ERROR_COLOR 0xdb3030
#define SECONDARY_TEXT_COLOR 0x1f879c
#define BG_COLOR 0x00000000

// Terminal state
typedef struct {
    uint8_t* framebuffer;
    fb_info_t fb_info;
    int cursor_x;
    int cursor_y;
    char input_line[MAX_LINE_LENGTH];
    uint32_t line_index;
    bool shift_pressed;
    bool cursor_visible;
    uint64_t last_blink_time;
} Terminal;

// Forward declarations
static void terminal_init(Terminal* term);
static void terminal_cleanup(Terminal* term);
static void terminal_update_cursor(Terminal* term);
static void terminal_clear_cursor(Terminal* term);
static void terminal_newline(Terminal* term);
static void terminal_print(Terminal* term, const char* text, uint32_t color);
static void terminal_print_prompt(Terminal* term);
static void terminal_handle_backspace(Terminal* term);
static void terminal_handle_enter(Terminal* term);
static void terminal_handle_char(Terminal* term, char c);
static void terminal_process_input(Terminal* term);

// Command handlers
typedef bool (*CommandHandler)(Terminal* term, const char* args);

typedef struct {
    const char* name;
    CommandHandler handler;
    const char* description;
} Command;

static bool cmd_echo(Terminal* term, const char* args);
static bool cmd_clear(Terminal* term, const char* args);
static bool cmd_help(Terminal* term, const char* args);
static bool cmd_neofetch(Terminal* term, const char* args);
// Add more command handlers here

static const Command commands[] = {
    {"neofetch", cmd_neofetch, "Print information"},
    {"echo", cmd_echo, "Print text to the screen"},
    {"clear", cmd_clear, "Clear the screen"},
    {"help", cmd_help, "Show available commands"},
    // Add more commands here
    {NULL, NULL, NULL} // Sentinel
};

// Display helper functions
static void display_glyph(const Glyph* glyph, int x, int y,
                         uint8_t* fb, const fb_info_t* fb_info, uint32_t color) {
    for (int i = 0; i < glyph->width * glyph->height; i++) {
        const uint32_t index = i >> 3;
        const uint8_t byte = glyph->data[index];
        const uint8_t bit = 7 - (i & 0x7);

        if (byte & (1 << bit)) {
            const int relative_x = i % glyph->width;
            const int relative_y = i / glyph->width;
            const int fb_x = x + glyph->x_offset + relative_x;
            const int fb_y = y + glyph->y_offset + relative_y;

            if (fb_x >= 0 && fb_x < fb_info->width &&
                fb_y >= 0 && fb_y < fb_info->height) {
                const uint32_t fb_index = (fb_x + fb_y * fb_info->width) * fb_info->bpp;
                fb[fb_index + 3] = (color >> 24) & 0xFF;
                fb[fb_index + 2] = (color >> 16) & 0xFF;
                fb[fb_index + 1] = (color >> 8) & 0xFF;
                fb[fb_index + 0] = color & 0xFF;
            }
        }
    }
}

static void display_char(char c, int* x, int y,
                        uint8_t* fb, const fb_info_t* fb_info, uint32_t color) {
    const Glyph* glyph = MinecraftRegular_Bmg3_table[(unsigned char)c];
    if (glyph != NULL) {
        display_glyph(glyph, *x, y, fb, fb_info, color);
        *x += glyph->advance;
    }
}

static void display_string(const char* str, int* x, int y,
                          uint8_t* fb, const fb_info_t* fb_info, uint32_t color) {
    for (size_t i = 0; i < strlen(str); i++) {
        display_char(str[i], x, y, fb, fb_info, color);
    }
}

// Terminal functions
static void terminal_init(Terminal* term) {
    if (get_framebuffer_info(&term->fb_info) == -1) {
        exit(1);
    }

    size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
    term->framebuffer = malloc(fb_size);
    if (term->framebuffer == NULL) {
        exit(1);
    }

    memset(term->framebuffer, 0, fb_size);
    term->cursor_x = 0;
    term->cursor_y = FONT_ASCENT;
    term->line_index = 0;
    term->shift_pressed = false;
    term->cursor_visible = false;
    term->last_blink_time = get_us();

    terminal_print_prompt(term);
}

static void terminal_cleanup(Terminal* term) {
    if (term->framebuffer) {
        free(term->framebuffer);
        term->framebuffer = NULL;
    }
}

static void terminal_clear_cursor(Terminal* term) {
    const Glyph* cursor = MinecraftRegular_Bmg3_table['_'];
    if (cursor != NULL) {
        display_glyph(cursor, term->cursor_x, term->cursor_y,
                     term->framebuffer, &term->fb_info, BG_COLOR);
    }
}

static void terminal_update_cursor(Terminal* term) {
    const uint64_t current_time = get_us();
    if (current_time - term->last_blink_time > CURSOR_BLINK_US) {
        term->last_blink_time = current_time;
        const Glyph* cursor = MinecraftRegular_Bmg3_table['_'];
        if (cursor != NULL) {
            uint32_t color = term->cursor_visible ? TEXT_COLOR : BG_COLOR;
            display_glyph(cursor, term->cursor_x, term->cursor_y,
                         term->framebuffer, &term->fb_info, color);
            show_buffer(term->framebuffer);
            term->cursor_visible = !term->cursor_visible;
        }
    }
}

static void terminal_newline(Terminal* term) {
    term->cursor_x = 0;
    term->cursor_y += FONT_LINEHEIGHT;

    // Simple scrolling if we're at the bottom
    if (term->cursor_y >= term->fb_info.height) {
        term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
        // TODO: Implement proper scrolling
    }
}

static void terminal_print(Terminal* term, const char* text, uint32_t color) {
    display_string(text, &term->cursor_x, term->cursor_y,
                  term->framebuffer, &term->fb_info, color);
}

static void terminal_print_prompt(Terminal* term) {
    terminal_print(term, PROMPT_TEXT, PROMPT_COLOR);
}

static void terminal_handle_backspace(Terminal* term) {
    if (term->line_index > 0) {
        const char c = term->input_line[--term->line_index];
        const Glyph* glyph = MinecraftRegular_Bmg3_table[(unsigned char)c];
        if (glyph != NULL) {
            term->cursor_x -= glyph->advance;
            display_glyph(glyph, term->cursor_x, term->cursor_y,
                         term->framebuffer, &term->fb_info, BG_COLOR);
        }
    }
}

static void terminal_handle_char(Terminal* term, char c) {
    const Glyph* glyph = MinecraftRegular_Bmg3_table[(unsigned char)c];
    if (glyph != NULL && term->line_index < MAX_LINE_LENGTH - 1) {
        display_glyph(glyph, term->cursor_x, term->cursor_y,
                     term->framebuffer, &term->fb_info, TEXT_COLOR);
        term->input_line[term->line_index++] = c;
        term->cursor_x += glyph->advance;
    }
}

static bool terminal_execute_command(Terminal* term, const char* input) {
    char command[MAX_COMMAND_LENGTH] = {0};
    char args[MAX_ARGS_LENGTH] = {0};

    // Parse command and arguments
    if (sscanf(input, "%63s %255[^\n]", command, args) < 1) {
        return false;
    }

    // Find and execute command
    for (int i = 0; commands[i].name != NULL; i++) {
        if (strcmp(command, commands[i].name) == 0) {
            return commands[i].handler(term, args);
        }
    }

    // Unknown command
    terminal_print(term, "Unknown command: ", ERROR_COLOR);
    terminal_print(term, command, TEXT_COLOR);
    return false;
}

static void terminal_handle_enter(Terminal* term) {
    term->input_line[term->line_index] = '\0';
    term->line_index = 0;

    terminal_newline(term);

    if (strlen(term->input_line) > 0) {
        if (!terminal_execute_command(term, term->input_line)) {
            terminal_newline(term);
        }
    }
    terminal_print_prompt(term);
}

static void terminal_process_input(Terminal* term) {
    if (!key_available()) {
        sleep_us(POLL_DELAY_US);
        terminal_update_cursor(term);
        return;
    }

    uint32_t scancode = get_key();

    // Handle key release
    if (scancode & 0x8000) {
        scancode &= 0x7FFF;
        if (scancode == SDL_SCANCODE_LSHIFT || scancode == SDL_SCANCODE_RSHIFT) {
            term->shift_pressed = false;
        }
        return;
    }

    // Handle shift press
    if (scancode == SDL_SCANCODE_LSHIFT || scancode == SDL_SCANCODE_RSHIFT) {
        term->shift_pressed = true;
        return;
    }

    // Clear cursor before typing
    terminal_clear_cursor(term);

    // Handle special keys
    if (scancode == SDL_SCANCODE_BACKSPACE) {
        terminal_handle_backspace(term);
    }
    else if (scancode == SDL_SCANCODE_RETURN) {
        terminal_handle_enter(term);
    }
    else {
        // Regular character
        char c = german_scancode_to_char(scancode, term->shift_pressed);
        terminal_handle_char(term, c);
    }

    show_buffer(term->framebuffer);
}

// Command implementations
static bool cmd_echo(Terminal* term, const char* args) {
    terminal_print(term, args, TEXT_COLOR);
    return false;
}

static bool cmd_clear(Terminal* term, const char* args) {
    (void)args; // Unused
    size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
    memset(term->framebuffer, 0, fb_size);
    term->cursor_x = 0;
    term->cursor_y = FONT_ASCENT;
    return true;
}

static bool cmd_help(Terminal* term, const char* args) {
    (void)args; // Unused
    terminal_print(term, "Available commands:", TEXT_COLOR);

    for (int i = 0; commands[i].name != NULL; i++) {
        terminal_newline(term);
        terminal_print(term, "  ", TEXT_COLOR);
        terminal_print(term, commands[i].name, PROMPT_COLOR);
        terminal_print(term, " - ", TEXT_COLOR);
        terminal_print(term, commands[i].description, TEXT_COLOR);
    }

    return false;
}

static bool cmd_neofetch(Terminal* term, const char* args) {
    (void)args;
    terminal_print(term, "OS", SECONDARY_TEXT_COLOR);
    terminal_print(term, ": None", TEXT_COLOR);
    terminal_newline(term);
    terminal_print(term, "Host", SECONDARY_TEXT_COLOR);
    terminal_print(term, ": Unknown", TEXT_COLOR);
    terminal_newline(term);
    terminal_print(term, "Kernel", SECONDARY_TEXT_COLOR);
    terminal_print(term, ": None", TEXT_COLOR);
    terminal_newline(term);
    terminal_print(term, "Uptime", SECONDARY_TEXT_COLOR);
    terminal_print(term, ": x min", TEXT_COLOR);
    terminal_newline(term);
    terminal_print(term, "Shell", SECONDARY_TEXT_COLOR);
    terminal_print(term, ": Custom", TEXT_COLOR);
    terminal_newline(term);
    terminal_print(term, "Resolution", SECONDARY_TEXT_COLOR);
    char resolution[256];
    sprintf(resolution, "%dx%d", term->fb_info.width, term->fb_info.height);
    terminal_print(term, ": ", TEXT_COLOR);
    terminal_print(term, resolution, TEXT_COLOR);
    terminal_newline(term);
    terminal_print(term, "Terminal", SECONDARY_TEXT_COLOR);
    terminal_print(term, ": Custom", TEXT_COLOR);
    terminal_newline(term);
    terminal_print(term, "CPU", SECONDARY_TEXT_COLOR);
    terminal_print(term, ": RV32I @ 200MI/s", TEXT_COLOR);
    terminal_newline(term);
    terminal_print(term, "GPU", SECONDARY_TEXT_COLOR);
    terminal_print(term, ": RV32I @ 200MI/s", TEXT_COLOR);
    terminal_newline(term);
    terminal_print(term, "Memory", SECONDARY_TEXT_COLOR);
    terminal_print(term, ": 32MB", TEXT_COLOR);
    return false;
}

// Main entry point
int main1(void) {
    Terminal term = {0};
    terminal_init(&term);

    while (1) {
        terminal_process_input(&term);
    }

    terminal_cleanup(&term);
    return 0;
}