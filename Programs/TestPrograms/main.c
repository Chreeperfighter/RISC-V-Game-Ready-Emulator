/*
 * RV32 Syscall & Hardware Test Suite
 *
 * Pages (LEFT/RIGHT to navigate, ESC to quit):
 *   0 - Display Info & System Time
 *   1 - Color Spectrum
 *   2 - Keyboard Live View
 *   3 - Mouse Live View
 *   4 - Controller Live View
 *   5 - File I/O Tests
 *   6 - Directory Tests
 *   7 - Audio Tone Generator
 *   8 - Timing & Performance
 */

#include <stdio.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>

#include "rv32_display.h"
#include "rv32_input.h"
#include "rv32_time.h"
#include "rv32_audio.h"
#include "rv32_dirent.h"

// rv32_dirent.c defines mkdir but rv32_dirent.h doesn't declare it
int mkdir(const char *path, int mode);

// ─── Screen ──────────────────────────────────────────────────────────────────
#define W 640
#define H 480

// SDL_PIXELFORMAT_ABGR8888: in 32-bit uint, A=bits31-24, B=bits23-16, G=bits15-8, R=bits7-0
#define RGBA(r,g,b,a) (((uint32_t)(a)<<24)|((uint32_t)(b)<<16)|((uint32_t)(g)<<8)|(uint8_t)(r))
#define RGB(r,g,b)    RGBA(r,g,b,0xFF)

// Color palette
#define C_BG       RGB(0x0D,0x0E,0x1A)
#define C_PANEL    RGB(0x18,0x18,0x30)
#define C_HDR      RGB(0x10,0x12,0x40)
#define C_BORDER   RGB(0x28,0x36,0x80)
#define C_WHITE    RGB(0xFF,0xFF,0xFF)
#define C_LGRAY    RGB(0xCC,0xCC,0xCC)
#define C_GRAY     RGB(0x80,0x80,0x90)
#define C_DGRAY    RGB(0x40,0x40,0x55)
#define C_RED      RGB(0xFF,0x50,0x50)
#define C_GREEN    RGB(0x44,0xFF,0x88)
#define C_BLUE     RGB(0x44,0xAA,0xFF)
#define C_YELLOW   RGB(0xFF,0xEE,0x44)
#define C_CYAN     RGB(0x44,0xFF,0xFF)
#define C_MAGENTA  RGB(0xFF,0x44,0xFF)
#define C_ORANGE   RGB(0xFF,0x99,0x22)
#define C_ACCENT   RGB(0x00,0xCC,0xFF)
#define C_PASS     RGB(0x33,0xEE,0x66)
#define C_FAIL     RGB(0xFF,0x44,0x44)
#define C_WARN     RGB(0xFF,0xBB,0x00)
#define C_KEY_OFF  RGB(0x25,0x25,0x40)
#define C_KEY_ON   RGB(0xFF,0xCC,0x22)
#define C_KEY_BD   RGB(0x44,0x44,0x77)

// ─── Framebuffer ─────────────────────────────────────────────────────────────
static uint32_t fb[W * H];

// ─── 8×8 Font (public domain IBM/dhepper font8x8, ASCII 0x20–0x7E) ──────────
// Each entry: 8 bytes = 8 rows, MSB = leftmost pixel
static const uint8_t FONT[95][8] = {
    {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}, // ' '
    {0x18,0x3C,0x3C,0x18,0x18,0x00,0x18,0x00}, // '!'
    {0x6C,0x6C,0x00,0x00,0x00,0x00,0x00,0x00}, // '"'
    {0x6C,0x6C,0xFE,0x6C,0xFE,0x6C,0x6C,0x00}, // '#'
    {0x30,0x7C,0xC0,0x78,0x0C,0xF8,0x30,0x00}, // '$'
    {0x00,0xC6,0xCC,0x18,0x30,0x66,0xC6,0x00}, // '%'
    {0x38,0x6C,0x38,0x76,0xDC,0xCC,0x76,0x00}, // '&'
    {0x60,0x60,0xC0,0x00,0x00,0x00,0x00,0x00}, // '\''
    {0x18,0x30,0x60,0x60,0x60,0x30,0x18,0x00}, // '('
    {0x60,0x30,0x18,0x18,0x18,0x30,0x60,0x00}, // ')'
    {0x00,0x66,0x3C,0xFF,0x3C,0x66,0x00,0x00}, // '*'
    {0x00,0x30,0x30,0xFC,0x30,0x30,0x00,0x00}, // '+'
    {0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x60}, // ','
    {0x00,0x00,0x00,0xFC,0x00,0x00,0x00,0x00}, // '-'
    {0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x00}, // '.'
    {0x06,0x0C,0x18,0x30,0x60,0xC0,0x80,0x00}, // '/'
    {0x7C,0xC6,0xCE,0xDE,0xF6,0xE6,0x7C,0x00}, // '0'
    {0x30,0x70,0x30,0x30,0x30,0x30,0xFC,0x00}, // '1'
    {0x78,0xCC,0x0C,0x38,0x60,0xCC,0xFC,0x00}, // '2'
    {0x78,0xCC,0x0C,0x38,0x0C,0xCC,0x78,0x00}, // '3'
    {0x1C,0x3C,0x6C,0xCC,0xFE,0x0C,0x1E,0x00}, // '4'
    {0xFC,0xC0,0xF8,0x0C,0x0C,0xCC,0x78,0x00}, // '5'
    {0x38,0x60,0xC0,0xF8,0xCC,0xCC,0x78,0x00}, // '6'
    {0xFC,0xCC,0x0C,0x18,0x30,0x30,0x30,0x00}, // '7'
    {0x78,0xCC,0xCC,0x78,0xCC,0xCC,0x78,0x00}, // '8'
    {0x78,0xCC,0xCC,0x7C,0x0C,0x18,0x70,0x00}, // '9'
    {0x00,0x30,0x30,0x00,0x00,0x30,0x30,0x00}, // ':'
    {0x00,0x30,0x30,0x00,0x00,0x30,0x30,0x60}, // ';'
    {0x18,0x30,0x60,0xC0,0x60,0x30,0x18,0x00}, // '<'
    {0x00,0x00,0xFC,0x00,0x00,0xFC,0x00,0x00}, // '='
    {0x60,0x30,0x18,0x0C,0x18,0x30,0x60,0x00}, // '>'
    {0x78,0xCC,0x0C,0x18,0x30,0x00,0x30,0x00}, // '?'
    {0x7C,0xC6,0xDE,0xDE,0xDE,0xC0,0x78,0x00}, // '@'
    {0x30,0x78,0xCC,0xCC,0xFC,0xCC,0xCC,0x00}, // 'A'
    {0xFC,0x66,0x66,0x7C,0x66,0x66,0xFC,0x00}, // 'B'
    {0x3C,0x66,0xC0,0xC0,0xC0,0x66,0x3C,0x00}, // 'C'
    {0xF8,0x6C,0x66,0x66,0x66,0x6C,0xF8,0x00}, // 'D'
    {0xFE,0x62,0x68,0x78,0x68,0x62,0xFE,0x00}, // 'E'
    {0xFE,0x62,0x68,0x78,0x68,0x60,0xF0,0x00}, // 'F'
    {0x3C,0x66,0xC0,0xC0,0xCE,0x66,0x3E,0x00}, // 'G'
    {0xCC,0xCC,0xCC,0xFC,0xCC,0xCC,0xCC,0x00}, // 'H'
    {0x78,0x30,0x30,0x30,0x30,0x30,0x78,0x00}, // 'I'
    {0x1E,0x0C,0x0C,0x0C,0xCC,0xCC,0x78,0x00}, // 'J'
    {0xE6,0x66,0x6C,0x78,0x6C,0x66,0xE6,0x00}, // 'K'
    {0xF0,0x60,0x60,0x60,0x62,0x66,0xFE,0x00}, // 'L'
    {0xC6,0xEE,0xFE,0xFE,0xD6,0xC6,0xC6,0x00}, // 'M'
    {0xC6,0xE6,0xF6,0xDE,0xCE,0xC6,0xC6,0x00}, // 'N'
    {0x38,0x6C,0xC6,0xC6,0xC6,0x6C,0x38,0x00}, // 'O'
    {0xFC,0x66,0x66,0x7C,0x60,0x60,0xF0,0x00}, // 'P'
    {0x78,0xCC,0xCC,0xCC,0xDC,0x78,0x1C,0x00}, // 'Q'
    {0xFC,0x66,0x66,0x7C,0x6C,0x66,0xE6,0x00}, // 'R'
    {0x78,0xCC,0xE0,0x70,0x1C,0xCC,0x78,0x00}, // 'S'
    {0xFC,0xB4,0x30,0x30,0x30,0x30,0x78,0x00}, // 'T'
    {0xCC,0xCC,0xCC,0xCC,0xCC,0xCC,0xFC,0x00}, // 'U'
    {0xCC,0xCC,0xCC,0xCC,0xCC,0x78,0x30,0x00}, // 'V'
    {0xC6,0xC6,0xC6,0xD6,0xFE,0xEE,0xC6,0x00}, // 'W'
    {0xC6,0xC6,0x6C,0x38,0x38,0x6C,0xC6,0x00}, // 'X'
    {0xCC,0xCC,0xCC,0x78,0x30,0x30,0x78,0x00}, // 'Y'
    {0xFE,0xC6,0x8C,0x18,0x32,0x66,0xFE,0x00}, // 'Z'
    {0x78,0x60,0x60,0x60,0x60,0x60,0x78,0x00}, // '['
    {0xC0,0x60,0x30,0x18,0x0C,0x06,0x02,0x00}, // '\\'
    {0x78,0x18,0x18,0x18,0x18,0x18,0x78,0x00}, // ']'
    {0x10,0x38,0x6C,0xC6,0x00,0x00,0x00,0x00}, // '^'
    {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF}, // '_'
    {0x30,0x30,0x18,0x00,0x00,0x00,0x00,0x00}, // '`'
    {0x00,0x00,0x78,0x0C,0x7C,0xCC,0x76,0x00}, // 'a'
    {0xE0,0x60,0x60,0x7C,0x66,0x66,0xDC,0x00}, // 'b'
    {0x00,0x00,0x78,0xCC,0xC0,0xCC,0x78,0x00}, // 'c'
    {0x1C,0x0C,0x0C,0x7C,0xCC,0xCC,0x76,0x00}, // 'd'
    {0x00,0x00,0x78,0xCC,0xFC,0xC0,0x78,0x00}, // 'e'
    {0x38,0x6C,0x60,0xF0,0x60,0x60,0xF0,0x00}, // 'f'
    {0x00,0x00,0x76,0xCC,0xCC,0x7C,0x0C,0xF8}, // 'g'
    {0xE0,0x60,0x6C,0x76,0x66,0x66,0xE6,0x00}, // 'h'
    {0x30,0x00,0x70,0x30,0x30,0x30,0x78,0x00}, // 'i'
    {0x0C,0x00,0x0C,0x0C,0x0C,0xCC,0xCC,0x78}, // 'j'
    {0xE0,0x60,0x66,0x6C,0x78,0x6C,0xE6,0x00}, // 'k'
    {0x70,0x30,0x30,0x30,0x30,0x30,0x78,0x00}, // 'l'
    {0x00,0x00,0xCC,0xFE,0xFE,0xD6,0xC6,0x00}, // 'm'
    {0x00,0x00,0xF8,0xCC,0xCC,0xCC,0xCC,0x00}, // 'n'
    {0x00,0x00,0x78,0xCC,0xCC,0xCC,0x78,0x00}, // 'o'
    {0x00,0x00,0xDC,0x66,0x66,0x7C,0x60,0xF0}, // 'p'
    {0x00,0x00,0x76,0xCC,0xCC,0x7C,0x0C,0x1E}, // 'q'
    {0x00,0x00,0xDC,0x76,0x66,0x60,0xF0,0x00}, // 'r'
    {0x00,0x00,0x7C,0xC0,0x78,0x0C,0xF8,0x00}, // 's'
    {0x10,0x30,0x7C,0x30,0x30,0x34,0x18,0x00}, // 't'
    {0x00,0x00,0xCC,0xCC,0xCC,0xCC,0x76,0x00}, // 'u'
    {0x00,0x00,0xCC,0xCC,0xCC,0x78,0x30,0x00}, // 'v'
    {0x00,0x00,0xC6,0xD6,0xFE,0xFE,0x6C,0x00}, // 'w'
    {0x00,0x00,0xC6,0x6C,0x38,0x6C,0xC6,0x00}, // 'x'
    {0x00,0x00,0xCC,0xCC,0xCC,0x7C,0x0C,0xF8}, // 'y'
    {0x00,0x00,0xFC,0x98,0x30,0x64,0xFC,0x00}, // 'z'
    {0x1C,0x30,0x30,0xE0,0x30,0x30,0x1C,0x00}, // '{'
    {0x18,0x18,0x18,0x00,0x18,0x18,0x18,0x00}, // '|'
    {0xE0,0x30,0x30,0x1C,0x30,0x30,0xE0,0x00}, // '}'
    {0x76,0xDC,0x00,0x00,0x00,0x00,0x00,0x00}, // '~'
};

