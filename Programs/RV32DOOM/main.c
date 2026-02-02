#define DOOM_IMPLEMENTATION
#include "PureDOOM.h"
#include "syscalls.h"
#include "doom1_wad.h"

#include <stdint.h>
#include <string.h>
#include <stdbool.h>

// Resolution DOOM renders at
#define WIDTH 320
#define HEIGHT 200

// Define Scancodes
#define KEYBOARD_W 26
#define KEYBOARD_A 4
#define KEYBOARD_S 22
#define KEYBOARD_D 7
#define KEYBOARD_COMMA 54
#define KEYBOARD_PERIOD 55
#define KEYBOARD_ALT 226
#define KEYBOARD_SHIFT 225
#define KEYBOARD_CTRL 224
#define KEYBOARD_SPACE 44
#define KEYBOARD_ESCAPE 41

// File handle structure for embedded WAD
typedef struct {
    const unsigned char* data;
    unsigned int size;
    unsigned int position;
} embedded_file_t;

static embedded_file_t wad_file = {0};

// Open file - only supports opening the embedded WAD
static void* open_file(const char* filename, const char* mode) {
    printf("Trying to open: %s\n", filename);
    if (strcmp(filename, "./doom1.wad") != 0) {
        return NULL;
    }

    // Accept any WAD file request and return our embedded one
    if (strstr(filename, ".wad") != NULL || strstr(filename, ".WAD") != NULL) {
        printf("Returning doom1.wad (size: %u bytes)\n", DOOM1_WAD_len);
        wad_file.data = DOOM1_WAD;
        wad_file.size = DOOM1_WAD_len;
        wad_file.position = 0;
        return &wad_file;
    }

    return NULL;
}

static void close_file(void* handle) {
    (void)handle;
}

static int read_fn(void* handle, void* buf, int count) {
    embedded_file_t* file = (embedded_file_t*)handle;

    if (file->position >= file->size) {
        return 0;
    }

    int bytes_to_read = count;
    if (file->position + bytes_to_read > file->size) {
        bytes_to_read = file->size - file->position;
    }

    memcpy(buf, file->data + file->position, bytes_to_read);
    file->position += bytes_to_read;

    return bytes_to_read;
}

static int write_fn(void* handle, const void* buf, int count) {
    (void)handle;
    (void)buf;
    (void)count;
    return 0;
}

static int seek_fn(void* handle, int offset, doom_seek_t origin) {
    embedded_file_t* file = (embedded_file_t*)handle;
    int new_position;

    switch (origin) {
        case DOOM_SEEK_SET:
            new_position = offset;
            break;
        case DOOM_SEEK_CUR:
            new_position = file->position + offset;
            break;
        case DOOM_SEEK_END:
            new_position = file->size + offset;
            break;
        default:
            return -1;
    }

    if (new_position < 0 || new_position > (int)file->size) {
        return -1;
    }

    file->position = new_position;
    return 0;
}

static int tell_fn(void* handle) {
    embedded_file_t* file = (embedded_file_t*)handle;
    return file->position;
}

static int eof_fn(void* handle) {
    embedded_file_t* file = (embedded_file_t*)handle;
    return (file->position >= file->size) ? 1 : 0;
}

void get_time(int* sec, int* usec) {
    static int32_t start_us = 0;
    static int last_tics = 0;

    int32_t now;
    sys_get_us(&now);

    if (start_us == 0)
        start_us = now;

    int32_t elapsed_us = now - start_us;

    // Convert to Doom tics (35 Hz)
    int tics = (int)(elapsed_us / 28571); // 1e6 / 35 ≈ 28571 us

    // Clamp catch-up to avoid multi-hundred-ms stalls
    if (tics > last_tics + 2)
        tics = last_tics + 2;

    last_tics = tics;

    int32_t time_us = (int32_t)tics * 28571;

    *sec  = (int)(time_us / 1000000);
    *usec = (int)(time_us % 1000000);
}


static inline int32_t now_us(void) {
    int32_t t;
    sys_get_us(&t);
    return t;
}

