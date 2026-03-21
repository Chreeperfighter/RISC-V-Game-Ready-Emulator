#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "rv32_audio.h"
#include "rv32_time.h"

#define WAV_PATH      "test2.wav"
#define CHUNK_SAMPLES 4096

#define MAX_QUEUE_BYTES(ch) (CHUNK_SAMPLES * 2 * (ch) * 4)

// Minimal PCM WAV parser — scans for "fmt " and "data" chunks
typedef struct {
    uint16_t channels;
    uint32_t sample_rate;
    uint16_t bits_per_sample;
} WavInfo;

static bool wav_open(FILE* f, WavInfo* out) {
    char tag[4];

    // RIFF header
    if (fread(tag, 1, 4, f) != 4 || memcmp(tag, "RIFF", 4)) return false;
    fseek(f, 4, SEEK_CUR); // skip file size
    if (fread(tag, 1, 4, f) != 4 || memcmp(tag, "WAVE", 4)) return false;

    // Scan chunks until we find "fmt " and "data"
    bool got_fmt = false;
    while (1) {
        if (fread(tag, 1, 4, f) != 4) return false;
        uint32_t chunk_size;
        if (fread(&chunk_size, 4, 1, f) != 1) return false;

        if (!memcmp(tag, "fmt ", 4)) {
            uint16_t audio_fmt, channels, block_align;
            uint32_t sample_rate, byte_rate;
            uint16_t bits;
            fread(&audio_fmt,   2, 1, f);
            fread(&channels,    2, 1, f);
            fread(&sample_rate, 4, 1, f);
            fread(&byte_rate,   4, 1, f);
            fread(&block_align, 2, 1, f);
            fread(&bits,        2, 1, f);
            if (audio_fmt != 1) { printf("FAIL: not PCM WAV\n"); return false; }
            out->channels       = channels;
            out->sample_rate    = sample_rate;
            out->bits_per_sample = bits;
            fseek(f, (long)chunk_size - 16, SEEK_CUR); // skip extra fmt bytes
            got_fmt = true;
        } else if (!memcmp(tag, "data", 4)) {
            return got_fmt; // file pointer now at start of PCM data
        } else {
            fseek(f, (long)chunk_size, SEEK_CUR); // skip unknown chunk
        }
    }
}

int main(void) {
    FILE* f = fopen(WAV_PATH, "rb");
    if (!f) { printf("FAIL: could not open %s\n", WAV_PATH); return 1; }

    WavInfo info;
    if (!wav_open(f, &info)) {
        printf("FAIL: invalid WAV file\n");
        fclose(f); return 1;
    }

    printf("WAV: %lu Hz, %d ch, %d-bit\n",
           (unsigned long)info.sample_rate, info.channels, info.bits_per_sample);

    if (!init_audio(info.sample_rate, (uint8_t)info.channels, info.bits_per_sample)) {
        printf("FAIL: init_audio\n");
        fclose(f); return 1;
    }
    printf("PASS: init_audio — playing %s\n", WAV_PATH);

    int16_t buf[CHUNK_SAMPLES * 2]; // *2 for stereo
    size_t  frames;
    size_t  frame_bytes = info.channels * (info.bits_per_sample / 8);

    while ((frames = fread(buf, frame_bytes, CHUNK_SAMPLES, f)) > 0) {
        while (get_queued_bytes() > (uint32_t)MAX_QUEUE_BYTES(info.channels))
            sleep_us(2000);
        submit_audio(buf, (uint32_t)(frames * frame_bytes));
    }

    // Let SDL finish draining before exit
    while (get_queued_bytes() > 0)
        sleep_us(5000);

    printf("PASS: playback complete\n");
    fclose(f);
    return 0;
}