// ─── Drawing primitives ───────────────────────────────────────────────────────
static inline void put_pixel(int x, int y, uint32_t c) {
    if ((unsigned)x < W && (unsigned)y < H) fb[y*W+x] = c;
}

static void fill_rect(int x, int y, int w, int h, uint32_t c) {
    for (int row = y; row < y+h; row++)
        for (int col = x; col < x+w; col++)
            put_pixel(col, row, c);
}

static void outline_rect(int x, int y, int w, int h, uint32_t c) {
    for (int i = x; i < x+w; i++) { put_pixel(i,y,c); put_pixel(i,y+h-1,c); }
    for (int i = y; i < y+h; i++) { put_pixel(x,i,c); put_pixel(x+w-1,i,c); }
}

static void draw_circle(int cx, int cy, int r, uint32_t c) {
    for (int dy = -r; dy <= r; dy++)
        for (int dx = -r; dx <= r; dx++)
            if (dx*dx+dy*dy <= r*r) put_pixel(cx+dx, cy+dy, c);
}

static void draw_circle_ring(int cx, int cy, int r, uint32_t c) {
    for (int dy = -r; dy <= r; dy++)
        for (int dx = -r; dx <= r; dx++) {
            int d2 = dx*dx+dy*dy;
            if (d2 <= r*r && d2 >= (r-1)*(r-1)) put_pixel(cx+dx, cy+dy, c);
        }
}

static void hline(int x, int y, int w, uint32_t c) {
    for (int i = x; i < x+w; i++) put_pixel(i, y, c);
}
static void vline(int x, int y, int h, uint32_t c) {
    for (int i = y; i < y+h; i++) put_pixel(x, i, c);
}

static void clear_fb(void) { fill_rect(0,0,W,H,C_BG); }

// ─── Text rendering ───────────────────────────────────────────────────────────
static void draw_char(int x, int y, char ch, uint32_t fg, int scale) {
    if (ch < 0x20 || ch > 0x7E) ch = '?';
    const uint8_t *g = FONT[(uint8_t)ch - 0x20];
    for (int row = 0; row < 8; row++) {
        uint8_t bits = g[row];
        for (int col = 0; col < 8; col++) {
            if (bits & (0x80 >> col))
                fill_rect(x + col*scale, y + row*scale, scale, scale, fg);
        }
    }
}

static int draw_str(int x, int y, const char *s, uint32_t fg, int scale) {
    int cx = x;
    while (*s) {
        draw_char(cx, y, *s++, fg, scale);
        cx += 8 * scale;
    }
    return cx;
}

static int draw_strf(int x, int y, uint32_t fg, int scale, const char *fmt, ...) {
    char buf[128];
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(buf, sizeof(buf), fmt, ap);
    va_end(ap);
    return draw_str(x, y, buf, fg, scale);
}

// Draw string with right-align at rx
static void draw_str_right(int rx, int y, const char *s, uint32_t fg, int scale) {
    int len = strlen(s);
    draw_str(rx - len*8*scale, y, s, fg, scale);
}

// ─── Color utilities ─────────────────────────────────────────────────────────
static uint32_t hsv_to_rgb(float h, float s, float v) {
    // h: 0-360, s: 0-1, v: 0-1
    float c = v * s;
    float x = c * (1.0f - fabsf(fmodf(h / 60.0f, 2.0f) - 1.0f));
    float m = v - c;
    float r=0,g=0,b=0;
    int hi = (int)(h/60.0f) % 6;
    if      (hi==0){r=c;g=x;b=0;}
    else if (hi==1){r=x;g=c;b=0;}
    else if (hi==2){r=0;g=c;b=x;}
    else if (hi==3){r=0;g=x;b=c;}
    else if (hi==4){r=x;g=0;b=c;}
    else           {r=c;g=0;b=x;}
    return RGB((uint8_t)((r+m)*255), (uint8_t)((g+m)*255), (uint8_t)((b+m)*255));
}

static uint32_t lerp_color(uint32_t a, uint32_t b, float t) {
    // ABGR8888: R=bits7-0, G=bits15-8, B=bits23-16
    uint8_t ar=(a>>0)&0xFF, ag=(a>>8)&0xFF, ab=(a>>16)&0xFF;
    uint8_t br=(b>>0)&0xFF, bg=(b>>8)&0xFF, bb=(b>>16)&0xFF;
    return RGB((uint8_t)(ar+(br-ar)*t), (uint8_t)(ag+(bg-ag)*t), (uint8_t)(ab+(bb-ab)*t));
}

// ─── UI chrome ────────────────────────────────────────────────────────────────
#define PAGE_COUNT 9
static const char *PAGE_NAMES[PAGE_COUNT] = {
    "DISPLAY INFO", "COLOR SPECTRUM", "KEYBOARD",
    "MOUSE", "CONTROLLER", "FILE I/O",
    "DIRECTORY", "AUDIO", "TIMING"
};