int main(int argc, char** argv)
{
    char* dummy_argv[] = {
        "doom",
        "-warp", "1", "1",
        "-playdemo",
        NULL
    };
    int dummy_argc = 5;

    doom_set_resolution(WIDTH, HEIGHT);
    doom_set_file_io(open_file, close_file, read_fn, write_fn, seek_fn, tell_fn, eof_fn);
    doom_set_gettime(get_time);
    doom_init(dummy_argc, dummy_argv, 0);

    const int32_t TARGET_FRAME_US = 1000000 / 35;   // ~28571 us
    const int32_t STUTTER_THRESHOLD_US = 2 * TARGET_FRAME_US; // mark big spikes

    int frame_count = 0;
    int32_t fps_timer = now_us();
    int64_t next_frame_time = now_us();
    int32_t worst_frame = 0;

    while (1) {
        int32_t t_frame_start = now_us();

        // ---- input ----
        is_key_down(KEYBOARD_W) ? doom_key_down(DOOM_KEY_UP_ARROW) : doom_key_up(DOOM_KEY_UP_ARROW);
        is_key_down(KEYBOARD_S) ? doom_key_down(DOOM_KEY_DOWN_ARROW) : doom_key_up(DOOM_KEY_DOWN_ARROW);
        is_key_down(KEYBOARD_A) ? doom_key_down(DOOM_KEY_LEFT_ARROW) : doom_key_up(DOOM_KEY_LEFT_ARROW);
        is_key_down(KEYBOARD_D) ? doom_key_down(DOOM_KEY_RIGHT_ARROW) : doom_key_up(DOOM_KEY_RIGHT_ARROW);
        is_key_down(KEYBOARD_COMMA) ? doom_key_down(DOOM_KEY_COMMA) : doom_key_up(DOOM_KEY_COMMA);
        is_key_down(KEYBOARD_PERIOD) ? doom_key_down(DOOM_KEY_PERIOD) : doom_key_up(DOOM_KEY_PERIOD);
        is_key_down(KEYBOARD_ALT) ? doom_key_down(DOOM_KEY_ALT) : doom_key_up(DOOM_KEY_ALT);
        is_key_down(KEYBOARD_SHIFT) ? doom_key_down(DOOM_KEY_SHIFT) : doom_key_up(DOOM_KEY_SHIFT);
        is_key_down(KEYBOARD_CTRL) ? doom_key_down(DOOM_KEY_CTRL) : doom_key_up(DOOM_KEY_CTRL);
        is_key_down(KEYBOARD_SPACE) ? doom_key_down(DOOM_KEY_SPACE) : doom_key_up(DOOM_KEY_SPACE);
        is_key_down(KEYBOARD_ESCAPE) ? doom_key_down(DOOM_KEY_ESCAPE) : doom_key_up(DOOM_KEY_ESCAPE);

        // ---- doom update ----
        int32_t t_update_start = now_us();
        doom_update();
        int32_t t_update_end = now_us();

        // ---- blit ----
        uint8_t* framebuffer = doom_get_framebuffer(4);
        int32_t t_blit_start = now_us();
        sys_show_framebuffer(framebuffer);
        int32_t t_blit_end = now_us();

        // ---- timing ----
        int32_t t_frame_end = now_us();

        int32_t update_us = t_update_end - t_update_start;
        int32_t blit_us   = t_blit_end   - t_blit_start;
        int32_t frame_us  = t_frame_end  - t_frame_start;

        if (frame_us > worst_frame)
            worst_frame = frame_us;

        frame_count++;

        // ---- periodic stats (once per second) ----
        if (t_frame_end - fps_timer >= 1000000) {
            double fps = (double)frame_count * 1000000.0 / (double)(t_frame_end - fps_timer);

            printf("[STATS] FPS=%.2f  avg_frame=%.2f ms  worst_frame=%.2f ms\n",
                   fps,
                   (double)(t_frame_end - fps_timer) / frame_count / 1000.0,
                   (double)worst_frame / 1000.0);

            fps_timer = t_frame_end;
            frame_count = 0;
            worst_frame = 0;
        }

        // ---- stutter detection ----
        if (frame_us > STUTTER_THRESHOLD_US) {
            printf("[STUTTER] frame=%.2f ms  update=%.2f ms  blit=%.2f ms\n",
                   (double)frame_us / 1000.0,
                   (double)update_us / 1000.0,
                   (double)blit_us / 1000.0);
        }

        next_frame_time += TARGET_FRAME_US;

        int32_t now = now_us();
        int32_t sleep_us = next_frame_time - now;

        if (sleep_us > 0) {
            sys_sleep_us(sleep_us);
        } else {
            // We’re late; resync to avoid accumulating lag
            next_frame_time = now;
        }

    }
}