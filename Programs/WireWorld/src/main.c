#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "syscalls.h"
#include "graphics.h"
#include "uthash.h"

// Linker-provided symbols
extern const unsigned char _binary__Users_mark_verbeek_Data_Projects_RISC_V_Game_Ready_Emulator_Programs_WireWorld_cells_data_bin_start[];
extern const unsigned char _binary__Users_mark_verbeek_Data_Projects_RISC_V_Game_Ready_Emulator_Programs_WireWorld_cells_data_bin_end[];

// Dirty rectangle tracking for minimal redraws
struct dirty_rect {
    int32_t min_x, min_y, max_x, max_y;
    int active;
};

struct cell {
    uint32_t coord[2]; // Key (x, y)
    uint8_t state;     // Value
    uint8_t next_state; // Pre-computed next state
    uint8_t dirty;     // Needs redraw
    UT_hash_handle hh;
};

struct cell* cells = NULL;
struct dirty_rect dirty_area = {0, 0, 0, 0, 0};

// Mark cell as dirty and expand dirty rectangle
static inline void mark_dirty(int32_t x, int32_t y) {
    if (!dirty_area.active) {
        dirty_area.min_x = dirty_area.max_x = x;
        dirty_area.min_y = dirty_area.max_y = y;
        dirty_area.active = 1;
    } else {
        if (x < dirty_area.min_x) dirty_area.min_x = x;
        if (x > dirty_area.max_x) dirty_area.max_x = x;
        if (y < dirty_area.min_y) dirty_area.min_y = y;
        if (y > dirty_area.max_y) dirty_area.max_y = y;
    }
}

// Inline and optimized set_cell
static inline void set_cell_fast(uint32_t x, uint32_t y, uint8_t state) {
    struct cell* c;
    uint32_t key[2] = {x, y};

    HASH_FIND(hh, cells, key, sizeof(uint32_t) * 2, c);

    if (c) {
        if (c->state != state) {
            c->state = state;
            c->dirty = 1;
            mark_dirty(x, y);
        }
    } else {
        c = malloc(sizeof(struct cell));
        c->coord[0] = x;
        c->coord[1] = y;
        c->state = state;
        c->next_state = 0;
        c->dirty = 1;
        HASH_ADD(hh, cells, coord, sizeof(uint32_t) * 2, c);
        mark_dirty(x, y);
    }
}

void set_cell(uint32_t x, uint32_t y, uint8_t state) {
    set_cell_fast(x, y, state);
}

struct cell_entry {
    uint32_t x;
    uint32_t y;
    uint8_t state;
    uint8_t padding[3];
} __attribute__((packed));

void load_cells(void) {
    const uint8_t* data = _binary__Users_mark_verbeek_Data_Projects_RISC_V_Game_Ready_Emulator_Programs_WireWorld_cells_data_bin_start;

    uint32_t num_cells = *(const uint32_t*)data;
    data += 4;

    const struct cell_entry* entries = (const struct cell_entry*)data;

    // Batch allocate cells
    for (uint32_t i = 0; i < num_cells; i++) {
        set_cell_fast(entries[i].x, entries[i].y, entries[i].state);
    }

    printf("Loaded %u cells\n", num_cells);
}

// Inline get_cell for speed
static inline uint8_t get_cell(uint32_t x, uint32_t y) {
    struct cell* c;
    uint32_t key[2] = {x, y};

    HASH_FIND(hh, cells, key, sizeof(uint32_t) * 2, c);
    return c ? c->state : 0;
}

// Get cell pointer (faster for multiple operations)
static inline struct cell* get_cell_ptr(uint32_t x, uint32_t y) {
    struct cell* c;
    uint32_t key[2] = {x, y};
    HASH_FIND(hh, cells, key, sizeof(uint32_t) * 2, c);
    return c;
}