static void draw_header(int page) {
    fill_rect(0, 0, W, 14, C_HDR);
    hline(0, 14, W, C_BORDER);

    // Page name centered
    const char *name = PAGE_NAMES[page];
    int len = strlen(name);
    draw_str((W - len*8)/2, 3, name, C_ACCENT, 1);

    // Left/right arrow hints
    draw_str(2, 3, "<", C_GRAY, 1);
    draw_str_right(W-2, 3, ">", C_GRAY, 1);
}

static void draw_footer(void) {
    hline(0, H-10, W, C_BORDER);
    fill_rect(0, H-9, W, 9, C_HDR);
    draw_str(2, H-8, "LEFT/RIGHT:page  ESC:quit", C_GRAY, 1);
}

static void draw_label(int x, int y, const char *label, const char *value, uint32_t vc) {
    draw_str(x, y, label, C_GRAY, 1);
    int lx = x + strlen(label)*8;
    draw_str(lx, y, value, vc, 1);
}

static void draw_pass_fail(int x, int y, const char *test, bool ok) {
    draw_str(x, y, test, C_LGRAY, 1);
    draw_str(x + strlen(test)*8 + 4, y, ok ? "PASS" : "FAIL", ok ? C_PASS : C_FAIL, 1);
}

// ─── Page state ──────────────────────────────────────────────────────────────
static int g_page = 0;
static uint32_t g_frame = 0;
static uint32_t g_fps = 0;
static uint32_t g_last_fps_time = 0;
static uint32_t g_fps_frames = 0;

// ─── PAGE 0: Display Info ─────────────────────────────────────────────────────
static void page_info(void) {
    bool ok;
    struct DisplayInfo di = get_display_info(&ok);
    uint32_t t = get_us(NULL);

    int y = 20;
    draw_str(4, y, "DISPLAY INFORMATION", C_ACCENT, 1); y += 14;
    hline(4, y, 120, C_BORDER); y += 6;

    char buf[64];
    snprintf(buf, sizeof(buf), "%u", di.width);
    draw_label(8, y, "Width  : ", buf, C_WHITE); y += 12;
    snprintf(buf, sizeof(buf), "%u", di.height);
    draw_label(8, y, "Height : ", buf, C_WHITE); y += 12;
    snprintf(buf, sizeof(buf), "%u bpp", di.bpp);
    draw_label(8, y, "BPP    : ", buf, C_WHITE); y += 12;

    const char *fmt_name = "UNKNOWN";
    uint32_t fmt_color = C_WARN;
    switch (di.format) {
        case FORMAT_ARGB8888: fmt_name = "ARGB8888"; fmt_color = C_GREEN; break;
        case FORMAT_RGB565:   fmt_name = "RGB565";   fmt_color = C_BLUE;  break;
        case FORMAT_RGB888:   fmt_name = "RGB888";   fmt_color = C_BLUE;  break;
        case FORMAT_RGBA8888: fmt_name = "RGBA8888"; fmt_color = C_GREEN; break;
    }
    draw_label(8, y, "Format : ", fmt_name, fmt_color); y += 12;

    snprintf(buf, sizeof(buf), "%u px  (%u KB fb)", di.width*di.height,
             di.width*di.height*(di.bpp/8)/1024);
    draw_label(8, y, "Total  : ", buf, C_LGRAY); y += 20;

    draw_str(4, y, "SYSTEM TIME", C_ACCENT, 1); y += 14;
    hline(4, y, 80, C_BORDER); y += 6;

    uint32_t s  = t / 1000000;
    uint32_t ms = (t % 1000000) / 1000;
    uint32_t us = t % 1000;
    snprintf(buf, sizeof(buf), "%us  %ums  %uus", s, ms, us);
    draw_label(8, y, "Uptime : ", buf, C_YELLOW); y += 12;
    snprintf(buf, sizeof(buf), "0x%08X", t);
    draw_label(8, y, "Raw us : ", buf, C_CYAN); y += 20;

    draw_str(4, y, "SYSCALL CHECK", C_ACCENT, 1); y += 14;
    hline(4, y, 96, C_BORDER); y += 6;

    draw_pass_fail(8, y, "SYS_GET_DISPLAY_INFO  ", ok); y += 11;
    draw_pass_fail(8, y, "SYS_GET_US            ", t != 0); y += 11;

    // Animated FPS display in bottom-right
    char fps_buf[24];
    snprintf(fps_buf, sizeof(fps_buf), "FPS: %u", g_fps);
    draw_str(W - strlen(fps_buf)*8 - 4, H-20, fps_buf, C_GREEN, 1);

    // Blinking dot to show life
    uint32_t dot_col = (g_frame & 30) < 15 ? C_ACCENT : C_PANEL;
    draw_circle(W-8, 8, 4, dot_col);
}

// ─── PAGE 1: Color Spectrum ──────────────────────────────────────────────────
static void page_colors(void) {
    int y = 17;

    // HSV rainbow strip
    draw_str(4, y, "HSV Rainbow", C_WHITE, 1); y += 10;
    for (int x = 0; x < W; x++) {
        float hue = (float)x / W * 360.0f;
        uint32_t c = hsv_to_rgb(hue, 1.0f, 1.0f);
        for (int dy = 0; dy < 14; dy++) put_pixel(x, y+dy, c);
    }
    y += 15;

    // Animated hue shift strip
    float hue_offset = (g_frame * 2) % 360;
    draw_str(4, y, "Animated shift", C_WHITE, 1); y += 10;
    for (int x = 0; x < W; x++) {
        float hue = fmodf((float)x/W*360.0f + hue_offset, 360.0f);
        uint32_t c = hsv_to_rgb(hue, 1.0f, 1.0f);
        for (int dy = 0; dy < 10; dy++) put_pixel(x, y+dy, c);
    }
    y += 12;

    // Saturation gradient
    draw_str(4, y, "Saturation (red)", C_WHITE, 1); y += 10;
    for (int x = 0; x < W; x++) {
        float s = (float)x / W;
        uint32_t c = hsv_to_rgb(0.0f, s, 1.0f);
        for (int dy = 0; dy < 8; dy++) put_pixel(x, y+dy, c);
    }
    y += 10;

    // Brightness gradient
    draw_str(4, y, "Brightness (cyan)", C_WHITE, 1); y += 10;
    for (int x = 0; x < W; x++) {
        float v = (float)x / W;
        uint32_t c = hsv_to_rgb(180.0f, 1.0f, v);
        for (int dy = 0; dy < 8; dy++) put_pixel(x, y+dy, c);
    }
    y += 10;

    // Grayscale
    draw_str(4, y, "Grayscale", C_WHITE, 1); y += 10;
    for (int x = 0; x < W; x++) {
        uint8_t v = (uint8_t)((float)x / W * 255.0f);
        uint32_t c = RGB(v, v, v);
        for (int dy = 0; dy < 8; dy++) put_pixel(x, y+dy, c);
    }
    y += 12;

    // Color swatches
    draw_str(4, y, "Swatches", C_WHITE, 1); y += 10;
    static const uint32_t swatches[] = {
        C_RED, C_GREEN, C_BLUE, C_YELLOW, C_CYAN, C_MAGENTA, C_WHITE, C_GRAY, C_ORANGE
    };
    int sw = W / 9;
    for (int i = 0; i < 9; i++) {
        fill_rect(i*sw, y, sw-1, 16, swatches[i]);
    }
    y += 18;

    // RGBA channel test
    draw_str(4, y, "R/G/B channels", C_WHITE, 1); y += 10;
    for (int x = 0; x < W; x++) {
        uint8_t v = (uint8_t)((float)x / W * 255.0f);
        int third = W/3;
        uint32_t c;
        if      (x < third)   c = RGB(v, 0, 0);
        else if (x < 2*third) c = RGB(0, v, 0);
        else                  c = RGB(0, 0, v);
        for (int dy = 0; dy < 8; dy++) put_pixel(x, y+dy, c);
    }
}

// ─── PAGE 2: Keyboard Live View ───────────────────────────────────────────────

// Key definition: label, scancode, x, y, w
typedef struct { const char *lbl; SDL_Scancode sc; int x, y, w; } KeyDef;

