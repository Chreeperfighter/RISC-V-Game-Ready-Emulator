#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "syscalls.h"
#include "graphics.h"

#define CELL_NUM_X 216
#define CELL_NUM_Y 216

static const uint32_t STATE_COLORS[4] = {
    0xFF000000,  // State 0: Black
    0xFFF8D949,  // State 1: Yellow
    0xFF377DF6,  // State 2: Blue
    0x00EB5128   // State 3: Red
};

struct MOUSE_POS {
    uint32_t x;
    uint32_t y;
};

uint8_t grid[CELL_NUM_Y][CELL_NUM_X];
uint8_t next_grid[CELL_NUM_Y][CELL_NUM_X];
uint8_t dirty[CELL_NUM_Y][CELL_NUM_X];

static inline uint32_t get_color(uint8_t state) {
    return (state < 4) ? STATE_COLORS[state] : 0x00000000;
}

static inline void draw_cell(uint32_t* fb, struct FB_INFO* fb_info,
                             int x, int y, int cell_size_x, int cell_size_y, uint32_t color) {
    // fb[(x * cell_size_x) + (y * cell_size_y) * fb_info->width] = color;
    draw_rectangle(fb, fb_info,
                  cell_size_x * x + 1, cell_size_y * y + 1,
                  cell_size_x * (x + 1), cell_size_y * (y + 1),
                  color, true);
}

static inline int count_neighbors(int x, int y) {
    int count = 0;
    int y_start = (y > 0) ? y - 1 : 0;
    int y_end = (y < CELL_NUM_Y - 1) ? y + 1 : CELL_NUM_Y - 1;
    int x_start = (x > 0) ? x - 1 : 0;
    int x_end = (x < CELL_NUM_X - 1) ? x + 1 : CELL_NUM_X - 1;

    for (int iy = y_start; iy <= y_end; iy++) {
        for (int ix = x_start; ix <= x_end; ix++) {
            if (ix == x && iy == y) continue;
            count += (grid[iy][ix] == 2);
        }
    }
    return count;
}

void update_generation(void) {
    memset(dirty, 0, sizeof(dirty));  // Clear dirty flags

    for (int y = 0; y < CELL_NUM_Y; y++) {
        for (int x = 0; x < CELL_NUM_X; x++) {
            uint8_t state = grid[y][x];
            uint8_t new_state = state;

            if (state == 1) {
                int neighbours = count_neighbors(x, y);
                new_state = (neighbours == 1 || neighbours == 2) ? 2 : 1;
            } else if (state == 2) {
                new_state = 3;
            } else if (state == 3) {
                new_state = 1;
            }

            next_grid[y][x] = new_state;
            if (new_state != state) {
                dirty[y][x] = 1;  // Mark as dirty
            }
        }
    }
    memcpy(grid, next_grid, sizeof(grid));
}

void render_grid(uint32_t* fb, struct FB_INFO* fb_info, int cell_size_x, int cell_size_y) {
    for (int y = 0; y < CELL_NUM_Y; y++) {
        for (int x = 0; x < CELL_NUM_X; x++) {
            if (dirty[y][x]) {  // Only draw changed cells
                draw_cell(fb, fb_info, x, y, cell_size_x, cell_size_y, get_color(grid[y][x]));
            }
        }
    }
    sys_show_framebuffer(fb);
}

int main(void) {
    struct FB_INFO fb_info;
    sys_get_framebuffer_info(&fb_info);

    if (fb_info.bpp != 4) {
        printf("Error: BPP must be 4\n");
        return 1;
    }

    uint32_t* framebuffer = calloc(fb_info.width * fb_info.height, sizeof(uint32_t));
    if (!framebuffer) {
        printf("Error: Failed to allocate framebuffer\n");
        return 1;
    }

    int cell_size_x = fb_info.width / CELL_NUM_X;
    int cell_size_y = fb_info.height / CELL_NUM_Y;

    int button_left = 0;
    int button_right = 2;
    uint32_t last_press_left = 0;
    uint32_t last_press_right = 0;
    int simulation_running = 0;

    memset(grid, 1, sizeof(grid));
    memset(dirty, 1, sizeof(dirty));
    render_grid(framebuffer, &fb_info, cell_size_x, cell_size_y);

    uint32_t last_update = 0;
    uint32_t us;

    while (1) {
        uint32_t press_left = sys_is_mouse_button_down(&button_left);
        uint32_t press_right = sys_is_mouse_button_down(&button_right);

        if (last_press_right == 0 && press_right == 1) {
            simulation_running = !simulation_running;
        }
        last_press_right = press_right;

        if (simulation_running) {
            uint32_t ok = sys_get_us(&us);
            if (ok == -1) {
                return 1;
            }
            if (us - last_update >= 0) {
                update_generation();
                render_grid(framebuffer, &fb_info, cell_size_x, cell_size_y);
                last_update = us;
            }
            sys_sleep_us(10000);
        }

        if (press_left == 1 && !simulation_running) {
            struct MOUSE_POS mouse_pos;
            sys_get_mouse_pos(&mouse_pos);

            int index_x = mouse_pos.x / cell_size_x;
            int index_y = mouse_pos.y / cell_size_y;

            if (index_x < CELL_NUM_X && index_y < CELL_NUM_Y) {
                if (last_press_left == 1) {
                    if (!grid[index_y][index_x]) {
                        grid[index_y][index_x] = 1;
                    }
                }
                else {
                    grid[index_y][index_x] = (grid[index_y][index_x] + 1) & 3;
                }
                draw_cell(framebuffer, &fb_info, index_x, index_y,
                         cell_size_x, cell_size_y, get_color(grid[index_y][index_x]));
                sys_show_framebuffer(framebuffer);
            }
        }
        last_press_left = press_left;
    }

    free(framebuffer);
    return 0;
}
