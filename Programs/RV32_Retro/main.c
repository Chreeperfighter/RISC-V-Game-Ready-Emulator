#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "libretro.h"
#include "rv32_audio.h"
#include "rv32_display.h"
#include "rv32_input.h"
#include "rv32_time.h"

#define W 256
#define H 224
#define FRAME_TIME_US 16667  // ~60 FPS

static uint16_t framebuffer[512 * 240];

static bool     skip_next_frame     = false;
static uint32_t dbg_frames_rendered = 0;
static uint32_t dbg_frames_skipped  = 0;
static uint32_t dbg_report_us       = 0;

/* Render a frame. Pixel format is 15-bit 0RGB1555 native endian
 * unless changed (see RETRO_ENVIRONMENT_SET_PIXEL_FORMAT).
 *
 * Width and height specify dimensions of buffer.
 * Pitch specifices length in bytes between two lines in buffer.
 *
 * For performance reasons, it is highly recommended to have a frame
 * that is packed in memory, i.e. pitch == width * byte_per_pixel.
 * Certain graphic APIs, such as OpenGL ES, do not like textures
 * that are not packed in memory.
 */
void retro_video_refresh(const void *data, unsigned width, unsigned height, size_t pitch) {
    if (!data || skip_next_frame) {
        dbg_frames_skipped++;
        return;
    }
    dbg_frames_rendered++;
    uint8_t *dst = (uint8_t*)framebuffer;
    const uint8_t *src = (const uint8_t*)data;
    for (unsigned y = 0; y < height; ++y) {
        memcpy(dst, src, width * 2);
        dst += width * 2;
        src += pitch;
    }
    show_framebuffer(framebuffer);
}

/* Environment callback. Gives implementations a way of performing
 * uncommon tasks. Extensible. */
bool retro_environment(unsigned cmd, void *data) {
    switch (cmd) {
        case RETRO_ENVIRONMENT_SET_PIXEL_FORMAT: {
            if (*(enum retro_pixel_format*)data != RETRO_PIXEL_FORMAT_RGB565) {
                return false;
            }
            return true;
        }
        case RETRO_ENVIRONMENT_GET_CORE_OPTIONS_VERSION: {
            *(unsigned*)data = 0;
            return true;
        }
        case RETRO_ENVIRONMENT_SET_VARIABLES: {
            return true;
        }
        case RETRO_ENVIRONMENT_GET_OVERSCAN: {
            return false;
        }
        case RETRO_ENVIRONMENT_GET_INPUT_BITMASKS: {
            return true;
        }
        case RETRO_ENVIRONMENT_GET_VARIABLE_UPDATE: {
            *(bool*)data = false;
            return true;
        }
        case RETRO_ENVIRONMENT_GET_VARIABLE: {
            struct retro_variable *var = (struct retro_variable*)data;
            if (strcmp(var->key, "snes9x2002_low_pass_filter") == 0)
                var->value = "disabled";
            else
                var->value = NULL;
            return true;
        }
        case RETRO_ENVIRONMENT_SET_INPUT_DESCRIPTORS: {
            return true;
        }
        case RETRO_ENVIRONMENT_SET_AUDIO_BUFFER_STATUS_CALLBACK: {
            return false;
        }
        case RETRO_ENVIRONMENT_SET_MINIMUM_AUDIO_LATENCY: {
            return false;
        }
        default: {
            fprintf(stderr, "Unhandled command: %u\n", cmd);
            return false;
        }
    }
}

/* Renders a single audio frame. Should only be used if implementation
 * generates a single sample at a time.
 * Format is signed 16-bit native endian.
 */
void retro_audio_sample(int16_t left, int16_t right) {
}

/* Renders multiple audio frames in one go.
 *
 * One frame is defined as a sample of left and right channels, interleaved.
 * I.e. int16_t buf[4] = { l, r, l, r }; would be 2 frames.
 * Only one of the audio callbacks must ever be used.
 */
size_t retro_audio_sample_batch(const int16_t *data, size_t frames) {
    submit_audio((void*)data, frames * 2 * sizeof(int16_t));
    return frames;
}

/* Polls input. */
void retro_input_poll(void) {

}

/* Queries for input for player 'port'. device will be masked with
 * RETRO_DEVICE_MASK.
 *
 * Specialization of devices such as RETRO_DEVICE_JOYPAD_MULTITAP that
 * have been set with retro_set_controller_port_device()
 * will still use the higher level RETRO_DEVICE_JOYPAD to request input.
 */