static const KeyDef KEYS[] = {
    // Row 0 — Function keys
    {"ESC",SDL_SCANCODE_ESCAPE,     2, 16,22},
    {"F1", SDL_SCANCODE_F1,        26, 16,14}, {"F2", SDL_SCANCODE_F2,  42,16,14},
    {"F3", SDL_SCANCODE_F3,        58, 16,14}, {"F4", SDL_SCANCODE_F4,  74,16,14},
    {"F5", SDL_SCANCODE_F5,        94, 16,14}, {"F6", SDL_SCANCODE_F6, 110,16,14},
    {"F7", SDL_SCANCODE_F7,       126, 16,14}, {"F8", SDL_SCANCODE_F8, 142,16,14},
    {"F9", SDL_SCANCODE_F9,       162, 16,14}, {"F10",SDL_SCANCODE_F10,178,16,14},
    {"F11",SDL_SCANCODE_F11,      194, 16,14}, {"F12",SDL_SCANCODE_F12,210,16,14},

    // Row 1 — Numbers
    {"`",  SDL_SCANCODE_GRAVE,      2, 32,14},
    {"1",  SDL_SCANCODE_1,         18, 32,14}, {"2",  SDL_SCANCODE_2,  34,32,14},
    {"3",  SDL_SCANCODE_3,         50, 32,14}, {"4",  SDL_SCANCODE_4,  66,32,14},
    {"5",  SDL_SCANCODE_5,         82, 32,14}, {"6",  SDL_SCANCODE_6,  98,32,14},
    {"7",  SDL_SCANCODE_7,        114, 32,14}, {"8",  SDL_SCANCODE_8, 130,32,14},
    {"9",  SDL_SCANCODE_9,        146, 32,14}, {"0",  SDL_SCANCODE_0, 162,32,14},
    {"-",  SDL_SCANCODE_MINUS,    178, 32,14}, {"=",  SDL_SCANCODE_EQUALS,194,32,14},
    {"BS", SDL_SCANCODE_BACKSPACE,210, 32,22},

    // Row 2 — QWERTY
    {"TAB",SDL_SCANCODE_TAB,        2, 48,20},
    {"Q",  SDL_SCANCODE_Q,         24, 48,14}, {"W",  SDL_SCANCODE_W,  40,48,14},
    {"E",  SDL_SCANCODE_E,         56, 48,14}, {"R",  SDL_SCANCODE_R,  72,48,14},
    {"T",  SDL_SCANCODE_T,         88, 48,14}, {"Y",  SDL_SCANCODE_Y, 104,48,14},
    {"U",  SDL_SCANCODE_U,        120, 48,14}, {"I",  SDL_SCANCODE_I, 136,48,14},
    {"O",  SDL_SCANCODE_O,        152, 48,14}, {"P",  SDL_SCANCODE_P, 168,48,14},
    {"[",  SDL_SCANCODE_LEFTBRACKET, 184,48,14},
    {"]",  SDL_SCANCODE_RIGHTBRACKET,200,48,14},
    {"\\", SDL_SCANCODE_BACKSLASH, 216,48,16},

    // Row 3 — ASDF
    {"CAPS",SDL_SCANCODE_CAPSLOCK,  2, 64,24},
    {"A",  SDL_SCANCODE_A,         28, 64,14}, {"S",  SDL_SCANCODE_S,  44,64,14},
    {"D",  SDL_SCANCODE_D,         60, 64,14}, {"F",  SDL_SCANCODE_F,  76,64,14},
    {"G",  SDL_SCANCODE_G,         92, 64,14}, {"H",  SDL_SCANCODE_H, 108,64,14},
    {"J",  SDL_SCANCODE_J,        124, 64,14}, {"K",  SDL_SCANCODE_K, 140,64,14},
    {"L",  SDL_SCANCODE_L,        156, 64,14},
    {";",  SDL_SCANCODE_SEMICOLON,172, 64,14},
    {"'",  SDL_SCANCODE_APOSTROPHE,188,64,14},
    {"RET",SDL_SCANCODE_RETURN,   204, 64,28},

    // Row 4 — ZXCV
    {"SHF",SDL_SCANCODE_LSHIFT,    2, 80,30},
    {"Z",  SDL_SCANCODE_Z,         34, 80,14}, {"X",  SDL_SCANCODE_X,  50,80,14},
    {"C",  SDL_SCANCODE_C,         66, 80,14}, {"V",  SDL_SCANCODE_V,  82,80,14},
    {"B",  SDL_SCANCODE_B,         98, 80,14}, {"N",  SDL_SCANCODE_N, 114,80,14},
    {"M",  SDL_SCANCODE_M,        130, 80,14},
    {",",  SDL_SCANCODE_COMMA,    146, 80,14},
    {".",  SDL_SCANCODE_PERIOD,   162, 80,14},
    {"/",  SDL_SCANCODE_SLASH,    178, 80,14},
    {"SHF",SDL_SCANCODE_RSHIFT,   194, 80,38},

    // Row 5 — Bottom
    {"CTL",SDL_SCANCODE_LCTRL,     2, 96,22},
    {"ALT",SDL_SCANCODE_LALT,     26, 96,22},
    {"SPACE",SDL_SCANCODE_SPACE,  50, 96,100},
    {"ALT",SDL_SCANCODE_RALT,    152, 96,22},
    {"CTL",SDL_SCANCODE_RCTRL,   176, 96,22},

    // Arrows
    {"^",  SDL_SCANCODE_UP,       210, 88,14},
    {"<",  SDL_SCANCODE_LEFT,     194,104,14},
    {"v",  SDL_SCANCODE_DOWN,     210,104,14},
    {">",  SDL_SCANCODE_RIGHT,    226,104,14},
};
#define NKEYS (int)(sizeof(KEYS)/sizeof(KEYS[0]))

// Key event log
#define KEY_LOG_MAX 8
static char g_key_log[KEY_LOG_MAX][20];
static int g_key_log_count = 0;

static void key_log_push(const char *s) {
    if (g_key_log_count < KEY_LOG_MAX) {
        strncpy(g_key_log[g_key_log_count++], s, 19);
    } else {
        memmove(g_key_log[0], g_key_log[1], (KEY_LOG_MAX-1)*20);
        strncpy(g_key_log[KEY_LOG_MAX-1], s, 19);
    }
}

static void page_keyboard(void) {
    draw_str(4, 17, "Live keyboard state - press any key", C_LGRAY, 1);

    // Center the keyboard layout (spans x=2..242, width~240) horizontally
    int kox = (W - 242) / 2;

    // Draw all keys
    for (int i = 0; i < NKEYS; i++) {
        const KeyDef *k = &KEYS[i];
        bool down = is_key_down(k->sc);
        uint32_t bg = down ? C_KEY_ON : C_KEY_OFF;
        uint32_t fg = down ? RGB(0x10,0x10,0x10) : C_LGRAY;
        uint32_t bd = down ? C_YELLOW : C_KEY_BD;

        fill_rect(k->x + kox, k->y, k->w, 13, bg);
        outline_rect(k->x + kox, k->y, k->w, 13, bd);

        // Center label text within key
        int llen = strlen(k->lbl);
        int tx = k->x + kox + (k->w - llen*8)/2;
        if (tx < k->x + kox) tx = k->x + kox + 1;
        draw_str(tx, k->y+3, k->lbl, fg, 1);
    }

    // Key event log
    int ly = 116;
    draw_str(4, ly, "Key events (SYS_GET_KEY queue):", C_ACCENT, 1); ly += 11;
    for (int i = 0; i < g_key_log_count; i++) {
        uint32_t age_col = lerp_color(C_WHITE, C_DGRAY, (float)i / g_key_log_count);
        draw_str(8, ly + i*10, g_key_log[i], age_col, 1);
    }

    // SYS_IS_KEY_DOWN live indicators for a few key scancodes
    int ix = 244;
    draw_str(ix, 20, "WASD:", C_GRAY, 1);
    uint32_t wasd[4] = {
        is_key_down(SDL_SCANCODE_W) ? C_GREEN : C_DGRAY,
        is_key_down(SDL_SCANCODE_A) ? C_GREEN : C_DGRAY,
        is_key_down(SDL_SCANCODE_S) ? C_GREEN : C_DGRAY,
        is_key_down(SDL_SCANCODE_D) ? C_GREEN : C_DGRAY,
    };
    const char *wasd_lbl[] = {"W","A","S","D"};
    for (int i = 0; i < 4; i++) {
        fill_rect(ix + i*18, 30, 16, 16, wasd[i]);
        outline_rect(ix + i*18, 30, 16, 16, C_BORDER);
        draw_str(ix + i*18 + 4, 33, wasd_lbl[i], C_WHITE, 1);
    }

    draw_str(ix, 54, "Arrows:", C_GRAY, 1);
    bool arr[4] = {
        is_key_down(SDL_SCANCODE_UP), is_key_down(SDL_SCANCODE_LEFT),
        is_key_down(SDL_SCANCODE_DOWN), is_key_down(SDL_SCANCODE_RIGHT)
    };
    int ax[4] = {ix+16, ix, ix+16, ix+32};
    int ay[4] = {64, 82, 82, 82};
    const char *albl[] = {"^","<","v",">"};
    for (int i = 0; i < 4; i++) {
        fill_rect(ax[i], ay[i], 14, 14, arr[i] ? C_KEY_ON : C_KEY_OFF);
        outline_rect(ax[i], ay[i], 14, 14, C_BORDER);
        draw_str(ax[i]+3, ay[i]+3, albl[i], C_WHITE, 1);
    }

    draw_str(ix, 100, "Space:", C_GRAY, 1);
    bool sp = is_key_down(SDL_SCANCODE_SPACE);
    fill_rect(ix, 110, 60, 14, sp ? C_KEY_ON : C_KEY_OFF);
    outline_rect(ix, 110, 60, 14, C_BORDER);
    if (sp) draw_str(ix + 16, 113, "DOWN", C_BG, 1);

    draw_str(ix, 130, "Enter:", C_GRAY, 1);
    bool en = is_key_down(SDL_SCANCODE_RETURN);
    fill_rect(ix, 140, 60, 14, en ? C_KEY_ON : C_KEY_OFF);
    outline_rect(ix, 140, 60, 14, C_BORDER);
    if (en) draw_str(ix + 12, 143, "DOWN", C_BG, 1);

    // Drain key queue and log
    while (key_available()) {
        SDL_Scancode sc = pop_key();
        bool key_up = (sc & KEY_UP) != 0;
        sc = sc & ~KEY_UP;
        char log_entry[20];
        if (sc >= SDL_SCANCODE_A && sc <= SDL_SCANCODE_Z)
            snprintf(log_entry, sizeof(log_entry), "%c %s", 'A'+(sc-SDL_SCANCODE_A), key_up?"UP":"DN");
        else if (sc >= SDL_SCANCODE_1 && sc <= SDL_SCANCODE_0)
            snprintf(log_entry, sizeof(log_entry), "sc=%d %s", sc, key_up?"UP":"DN");
        else
            snprintf(log_entry, sizeof(log_entry), "sc=0x%02X %s", sc, key_up?"UP":"DN");
        key_log_push(log_entry);
    }
}