void delete_cell(uint32_t x, uint32_t y) {
    struct cell* c = get_cell_ptr(x, y);
    if (c) {
        HASH_DEL(cells, c);
        free(c);
        mark_dirty(x, y);
    }
}

static const uint32_t STATE_COLORS[4] = {
    0xFF000000,  // State 0: Black (empty)
    0xFFF8D949,  // State 1: Yellow (conductor)
    0xFF377DF6,  // State 2: Blue (electron head)
    0xFFEB5128   // State 3: Red (electron tail)
};

struct MOUSE_POS {
    uint32_t x;
    uint32_t y;
};

int32_t camera_x = 0;
int32_t camera_y = 0;
int32_t cell_size = 10;

static inline uint32_t get_color(uint8_t state) {
    return STATE_COLORS[state & 3];
}

static inline void draw_cell(uint32_t* fb, struct FB_INFO* fb_info,
                             int screen_x, int screen_y, int size, uint32_t color) {
    // Bounds check before drawing
    if (screen_x < 0 || screen_y < 0 ||
        screen_x + size > fb_info->width || screen_y + size > fb_info->height)
        return;

    // When zoomed out (small cells), draw without borders for better performance and visibility
    if (size < 4) {
        draw_rectangle(fb, fb_info,
                      screen_x, screen_y,
                      screen_x + size - 1, screen_y + size - 1,
                      color);
    } else {
        // When zoomed in, add 1-pixel border (gap) for clarity
        draw_rectangle(fb, fb_info,
                      screen_x + 1, screen_y + 1,
                      screen_x + size - 1, screen_y + size - 1,
                      color);
    }
}

// Optimized neighbor counting - unrolled loop with direct state access
static inline int count_neighbors(int32_t x, int32_t y) {
    int count = 0;
    // Unroll the 8 neighbor checks
    count += (get_cell(x-1, y-1) == 2);
    count += (get_cell(x,   y-1) == 2);
    count += (get_cell(x+1, y-1) == 2);
    count += (get_cell(x-1, y)   == 2);
    count += (get_cell(x+1, y)   == 2);
    count += (get_cell(x-1, y+1) == 2);
    count += (get_cell(x,   y+1) == 2);
    count += (get_cell(x+1, y+1) == 2);
    return count;
}

// Highly optimized update - only process cells that can change
void update_generation(void) {
    struct cell *c, *tmp;

    // Only conductors (state 1) can change based on neighbors
    // States 2 and 3 always transition deterministically
    // We only need to check conductors near electron heads

    // Phase 1: Mark deterministic transitions (no neighbor checks needed)
    HASH_ITER(hh, cells, c, tmp) {
        if (c->state == 2) {
            c->next_state = 3; // Electron head -> tail
        } else if (c->state == 3) {
            c->next_state = 1; // Electron tail -> conductor
        } else if (c->state == 0) {
            c->next_state = 0; // Empty stays empty
        } else {
            c->next_state = 1; // Default: conductor stays conductor
        }
    }

    // Phase 2: Process conductors near electron heads
    // Build a quick list of electron heads
    HASH_ITER(hh, cells, c, tmp) {
        if (c->state == 2) { // Electron head
            int32_t hx = c->coord[0];
            int32_t hy = c->coord[1];

            // Check all 8 neighbors for conductors
            for (int dy = -1; dy <= 1; dy++) {
                for (int dx = -1; dx <= 1; dx++) {
                    if (dx == 0 && dy == 0) continue;

                    int32_t nx = hx + dx;
                    int32_t ny = hy + dy;

                    struct cell* neighbor = get_cell_ptr(nx, ny);
                    if (neighbor && neighbor->state == 1) {
                        // This conductor needs to count its electron head neighbors
                        // Count all electron heads around this conductor
                        int count = 0;
                        for (int ndy = -1; ndy <= 1 && count <= 2; ndy++) {
                            for (int ndx = -1; ndx <= 1 && count <= 2; ndx++) {
                                if (ndx == 0 && ndy == 0) continue;

                                struct cell* check = get_cell_ptr(nx + ndx, ny + ndy);
                                if (check && check->state == 2) {
                                    count++;
                                }
                            }
                        }

                        // Update based on count
                        if (count == 1 || count == 2) {
                            neighbor->next_state = 2;
                        }
                    }
                }
            }
        }
    }

    // Phase 3: Apply states and mark dirty
    HASH_ITER(hh, cells, c, tmp) {
        if (c->next_state != c->state) {
            c->dirty = 1;
            mark_dirty(c->coord[0], c->coord[1]);
            // Mark neighbors as dirty
            for (int dy = -1; dy <= 1; dy++) {
                for (int dx = -1; dx <= 1; dx++) {
                    mark_dirty(c->coord[0] + dx, c->coord[1] + dy);
                }
            }
        }
        c->state = c->next_state;
    }

    // Phase 4: Remove dead cells
    struct cell* to_remove = NULL;
    HASH_ITER(hh, cells, c, tmp) {
        if (c->state == 0) {
            HASH_DEL(cells, c);
            c->hh.next = to_remove;
            to_remove = c;
        }
    }

    while (to_remove) {
        struct cell* next = to_remove->hh.next;
        free(to_remove);
        to_remove = next;
    }
}