int16_t retro_input_state(unsigned port, unsigned device, unsigned index, unsigned id) {
      if (port != 0 || device != RETRO_DEVICE_JOYPAD)
          return 0;

      if (id == RETRO_DEVICE_ID_JOYPAD_MASK) {
          int16_t mask = 0;
          if (is_key_down(SDL_SCANCODE_Z))     mask |= (1 << RETRO_DEVICE_ID_JOYPAD_B);
          if (is_key_down(SDL_SCANCODE_X))     mask |= (1 << RETRO_DEVICE_ID_JOYPAD_A);
          if (is_key_down(SDL_SCANCODE_A))     mask |= (1 << RETRO_DEVICE_ID_JOYPAD_Y);
          if (is_key_down(SDL_SCANCODE_S))     mask |= (1 << RETRO_DEVICE_ID_JOYPAD_X);
          if (is_key_down(SDL_SCANCODE_RETURN))mask |= (1 << RETRO_DEVICE_ID_JOYPAD_START);
          if (is_key_down(SDL_SCANCODE_RSHIFT))mask |= (1 << RETRO_DEVICE_ID_JOYPAD_SELECT);
          if (is_key_down(SDL_SCANCODE_UP))    mask |= (1 << RETRO_DEVICE_ID_JOYPAD_UP);
          if (is_key_down(SDL_SCANCODE_DOWN))  mask |= (1 << RETRO_DEVICE_ID_JOYPAD_DOWN);
          if (is_key_down(SDL_SCANCODE_LEFT))  mask |= (1 << RETRO_DEVICE_ID_JOYPAD_LEFT);
          if (is_key_down(SDL_SCANCODE_RIGHT)) mask |= (1 << RETRO_DEVICE_ID_JOYPAD_RIGHT);
          if (is_key_down(SDL_SCANCODE_Q))     mask |= (1 << RETRO_DEVICE_ID_JOYPAD_L);
          if (is_key_down(SDL_SCANCODE_W))     mask |= (1 << RETRO_DEVICE_ID_JOYPAD_R);
          return mask;
      }

      return 0;
  }

int main(void) {
    bool ok;
    struct DisplayInfo di = get_display_info(&ok);
    if (!ok) {
        fprintf(stderr, "fatal: SYS_GET_DISPLAY_INFO failed\n");
        return 1;
    }
    if (di.format != FORMAT_RGB565) {
        fprintf(stderr, "fatal: unsupported display format %u (expected RGB565 = %u)\n",
                di.format, FORMAT_RGB565);
        return 1;
    }
    if (di.width != W || di.height != H) {
        fprintf(stderr, "fatal: display is %ux%u but framebuffer is %ux%u\n",
                di.width, di.height, W, H);
        return 1;
    }

    if (!init_audio(32040, 2, 16)) {
        fprintf(stderr, "fatal: failed to initialize audio\n");
        return 1;
    }

    retro_set_video_refresh(retro_video_refresh);
    retro_set_environment(retro_environment);
    retro_set_audio_sample(retro_audio_sample);
    retro_set_audio_sample_batch(retro_audio_sample_batch);
    retro_set_input_poll(retro_input_poll);
    retro_set_input_state(retro_input_state);

    retro_init();

    FILE *f = fopen("./Legend of Zelda, The - A Link to the Past (USA).sfc", "rb");
    if (!f) {
        fprintf(stderr, "fatal: failed to load ROM\n");
        return 1;
    }
    fseek(f, 0, SEEK_END);
    size_t size = ftell(f);
    rewind(f);
    void *data = malloc(size);
    fread(data, 1, size, f);
    fclose(f);

    struct retro_game_info game_info = {
        "./Legend of Zelda, The - A Link to the Past (USA).sfc",
        data,
        size,
        NULL
    };

    if (!retro_load_game(&game_info)) {
        fprintf(stderr, "fatal: failed to load game\n");
        free(data);
        return 1;
    }

    dbg_report_us = get_us(NULL);
    uint32_t next_frame_us = get_us(NULL);

    while (1) {
        next_frame_us += FRAME_TIME_US;

        retro_run();

        uint32_t now = get_us(NULL);
        if (now < next_frame_us) {
            skip_next_frame = false;
            sleep_us(next_frame_us - now);
        } else {
            skip_next_frame = !skip_next_frame;  // alternate skip/render when behind
            next_frame_us = now;
        }

        // Print stats every second
        now = get_us(NULL);
        if (now - dbg_report_us >= 1000000) {
            uint32_t total = dbg_frames_rendered + dbg_frames_skipped;
            fprintf(stderr, "[perf] rendered=%lu skipped=%lu total=%lu (%.1f%% skipped)\n",
                    (unsigned long)dbg_frames_rendered,
                    (unsigned long)dbg_frames_skipped,
                    (unsigned long)total,
                    total ? 100.0f * dbg_frames_skipped / total : 0.0f);
            dbg_frames_rendered = 0;
            dbg_frames_skipped  = 0;
            dbg_report_us       = now;
        }
    }

    free(data);
}