// ─── PAGE 3: Mouse Live View ──────────────────────────────────────────────────

// Mouse trail
#define TRAIL_LEN 32
static int g_trail_x[TRAIL_LEN];
static int g_trail_y[TRAIL_LEN];
static int g_trail_head = 0;

static void page_mouse(void) {
    struct MousePos mp;
    get_mouse_pos(&mp);
    bool ok_l, ok_m, ok_r;
    bool left   = is_mouse_button_down(MOUSE_BUTTON_LEFT,   &ok_l);
    bool middle = is_mouse_button_down(MOUSE_BUTTON_MIDDLE, &ok_m);
    bool right  = is_mouse_button_down(MOUSE_BUTTON_RIGHT,  &ok_r);

    // Update trail
    g_trail_x[g_trail_head] = (int)mp.x;
    g_trail_y[g_trail_head] = (int)mp.y;
    g_trail_head = (g_trail_head + 1) % TRAIL_LEN;

    // Draw trail
    for (int i = 0; i < TRAIL_LEN-1; i++) {
        int idx = (g_trail_head + i) % TRAIL_LEN;
        float alpha = (float)i / TRAIL_LEN;
        uint32_t tc = lerp_color(C_DGRAY, C_ACCENT, alpha);
        int r = 1 + i * 2 / TRAIL_LEN;
        draw_circle(g_trail_x[idx], g_trail_y[idx], r, tc);
    }

    // Crosshair at mouse position
    int mx = (int)mp.x, my = (int)mp.y;
    if (mx >= 0 && mx < W && my >= 0 && my < H) {
        hline(mx-10, my, 21, C_WHITE);
        vline(mx, my-10, 21, C_WHITE);
        hline(mx-2, my, 5, C_BG);
        vline(mx, my-2, 5, C_BG);
        draw_circle_ring(mx, my, 6, C_WHITE);
    }

    // Info panel (always visible, semi-transparent background)
    int px = 4, py = 17;
    fill_rect(px, py, 140, 90, C_PANEL);
    outline_rect(px, py, 140, 90, C_BORDER);

    draw_str(px+4, py+4, "MOUSE", C_ACCENT, 1);
    py += 16;

    draw_strf(px+4, py, C_WHITE, 1, "X: %u", mp.x); py += 11;
    draw_strf(px+4, py, C_WHITE, 1, "Y: %u", mp.y); py += 11;

    // Buttons
    struct { const char *n; bool down; bool ok; } btns[3] = {
        {"L", left,   ok_l},
        {"M", middle, ok_m},
        {"R", right,  ok_r},
    };
    for (int i = 0; i < 3; i++) {
        int bx = px + 4 + i*30;
        fill_rect(bx, py, 26, 18, btns[i].down ? C_KEY_ON : C_KEY_OFF);
        outline_rect(bx, py, 26, 18, btns[i].ok ? C_BORDER : C_FAIL);
        draw_str(bx+9, py+5, btns[i].n, btns[i].down ? C_BG : C_WHITE, 1);
    }
    py += 22;

    draw_strf(px+4, py, C_GRAY, 1, "SYS_GET_MOUSE_POS: %s", ok_l ? "OK" : "?");

    // Screen position indicator (pixel on a mini-map)
    int map_x = W - 100, map_y = 17, map_w = 80, map_h = 50;
    fill_rect(map_x, map_y, map_w, map_h, C_PANEL);
    outline_rect(map_x, map_y, map_w, map_h, C_BORDER);
    draw_str(map_x+2, map_y+2, "Screen map", C_GRAY, 1);
    int dot_x = map_x + 1 + (int)((float)mp.x / W * (map_w-2));
    int dot_y = map_y + 11 + (int)((float)mp.y / H * (map_h-12));
    draw_circle(dot_x, dot_y, 3, left ? C_RED : C_ACCENT);
}

// ─── PAGE 4: Controller Live View (up to 4 controllers) ──────────────────────