// Optimized render - only redraw dirty rectangles
void render_grid(uint32_t* fb, struct FB_INFO* fb_info, int force_full) {
    int32_t min_x, max_x, min_y, max_y;

    if (force_full || !dirty_area.active) {
        // Full redraw
        memset(fb, 0, fb_info->width * fb_info->height * sizeof(uint32_t));
        min_x = camera_x;
        max_x = camera_x + (fb_info->width / cell_size) + 1;
        min_y = camera_y;
        max_y = camera_y + (fb_info->height / cell_size) + 1;
    } else {
        // Partial redraw - expand dirty area slightly for safety
        min_x = dirty_area.min_x - 1;
        max_x = dirty_area.max_x + 1;
        min_y = dirty_area.min_y - 1;
        max_y = dirty_area.max_y + 1;

        // Clear dirty area on screen
        int screen_min_x = (min_x - camera_x) * cell_size;
        int screen_min_y = (min_y - camera_y) * cell_size;
        int screen_max_x = (max_x - camera_x + 1) * cell_size;
        int screen_max_y = (max_y - camera_y + 1) * cell_size;

        // Clamp to screen bounds
        if (screen_min_x < 0) screen_min_x = 0;
        if (screen_min_y < 0) screen_min_y = 0;
        if (screen_max_x > fb_info->width) screen_max_x = fb_info->width;
        if (screen_max_y > fb_info->height) screen_max_y = fb_info->height;

        // Clear the dirty rectangle
        for (int y = screen_min_y; y < screen_max_y; y++) {
            memset(&fb[y * fb_info->width + screen_min_x], 0,
                   (screen_max_x - screen_min_x) * sizeof(uint32_t));
        }
    }

    // Precompute for loop invariants
    int inv_cell_size = cell_size;
    int cam_x = camera_x;
    int cam_y = camera_y;
    int width = fb_info->width;
    int height = fb_info->height;

    // When extremely zoomed out (cells are 1-2 pixels), use optimized batch rendering
    if (cell_size <= 2) {
        struct cell *c, *tmp;
        HASH_ITER(hh, cells, c, tmp) {
            int32_t x = c->coord[0];
            int32_t y = c->coord[1];

            // Quick viewport check
            if (x < min_x || x > max_x || y < min_y || y > max_y)
                continue;

            int screen_x = (x - cam_x) * inv_cell_size;
            int screen_y = (y - cam_y) * inv_cell_size;

            if (screen_x >= 0 && screen_x < width && screen_y >= 0 && screen_y < height) {
                // Direct pixel write for maximum speed at tiny sizes
                uint32_t color = get_color(c->state);
                for (int dy = 0; dy < inv_cell_size && screen_y + dy < height; dy++) {
                    for (int dx = 0; dx < inv_cell_size && screen_x + dx < width; dx++) {
                        fb[(screen_y + dy) * width + screen_x + dx] = color;
                    }
                }
            }

            c->dirty = 0;
        }
    } else {
        // Normal rendering for larger cell sizes
        struct cell *c, *tmp;
        HASH_ITER(hh, cells, c, tmp) {
            int32_t x = c->coord[0];
            int32_t y = c->coord[1];

            // Quick viewport check
            if (x < min_x || x > max_x || y < min_y || y > max_y)
                continue;

            int screen_x = (x - cam_x) * inv_cell_size;
            int screen_y = (y - cam_y) * inv_cell_size;

            if (screen_x >= 0 && screen_x < width && screen_y >= 0 && screen_y < height) {
                draw_cell(fb, fb_info, screen_x, screen_y, inv_cell_size, get_color(c->state));
            }

            c->dirty = 0;
        }
    }

    sys_show_framebuffer(fb);

    // Reset dirty area
    dirty_area.active = 0;
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

    int button_left = 0;
    int button_right = 2;
    uint32_t last_press_left = 0;
    uint32_t last_press_right = 0;
    int simulation_running = 0;

    int32_t last_clicked_x = -1;
    int32_t last_clicked_y = -1;

    load_cells();
    render_grid(framebuffer, &fb_info, 1); // Force full initial render

    // Timing control
    uint32_t last_update_time = 0;
    uint32_t last_input_time = 0;
    uint32_t us;

    const uint32_t UPDATE_INTERVAL_US = 100000;  // 10 iterations/second (100ms)
    const uint32_t INPUT_INTERVAL_US = 33333;     // ~30 inputs/second (33.3ms)

    int needs_render = 0;
    int force_full_render = 0;

    // Performance tracking
    uint32_t frame_count = 0;
    uint32_t last_stats_time = 0;
    uint64_t total_update_time = 0;
    uint64_t total_render_time = 0;
    uint32_t update_count = 0;
    uint32_t render_count = 0;

    // Get initial time
    sys_get_us(&us);
    last_update_time = us;
    last_input_time = us;
    last_stats_time = us;

    while (1) {
        sys_get_us(&us);

        // Input processing at 30 Hz
        if (us - last_input_time >= INPUT_INTERVAL_US) {
            last_input_time = us;

            uint32_t press_left = sys_is_mouse_button_down(&button_left);
            uint32_t press_right = sys_is_mouse_button_down(&button_right);

            if (key_available()) {
                uint32_t key = get_key();
                int32_t move_speed = (50 / cell_size) + 1;

                switch(key) {
                    case 44:
                        simulation_running = !simulation_running;
                        printf("Simulation %s\n", simulation_running ? "started" : "paused");
                        break;
                    case 4:
                        camera_x -= move_speed;
                        needs_render = 1;
                        force_full_render = 1;
                        break;
                    case 7:
                        camera_x += move_speed;
                        needs_render = 1;
                        force_full_render = 1;
                        break;
                    case 26:
                        camera_y -= move_speed;
                        needs_render = 1;
                        force_full_render = 1;
                        break;
                    case 22:
                        camera_y += move_speed;
                        needs_render = 1;
                        force_full_render = 1;
                        break;
                    case 48:
                        if (cell_size < 50) {
                            int32_t center_grid_x = camera_x + (fb_info.width / cell_size) / 2;
                            int32_t center_grid_y = camera_y + (fb_info.height / cell_size) / 2;
                            cell_size++;
                            camera_x = center_grid_x - (fb_info.width / cell_size) / 2;
                            camera_y = center_grid_y - (fb_info.height / cell_size) / 2;
                            needs_render = 1;
                            force_full_render = 1;
                        }
                        break;
                    case 56:
                        if (cell_size > 1) {
                            int32_t center_grid_x = camera_x + (fb_info.width / cell_size) / 2;
                            int32_t center_grid_y = camera_y + (fb_info.height / cell_size) / 2;
                            cell_size--;
                            camera_x = center_grid_x - (fb_info.width / cell_size) / 2;
                            camera_y = center_grid_y - (fb_info.height / cell_size) / 2;
                            needs_render = 1;
                            force_full_render = 1;
                        }
                        break;
                }
            }

            if (!simulation_running) {
                struct MOUSE_POS mouse_pos;
                sys_get_mouse_pos(&mouse_pos);

                int32_t grid_x = camera_x + (mouse_pos.x / cell_size);
                int32_t grid_y = camera_y + (mouse_pos.y / cell_size);

                if (press_left == 1) {
                    if (last_press_left == 0) {
                        uint8_t current = get_cell(grid_x, grid_y);
                        uint8_t next = (current == 0) ? 1 : (current == 3) ? 1 : current + 1;
                        set_cell_fast(grid_x, grid_y, next);
                        last_clicked_x = grid_x;
                        last_clicked_y = grid_y;
                        needs_render = 1;
                    } else {
                        if (grid_x != last_clicked_x || grid_y != last_clicked_y) {
                            if (get_cell(grid_x, grid_y) == 0) {
                                set_cell_fast(grid_x, grid_y, 1);
                                needs_render = 1;
                            }
                            last_clicked_x = grid_x;
                            last_clicked_y = grid_y;
                        }
                    }
                } else {
                    last_clicked_x = -1;
                    last_clicked_y = -1;
                }

                if (press_right == 1 && get_cell(grid_x, grid_y) != 0) {
                    delete_cell(grid_x, grid_y);
                    needs_render = 1;
                }
            }

            last_press_left = press_left;
            last_press_right = press_right;
        }

        // Simulation update at 10 Hz
        if (simulation_running && (us - last_update_time >= UPDATE_INTERVAL_US)) {
            uint32_t update_start;
            sys_get_us(&update_start);

            update_generation();
            needs_render = 1;

            uint32_t update_end;
            sys_get_us(&update_end);
            total_update_time += (update_end - update_start);
            update_count++;

            last_update_time = us;
        }

        // Rendering (as fast as needed, but optimized with dirty rectangles)
        if (needs_render) {
            uint32_t render_start;
            sys_get_us(&render_start);

            render_grid(framebuffer, &fb_info, force_full_render);

            uint32_t render_end;
            sys_get_us(&render_end);
            total_render_time += (render_end - render_start);
            render_count++;

            needs_render = 0;
            force_full_render = 0;
            frame_count++;
        }

        // Print performance stats every second
        if (us - last_stats_time >= 1000000) {
            if (update_count > 0 || render_count > 0) {
                printf("=== Performance Stats ===\n");
                printf("FPS: %u | Cell count: %u\n", frame_count, HASH_COUNT(cells));

                if (update_count > 0) {
                    printf("Avg update time: %u us (%.2f ms)\n",
                           (uint32_t)(total_update_time / update_count),
                           (total_update_time / update_count) / 1000.0);
                }

                if (render_count > 0) {
                    printf("Avg render time: %u us (%.2f ms)\n",
                           (uint32_t)(total_render_time / render_count),
                           (total_render_time / render_count) / 1000.0);
                }

                if (simulation_running) {
                    printf("Updates/sec: %u (target: 10)\n", update_count);
                }
                printf("========================\n");
            }

            // Reset counters
            frame_count = 0;
            total_update_time = 0;
            total_render_time = 0;
            update_count = 0;
            render_count = 0;
            last_stats_time = us;
        }

        // Small sleep to prevent CPU spinning (1ms)
        sys_sleep_us(1000);
    }

    struct cell *c, *tmp;
    HASH_ITER(hh, cells, c, tmp) {
        HASH_DEL(cells, c);
        free(c);
    }
    free(framebuffer);
    return 0;
}