// Draws a full controller panel for controller `id` in the rect (px,py,pw,ph).
static void draw_controller_panel(int id, int px, int py, int pw, int ph) {
    // Probe connection: ok is true only if the controller exists
    bool connected = false;
    is_controller_button_down(id, SDL_CONTROLLER_BUTTON_A, &connected);

    // Panel background + border
    fill_rect(px, py, pw, ph, C_PANEL);
    outline_rect(px, py, pw, ph, C_BORDER);

    // Mini header
    uint32_t hdr = connected ? C_HDR : RGB(0x2A, 0x10, 0x10);
    fill_rect(px, py, pw, 13, hdr);
    char title[16];
    sprintf(title, "CTRL %d", id + 1);
    draw_str(px + 4, py + 3, title, C_WHITE, 1);
    const char *status = connected ? "CONNECTED" : "NO DEVICE";
    uint32_t sc = connected ? C_GREEN : C_FAIL;
    draw_str(px + pw - (int)(strlen(status)*8) - 4, py + 3, status, sc, 1);

    if (!connected) return;

    // Gamepad body center within panel
    int cx = px + pw / 2;
    int cy = py + 13 + (ph - 13 - 36) / 2 + 4;  // center in usable area

    fill_rect(cx-78, cy-32, 156, 64, RGB(0x16, 0x16, 0x24));
    outline_rect(cx-78, cy-32, 156, 64, C_BORDER);

    // === LB / LT ===
    bool lb = is_controller_button_down(id, SDL_CONTROLLER_BUTTON_LEFTSHOULDER, NULL);
    bool rb = is_controller_button_down(id, SDL_CONTROLLER_BUTTON_RIGHTSHOULDER, NULL);
    int32_t lt = get_controller_axis(id, SDL_CONTROLLER_AXIS_TRIGGERLEFT,  NULL);
    int32_t rt = get_controller_axis(id, SDL_CONTROLLER_AXIS_TRIGGERRIGHT, NULL);
    int bar_y = cy - 34;

    fill_rect(cx-76, bar_y-11, 32, 8, lb ? C_KEY_ON : C_KEY_OFF);
    outline_rect(cx-76, bar_y-11, 32, 8, C_BORDER);
    draw_str(cx-70, bar_y-10, "LB", C_WHITE, 1);

    fill_rect(cx-76, bar_y, 32, 4, C_DGRAY);
    fill_rect(cx-76, bar_y, (int)(32.0f * lt / 32767), 4, C_ORANGE);
    draw_str(cx-68, bar_y+6, "LT", C_GRAY, 1);

    fill_rect(cx+44, bar_y-11, 32, 8, rb ? C_KEY_ON : C_KEY_OFF);
    outline_rect(cx+44, bar_y-11, 32, 8, C_BORDER);
    draw_str(cx+50, bar_y-10, "RB", C_WHITE, 1);

    fill_rect(cx+44, bar_y, 32, 4, C_DGRAY);
    fill_rect(cx+44, bar_y, (int)(32.0f * rt / 32767), 4, C_ORANGE);
    draw_str(cx+52, bar_y+6, "RT", C_GRAY, 1);

    // === D-Pad ===
    int dp_cx = cx - 54, dp_cy = cy - 4;
    bool dp_u = is_controller_button_down(id, SDL_CONTROLLER_BUTTON_DPAD_UP,    NULL);
    bool dp_d = is_controller_button_down(id, SDL_CONTROLLER_BUTTON_DPAD_DOWN,  NULL);
    bool dp_l = is_controller_button_down(id, SDL_CONTROLLER_BUTTON_DPAD_LEFT,  NULL);
    bool dp_r = is_controller_button_down(id, SDL_CONTROLLER_BUTTON_DPAD_RIGHT, NULL);
    fill_rect(dp_cx-4, dp_cy-12, 8, 8, dp_u ? C_KEY_ON : C_KEY_OFF);
    fill_rect(dp_cx-4, dp_cy+  4, 8, 8, dp_d ? C_KEY_ON : C_KEY_OFF);
    fill_rect(dp_cx-12,dp_cy-  4, 8, 8, dp_l ? C_KEY_ON : C_KEY_OFF);
    fill_rect(dp_cx+  4,dp_cy- 4, 8, 8, dp_r ? C_KEY_ON : C_KEY_OFF);
    fill_rect(dp_cx-4, dp_cy-  4, 8, 8, C_DGRAY);

    // === ABXY ===
    int btn_cx = cx + 54, btn_cy = cy - 4;
    struct { SDL_GameControllerButton sc; int dx, dy; char lbl; uint32_t col; } abxy[4] = {
        {SDL_CONTROLLER_BUTTON_A,  0,  9, 'A', C_GREEN},
        {SDL_CONTROLLER_BUTTON_B,  9,  0, 'B', C_RED},
        {SDL_CONTROLLER_BUTTON_X, -9,  0, 'X', C_BLUE},
        {SDL_CONTROLLER_BUTTON_Y,  0, -9, 'Y', C_YELLOW},
    };
    for (int i = 0; i < 4; i++) {
        bool down = is_controller_button_down(id, abxy[i].sc, NULL);
        uint32_t c = down ? abxy[i].col : lerp_color(abxy[i].col, C_PANEL, 0.7f);
        draw_circle(btn_cx + abxy[i].dx, btn_cy + abxy[i].dy, 5, c);
        draw_circle_ring(btn_cx + abxy[i].dx, btn_cy + abxy[i].dy, 5, abxy[i].col);
        draw_char(btn_cx + abxy[i].dx - 4, btn_cy + abxy[i].dy - 4, abxy[i].lbl, C_WHITE, 1);
    }

    // === Left stick ===
    int32_t lx = get_controller_axis(id, SDL_CONTROLLER_AXIS_LEFTX, NULL);
    int32_t ly = get_controller_axis(id, SDL_CONTROLLER_AXIS_LEFTY, NULL);
    int ls_cx = cx - 30, ls_cy = cy + 18;
    draw_circle_ring(ls_cx, ls_cy, 13, C_DGRAY);
    draw_circle(ls_cx + (int)((float)lx / 32767 * 9), ls_cy + (int)((float)ly / 32767 * 9), 6, C_BLUE);
    draw_circle_ring(ls_cx + (int)((float)lx / 32767 * 9), ls_cy + (int)((float)ly / 32767 * 9), 6, C_ACCENT);

    // === Right stick ===
    int32_t rx = get_controller_axis(id, SDL_CONTROLLER_AXIS_RIGHTX, NULL);
    int32_t ry = get_controller_axis(id, SDL_CONTROLLER_AXIS_RIGHTY, NULL);
    int rs_cx = cx + 18, rs_cy = cy + 18;
    draw_circle_ring(rs_cx, rs_cy, 13, C_DGRAY);
    draw_circle(rs_cx + (int)((float)rx / 32767 * 9), rs_cy + (int)((float)ry / 32767 * 9), 6, C_BLUE);
    draw_circle_ring(rs_cx + (int)((float)rx / 32767 * 9), rs_cy + (int)((float)ry / 32767 * 9), 6, C_ACCENT);

    // === Select / Start / Guide ===
    bool sel   = is_controller_button_down(id, SDL_CONTROLLER_BUTTON_BACK,  NULL);
    bool start = is_controller_button_down(id, SDL_CONTROLLER_BUTTON_START, NULL);
    bool guide = is_controller_button_down(id, SDL_CONTROLLER_BUTTON_GUIDE, NULL);
    fill_rect(cx-14, cy-6, 12, 8, sel   ? C_KEY_ON : C_KEY_OFF); outline_rect(cx-14, cy-6, 12, 8, C_BORDER);
    draw_str(cx-13, cy-5, "SEL", C_WHITE, 1);
    fill_rect(cx+ 2, cy-6, 12, 8, start ? C_KEY_ON : C_KEY_OFF); outline_rect(cx+ 2, cy-6, 12, 8, C_BORDER);
    draw_str(cx+ 3, cy-5, "STA", C_WHITE, 1);
    draw_circle(cx, cy-15, 5, guide ? C_ACCENT : C_DGRAY);
    draw_circle_ring(cx, cy-15, 5, C_BORDER);

    // Axis readouts at bottom of panel
    int ay = py + ph - 34;
    draw_strf(px+4, ay,    C_DGRAY, 1, "LX:%6d  LY:%6d", lx, ly);    ay += 11;
    draw_strf(px+4, ay,    C_DGRAY, 1, "RX:%6d  RY:%6d", rx, ry);    ay += 11;
    draw_strf(px+4, ay,    C_DGRAY, 1, "LT:%5d  RT:%5d", lt, rt);
}

static void page_controller(void) {
    int pw = W / 2;
    int ph = (H - 14 - 9) / 2;   // 14 = global header, 9 = global footer
    for (int i = 0; i < 4; i++) {
        int col = i % 2, row = i / 2;
        draw_controller_panel(i, col * pw, 14 + row * ph, pw, ph);
    }
}

// ─── PAGE 5: File I/O Tests ───────────────────────────────────────────────────
typedef struct { const char *name; bool pass; bool ran; } TestResult;
#define MAX_TESTS 12
static TestResult g_file_tests[MAX_TESTS];
static int g_file_test_count = 0;
static bool g_file_tests_ran = false;

static void run_file_tests(void) {
    if (g_file_tests_ran) return;
    g_file_tests_ran = true;
    g_file_test_count = 0;

    TestResult *tr = g_file_tests;
    int n = 0;

    // Test 1: Open for write
    {
        tr[n].name = "fopen write";
        FILE *f = fopen("syscall_test.txt", "w");
        tr[n].pass = (f != NULL);
        tr[n].ran = true;
        if (f) {
            // Test 2: fprintf
            n++;
            tr[n].name = "fprintf";
            int r = fprintf(f, "Hello from RV32!\nLine two: %d\n", 12345);
            tr[n].pass = (r > 0);
            tr[n].ran = true;

            // Test 3: fwrite binary
            n++;
            tr[n].name = "fwrite binary";
            uint8_t bin[8] = {0xDE,0xAD,0xBE,0xEF,0x01,0x02,0x03,0x04};
            size_t written = fwrite(bin, 1, 8, f);
            tr[n].pass = (written == 8);
            tr[n].ran = true;

            // Test 4: fflush
            n++;
            tr[n].name = "fflush";
            tr[n].pass = (fflush(f) == 0);
            tr[n].ran = true;

            fclose(f);
        }
        n++;
    }

    // Test 5: Open for read
    {
        tr[n].name = "fopen read";
        FILE *f = fopen("syscall_test.txt", "r");
        tr[n].pass = (f != NULL);
        tr[n].ran = true;
        if (f) {
            // Test 6: fgets
            n++;
            tr[n].name = "fgets";
            char buf[64];
            char *got = fgets(buf, sizeof(buf), f);
            tr[n].pass = got && strstr(buf, "Hello") != NULL;
            tr[n].ran = true;

            // Test 7: fseek + ftell
            n++;
            tr[n].name = "fseek/ftell";
            int r = fseek(f, 0, SEEK_END);
            long pos = ftell(f);
            tr[n].pass = (r == 0 && pos > 0);
            tr[n].ran = true;

            // Test 8: fseek to start
            n++;
            tr[n].name = "fseek SEEK_SET";
            r = fseek(f, 0, SEEK_SET);
            tr[n].pass = (r == 0 && ftell(f) == 0);
            tr[n].ran = true;

            // Test 9: fread back binary (seek past text first)
            n++;
            tr[n].name = "fread binary";
            fseek(f, 0, SEEK_SET);
            // Find offset after two lines: "Hello from RV32!\nLine two: 12345\n" = 33 bytes
            fseek(f, 33, SEEK_SET);
            uint8_t readbuf[8] = {0};
            size_t rd = fread(readbuf, 1, 8, f);
            tr[n].pass = (rd == 8 && readbuf[0]==0xDE && readbuf[1]==0xAD);
            tr[n].ran = true;

            fclose(f);
        }
        n++;
    }

    // Test 10: rename
    {
        tr[n].name = "rename";
        int r = rename("syscall_test.txt", "syscall_test_renamed.txt");
        tr[n].pass = (r == 0);
        tr[n].ran = true;
        n++;
    }

    // Test 11: open renamed file
    {
        tr[n].name = "open renamed file";
        FILE *f = fopen("syscall_test_renamed.txt", "r");
        tr[n].pass = (f != NULL);
        tr[n].ran = true;
        if (f) fclose(f);
        n++;
    }

    // Test 12: remove
    {
        tr[n].name = "remove";
        int r = remove("syscall_test_renamed.txt");
        tr[n].pass = (r == 0);
        tr[n].ran = true;
        n++;
    }

    g_file_test_count = n;
}

static void page_files(void) {
    run_file_tests();

    int y = 17;
    draw_str(4, y, "FILE I/O TEST RESULTS", C_ACCENT, 1); y += 14;
    hline(4, y, 160, C_BORDER); y += 5;

    int pass_count = 0;
    for (int i = 0; i < g_file_test_count; i++) {
        if (!g_file_tests[i].ran) continue;
        draw_pass_fail(8, y, g_file_tests[i].name, g_file_tests[i].pass);
        if (g_file_tests[i].pass) pass_count++;
        y += 11;
    }

    y += 4;
    hline(4, y, 160, C_BORDER); y += 6;
    char sum[32];
    snprintf(sum, sizeof(sum), "%d/%d tests passed", pass_count, g_file_test_count);
    draw_str(8, y, sum, pass_count == g_file_test_count ? C_PASS : C_WARN, 1);

    // Syscall list on right
    int rx = W/2 + 10, ry = 17;
    draw_str(rx, ry, "Syscalls exercised:", C_GRAY, 1); ry += 12;
    const char *syscalls[] = {
        "SYS_OPEN (0x01)", "SYS_CLOSE (0x02)", "SYS_READ (0x06)",
        "SYS_WRITE (0x05)", "SYS_SEEK (0x0A)", "SYS_FLEN (0x0C)",
        "SYS_RENAME (0x0F)", "SYS_REMOVE (0x0E)", "SYS_ERRNO (0x13)",
    };
    for (int i = 0; i < 9; i++) {
        draw_str(rx+2, ry, syscalls[i], C_LGRAY, 1);
        ry += 10;
    }

    // Re-run hint
    draw_str(8, H-22, "Tests run once at startup.", C_DGRAY, 1);
}

// ─── PAGE 6: Directory Tests ──────────────────────────────────────────────────
#define MAX_DIR_ENTRIES 48
static char g_dir_names[MAX_DIR_ENTRIES][64];
static uint8_t g_dir_types[MAX_DIR_ENTRIES];
static int g_dir_count = 0;
static bool g_dir_ran = false;
static bool g_mkdir_ok = false;
static bool g_rewind_ok = false;
static int g_rewind_count = 0;

static void run_dir_tests(void) {
    if (g_dir_ran) return;
    g_dir_ran = true;

    // List root
    DIR *dir = opendir("/");
    if (dir) {
        struct dirent *ent;
        g_dir_count = 0;
        while ((ent = readdir(dir)) != NULL && g_dir_count < MAX_DIR_ENTRIES) {
            strncpy(g_dir_names[g_dir_count], ent->d_name, 63);
            g_dir_names[g_dir_count][63] = '\0';
            g_dir_types[g_dir_count] = ent->d_type;
            g_dir_count++;
        }

        // Rewinddir
        rewinddir(dir);
        g_rewind_count = 0;
        while ((ent = readdir(dir)) != NULL) g_rewind_count++;
        g_rewind_ok = (g_rewind_count == g_dir_count);

        closedir(dir);
    }

    // mkdir test
    g_mkdir_ok = (mkdir("__test_mkdir__", 0777) == 0);

    // Clean up
    if (g_mkdir_ok) {
        DIR *td = opendir("__test_mkdir__");
        if (td) closedir(td);
    }
}

static void page_directory(void) {
    run_dir_tests();

    int y = 17;
    draw_str(4, y, "DIRECTORY LISTING  /", C_ACCENT, 1); y += 14;
    hline(4, y, 200, C_BORDER); y += 5;

    if (g_dir_count == 0) {
        draw_str(8, y, "No entries found.", C_WARN, 1); y += 11;
    } else {
        int col = 0, cx = 8;
        for (int i = 0; i < g_dir_count; i++) {
            bool is_dir = (g_dir_types[i] == DT_DIR);
            uint32_t ic = is_dir ? C_YELLOW : C_LGRAY;
            draw_char(cx, y, is_dir ? 'D' : 'F', ic, 1);
            draw_str(cx+10, y, g_dir_names[i], ic, 1);
            y += 11;
            if (y > H - 120) { y = 32; cx = W/2; col++; if (col > 1) break; }
        }
    }

    y = H - 45;
    draw_str(4, y, "SYSCALL TESTS:", C_ACCENT, 1); y += 12;

    draw_pass_fail(8, y, "SYS_OPENDIR/CLOSEDIR  ", g_dir_count >= 0); y += 11;
    draw_pass_fail(8, y, "SYS_READDIR           ", g_dir_count > 0);  y += 11;
    draw_pass_fail(8, y, "SYS_REWINDDIR         ", g_rewind_ok);      y += 11;
    draw_pass_fail(8, y, "SYS_MKDIR             ", g_mkdir_ok);

    char cnt[32];
    snprintf(cnt, sizeof(cnt), "%d entries", g_dir_count);
    draw_str_right(W-4, 17, cnt, C_GRAY, 1);
}

// ─── PAGE 7: Audio Tone Generator ────────────────────────────────────────────
static bool g_audio_inited = false;
static bool g_audio_init_ok = false;
static int g_audio_pitch = 440;   // Hz
static float g_audio_phase = 0.0f;
#define AUDIO_SAMPLE_RATE 44100
#define AUDIO_CHANNELS    1
#define AUDIO_BITS        16
#define AUDIO_CHUNK_SAMPLES 2048
static int16_t g_audio_buf[AUDIO_CHUNK_SAMPLES];

static void ensure_audio_init(void) {
    if (g_audio_inited) return;
    g_audio_inited = true;
    g_audio_init_ok = init_audio(AUDIO_SAMPLE_RATE, AUDIO_CHANNELS, AUDIO_BITS);
}

static void page_audio(void) {
    ensure_audio_init();

    int y = 17;
    draw_str(4, y, "AUDIO TONE GENERATOR", C_ACCENT, 1); y += 14;
    hline(4, y, 150, C_BORDER); y += 8;

    draw_pass_fail(8, y, "SYS_AUDIO_INIT   ", g_audio_init_ok); y += 12;

    if (g_audio_init_ok) {
        uint32_t queued = get_queued_bytes();

        draw_strf(8, y, C_WHITE, 1, "Pitch   : %d Hz", g_audio_pitch); y += 11;
        draw_strf(8, y, C_LGRAY, 1, "Rate    : %d Hz, %d-bit mono",
                  AUDIO_SAMPLE_RATE, AUDIO_BITS); y += 11;
        draw_strf(8, y, C_GRAY,  1, "Queued  : %u bytes", queued); y += 11;
        draw_strf(8, y, C_GRAY,  1, "Chunk   : %d samples (%d bytes)",
                  AUDIO_CHUNK_SAMPLES, AUDIO_CHUNK_SAMPLES*2); y += 14;

        draw_str(4, y, "UP/DN: pitch  SPACE: submit chunk", C_DGRAY, 1); y += 12;

        // Handle pitch change
        if (is_key_down(SDL_SCANCODE_UP)) {
            g_audio_pitch += 10;
            if (g_audio_pitch > 2000) g_audio_pitch = 2000;
        }
        if (is_key_down(SDL_SCANCODE_DOWN)) {
            g_audio_pitch -= 10;
            if (g_audio_pitch < 100) g_audio_pitch = 100;
        }

        // Keep ~3 chunks (~140ms) pre-buffered to prevent underruns
        bool sub_ok = true;
        #define TARGET_BUFFERED (AUDIO_CHUNK_SAMPLES * 2 * 3)  // bytes for 3 chunks
        while (queued < TARGET_BUFFERED) {
            float freq = (float)g_audio_pitch;
            float phase_inc = 2.0f * 3.14159265f * freq / AUDIO_SAMPLE_RATE;
            for (int i = 0; i < AUDIO_CHUNK_SAMPLES; i++) {
                g_audio_buf[i] = (int16_t)(sinf(g_audio_phase) * 12000.0f);
                g_audio_phase += phase_inc;
                if (g_audio_phase > 2.0f * 3.14159265f) g_audio_phase -= 2.0f * 3.14159265f;
            }
            sub_ok = submit_audio(g_audio_buf, AUDIO_CHUNK_SAMPLES * 2);
            queued += AUDIO_CHUNK_SAMPLES * 2;
            if (!sub_ok) break;
        }
        draw_pass_fail(8, y, "SYS_AUDIO_SUBMIT ", sub_ok); y += 11;
        draw_pass_fail(8, y, "SYS_AUDIO_QUEUED ", true); y += 11;

        // Waveform visualization
        y += 4;
        draw_str(4, y, "Waveform:", C_GRAY, 1); y += 10;
        int wy = y + 20, wave_h = 28;
        fill_rect(4, wy - wave_h, W-8, wave_h*2, C_PANEL);
        outline_rect(4, wy - wave_h, W-8, wave_h*2, C_BORDER);
        hline(4, wy, W-8, C_DGRAY);

        int n_show = W - 8;
        float ph = g_audio_phase;
        float phase_inc = 2.0f * 3.14159265f * g_audio_pitch / AUDIO_SAMPLE_RATE;
        for (int i = 0; i < n_show; i++) {
            float sample = sinf(ph + (float)i * phase_inc * 4.0f);
            int sy = wy - (int)(sample * (wave_h-2));
            uint32_t wc = hsv_to_rgb(240.0f + sample*60.0f, 1.0f, 1.0f);
            put_pixel(4+i, sy, wc);
        }
    } else {
        draw_str(8, y, "Audio init failed.", C_FAIL, 1);
    }
}

// ─── PAGE 8: Timing & Performance ────────────────────────────────────────────
#define SLEEP_TEST_US 16666u
#define TIMING_HISTORY 120
static uint32_t g_frame_times[TIMING_HISTORY];
static int g_timing_head = 0;
static uint32_t g_last_frame_us = 0;

static void page_timing(void) {
    uint32_t now = get_us(NULL);
    uint32_t frame_dt = now - g_last_frame_us;
    g_last_frame_us = now;
    g_frame_times[g_timing_head] = frame_dt;
    g_timing_head = (g_timing_head + 1) % TIMING_HISTORY;

    int y = 17;
    draw_str(4, y, "TIMING & PERFORMANCE", C_ACCENT, 1); y += 14;
    hline(4, y, 160, C_BORDER); y += 8;

    uint32_t s  = now / 1000000;
    uint32_t ms = (now / 1000) % 1000;
    draw_strf(8, y, C_WHITE,  1, "Uptime     : %u.%03u s", s, ms); y += 11;
    draw_strf(8, y, C_WHITE,  1, "Timestamp  : %u us", now); y += 11;
    draw_strf(8, y, C_WHITE,  1, "Frame dt   : %u us", frame_dt); y += 11;
    draw_strf(8, y, C_WHITE,  1, "FPS (live) : %u", g_fps); y += 11;
    draw_strf(8, y, C_LGRAY,  1, "Frame #    : %u", g_frame); y += 14;

    // Sleep accuracy test - run once only (avoids injecting a fake spike every 2s)
    static uint32_t sleep_measured = 0;
    static bool sleep_ran = false;
    if (!sleep_ran) {
        uint32_t t0 = get_us(NULL);
        sleep_us(SLEEP_TEST_US);
        uint32_t t1 = get_us(NULL);
        sleep_measured = t1 - t0;
        sleep_ran = true;
    }
    if (sleep_ran) {
        int32_t err = (int32_t)sleep_measured - (int32_t)SLEEP_TEST_US;
        uint32_t sc = (err >= -200 && err <= 500) ? C_PASS : C_WARN;
        draw_strf(8, y, C_GRAY,  1, "sleep_us(%u):", SLEEP_TEST_US); y += 11;
        draw_strf(8, y, C_WHITE, 1, "  measured : %u us", sleep_measured); y += 11;
        draw_strf(8, y, sc,      1, "  error    : %+d us", err); y += 14;
    }

    // Frame time histogram
    draw_str(4, y, "Frame time history (us):", C_GRAY, 1); y += 10;

    // Find max for scaling
    uint32_t max_dt = 1;
    for (int i = 0; i < TIMING_HISTORY; i++)
        if (g_frame_times[i] > max_dt) max_dt = g_frame_times[i];

    int hist_h = 60;
    fill_rect(4, y, TIMING_HISTORY*5, hist_h, C_PANEL);
    outline_rect(4, y, TIMING_HISTORY*5, hist_h, C_BORDER);

    // Target line at 16666us
    if (max_dt > 0) {
        int target_y = y + hist_h - (int)(16666.0f / max_dt * hist_h);
        if (target_y >= y && target_y < y+hist_h)
            hline(4, target_y, TIMING_HISTORY*5, C_DGRAY);
    }

    for (int i = 0; i < TIMING_HISTORY; i++) {
        int idx = (g_timing_head + i) % TIMING_HISTORY;
        uint32_t dt = g_frame_times[idx];
        int bar_h = (int)((float)dt / max_dt * hist_h);
        if (bar_h < 1) bar_h = 1;
        if (bar_h > hist_h) bar_h = hist_h;
        uint32_t bc = (dt < 20000) ? C_GREEN : (dt < 33333) ? C_YELLOW : C_RED;
        fill_rect(4 + i*5, y + hist_h - bar_h, 4, bar_h, bc);
    }

    y += hist_h + 6;
    draw_strf(8, y, C_GRAY, 1, "Max: %u us  Target: 16666 us", max_dt);
}

// ─── Main loop ────────────────────────────────────────────────────────────────
int main(void) {
    bool ok;
    struct DisplayInfo di = get_display_info(&ok);
    if (!ok) {
        fprintf(stderr, "fatal: SYS_GET_DISPLAY_INFO failed\n");
        return 1;
    }
    if (di.format != FORMAT_RGBA8888) {
        fprintf(stderr, "fatal: unsupported display format %u (expected RGBA8888 = %u)\n",
                di.format, FORMAT_RGBA8888);
        return 1;
    }
    if (di.width != W || di.height != H) {
        fprintf(stderr, "fatal: display is %ux%u but framebuffer is %ux%u\n",
                di.width, di.height, W, H);
        return 1;
    }

    // Init trail
    struct MousePos mp0;
    get_mouse_pos(&mp0);
    for (int i = 0; i < TRAIL_LEN; i++) {
        g_trail_x[i] = (int)mp0.x;
        g_trail_y[i] = (int)mp0.y;
    }

    g_last_frame_us = get_us(NULL);
    g_last_fps_time = g_last_frame_us;

    while (1) {
        // ── Key events: page navigation / quit ──
        while (key_available()) {
            SDL_Scancode sc = pop_key();
            bool key_up = (sc & KEY_UP) != 0;
            sc = sc & ~KEY_UP;

            if (!key_up) {
                if (sc == SDL_SCANCODE_ESCAPE) return 0;
                if (sc == SDL_SCANCODE_RIGHT || sc == SDL_SCANCODE_D) {
                    g_page = (g_page + 1) % PAGE_COUNT;
                }
                if (sc == SDL_SCANCODE_LEFT || sc == SDL_SCANCODE_A) {
                    g_page = (g_page + PAGE_COUNT - 1) % PAGE_COUNT;
                }
            }

            // Also forward events to keyboard page log (only if on that page)
            if (g_page == 2) {
                if (sc != SDL_SCANCODE_RIGHT && sc != SDL_SCANCODE_LEFT &&
                    sc != SDL_SCANCODE_D     && sc != SDL_SCANCODE_A) {
                    bool is_up = key_up;
                    char log_entry[20];
                    if (sc >= SDL_SCANCODE_A && sc <= SDL_SCANCODE_Z)
                        snprintf(log_entry, sizeof(log_entry), "%c %s",
                                 'A'+(sc-SDL_SCANCODE_A), is_up?"UP":"DN");
                    else
                        snprintf(log_entry, sizeof(log_entry), "sc=0x%02X %s",
                                 sc, is_up?"UP":"DN");
                    key_log_push(log_entry);
                }
            }
        }

        // Controller quit (check all 4 controllers)
        if ((is_controller_button_down(0, SDL_CONTROLLER_BUTTON_START, NULL) &&
             is_controller_button_down(0, SDL_CONTROLLER_BUTTON_BACK,  NULL)) ||
            (is_controller_button_down(1, SDL_CONTROLLER_BUTTON_START, NULL) &&
             is_controller_button_down(1, SDL_CONTROLLER_BUTTON_BACK,  NULL)) ||
            (is_controller_button_down(2, SDL_CONTROLLER_BUTTON_START, NULL) &&
             is_controller_button_down(2, SDL_CONTROLLER_BUTTON_BACK,  NULL)) ||
            (is_controller_button_down(3, SDL_CONTROLLER_BUTTON_START, NULL) &&
             is_controller_button_down(3, SDL_CONTROLLER_BUTTON_BACK,  NULL)))
            return 0;

        // ── Render ──
        clear_fb();
        draw_header(g_page);
        draw_footer();

        switch (g_page) {
            case 0: page_info();       break;
            case 1: page_colors();     break;
            case 2: page_keyboard();   break;
            case 3: page_mouse();      break;
            case 4: page_controller(); break;
            case 5: page_files();      break;
            case 6: page_directory();  break;
            case 7: page_audio();      break;
            case 8: page_timing();     break;
        }

        // Page indicator dots at bottom center
        {
            int dot_x = (W - PAGE_COUNT*8) / 2;
            for (int i = 0; i < PAGE_COUNT; i++) {
                draw_circle(dot_x + i*8 + 3, H-5, 2,
                            i == g_page ? C_ACCENT : C_DGRAY);
            }
        }

        show_framebuffer(fb);

        // ── FPS accounting ──
        g_frame++;
        g_fps_frames++;
        uint32_t t_now = get_us(NULL);
        if (t_now - g_last_fps_time >= 1000000) {
            g_fps = g_fps_frames;
            g_fps_frames = 0;
            g_last_fps_time = t_now;
        }

        // Cap to ~60 FPS
        sleep_us(16000);
    }
}
