/*
 * C++ Capability Test — RV32 emulator
 *
 * Tests:  templates, classes, inheritance/virtual, std::vector, std::string,
 *         lambdas, std::array, std::unique_ptr, range-for, std::algorithm,
 *         operator overloading, move semantics, constexpr
 *
 * Navigate: LEFT/RIGHT arrows  |  Quit: ESC
 */

#include <cstdio>
#include <cstdint>
#include <cstring>
#include <cmath>
#include <algorithm>
#include <array>
#include <functional>
#include <memory>
#include <string>
#include <vector>
#include <numeric>

extern "C" {
#include "rv32_display.h"
#include "rv32_input.h"
#include "rv32_time.h"
}

// ─── Framebuffer ─────────────────────────────────────────────────────────────
static constexpr int W = 640;
static constexpr int H = 480;

// SDL_PIXELFORMAT_ABGR8888: uint32 layout = A[31:24] B[23:16] G[15:8] R[7:0]
static constexpr uint32_t rgba(uint8_t r, uint8_t g, uint8_t b, uint8_t a = 0xFF) {
    return (uint32_t(a) << 24) | (uint32_t(b) << 16) | (uint32_t(g) << 8) | r;
}

static constexpr uint32_t C_BG     = rgba(0x0D,0x0E,0x1A);
static constexpr uint32_t C_PANEL  = rgba(0x18,0x18,0x30);
static constexpr uint32_t C_HDR    = rgba(0x10,0x12,0x40);
static constexpr uint32_t C_BORDER = rgba(0x28,0x36,0x80);
static constexpr uint32_t C_WHITE  = rgba(0xFF,0xFF,0xFF);
static constexpr uint32_t C_GRAY   = rgba(0x80,0x80,0x90);
static constexpr uint32_t C_LGRAY  = rgba(0xCC,0xCC,0xCC);
static constexpr uint32_t C_DGRAY  = rgba(0x40,0x40,0x55);
static constexpr uint32_t C_ACCENT = rgba(0x00,0xCC,0xFF);
static constexpr uint32_t C_PASS   = rgba(0x33,0xEE,0x66);
static constexpr uint32_t C_FAIL   = rgba(0xFF,0x44,0x44);
static constexpr uint32_t C_WARN   = rgba(0xFF,0xBB,0x00);
static constexpr uint32_t C_YELLOW = rgba(0xFF,0xEE,0x44);
static constexpr uint32_t C_CYAN   = rgba(0x44,0xFF,0xFF);

static uint32_t fb[W * H];

// ─── 8×8 font (IBM public domain) ────────────────────────────────────────────
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
    {0xC0,0x60,0x30,0x18,0x0C,0x06,0x02,0x00}, // '\'
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
static void put_pixel(int x, int y, uint32_t c) {
    if (unsigned(x) < unsigned(W) && unsigned(y) < unsigned(H))
        fb[y * W + x] = c;
}

static void fill_rect(int x, int y, int w, int h, uint32_t c) {
    for (int r = y; r < y + h; r++)
        for (int col = x; col < x + w; col++)
            put_pixel(col, r, c);
}

static void hline(int x, int y, int w, uint32_t c) {
    for (int i = x; i < x + w; i++) put_pixel(i, y, c);
}

static void draw_char(int x, int y, char ch, uint32_t fg, int scale = 1) {
    if (ch < 0x20 || ch > 0x7E) ch = '?';
    const uint8_t *g = FONT[uint8_t(ch) - 0x20];
    for (int row = 0; row < 8; row++) {
        uint8_t bits = g[row];
        for (int col = 0; col < 8; col++)
            if (bits & (0x80 >> col))
                fill_rect(x + col*scale, y + row*scale, scale, scale, fg);
    }
}

static int draw_str(int x, int y, const char *s, uint32_t fg, int scale = 1) {
    int cx = x;
    while (*s) { draw_char(cx, y, *s++, fg, scale); cx += 8 * scale; }
    return cx;
}

template<typename... Args>
static int draw_strf(int x, int y, uint32_t fg, int scale, const char *fmt, Args... args) {
    char buf[160];
    snprintf(buf, sizeof(buf), fmt, args...);
    return draw_str(x, y, buf, fg, scale);
}

static void clear_fb() { fill_rect(0, 0, W, H, C_BG); }

// ─── Test framework ───────────────────────────────────────────────────────────
struct TestResult {
    std::string name;
    bool        pass;
    std::string detail;
};

static std::vector<TestResult> g_results;

static void record(const char *name, bool pass, const char *detail = "") {
    g_results.push_back({name, pass, detail});
}

// ─────────────────────────────────────────────────────────────────────────────
// C++ FEATURE TESTS
// ─────────────────────────────────────────────────────────────────────────────

// ── 1. constexpr & templates ─────────────────────────────────────────────────
template<typename T>
static constexpr T tmin(T a, T b) { return a < b ? a : b; }
template<typename T>
static constexpr T tmax(T a, T b) { return a > b ? a : b; }
template<typename T>
static constexpr T tclamp(T v, T lo, T hi) { return tmax(lo, tmin(hi, v)); }

static void test_templates() {
    constexpr int   ci = tclamp(150, 0, 100);
    constexpr float cf = tmin(3.14f, 2.72f);
    record("templates / constexpr", ci == 100 && cf == 2.72f,
           ci == 100 ? "clamp+min ok" : "WRONG");
}

// ── 2. Classes + RAII ─────────────────────────────────────────────────────────
static int g_ctor_count = 0, g_dtor_count = 0;

struct Counter {
    int value;
    explicit Counter(int v) : value(v) { ++g_ctor_count; }
    ~Counter() { ++g_dtor_count; }
    Counter(const Counter &o) : value(o.value) { ++g_ctor_count; }
    Counter &operator=(const Counter &) = default;
};

static void test_classes() {
    g_ctor_count = g_dtor_count = 0;
    {
        Counter a(1), b(2);
        Counter c = a;      // copy ctor
        (void)c;
    }                       // all three destructed
    record("classes / RAII", g_ctor_count == 3 && g_dtor_count == 3,
           g_ctor_count == 3 ? "ctor=dtor=3" : "MISMATCH");
}

// ── 3. Inheritance + virtual dispatch ────────────────────────────────────────
struct Shape {
    virtual float area() const = 0;
    virtual ~Shape() = default;
};
struct Circle : Shape {
    float r;
    explicit Circle(float r) : r(r) {}
    float area() const override { return 3.14159f * r * r; }
};
struct Rect : Shape {
    float w, h;
    Rect(float w, float h) : w(w), h(h) {}
    float area() const override { return w * h; }
};

static void test_virtual() {
    std::unique_ptr<Shape> shapes[2] = {
        std::make_unique<Circle>(5.0f),
        std::make_unique<Rect>(4.0f, 6.0f),
    };
    float a0 = shapes[0]->area(); // ~78.5
    float a1 = shapes[1]->area(); // 24.0
    bool ok = a0 > 78.0f && a0 < 79.0f && a1 == 24.0f;
    record("inheritance + virtual", ok, ok ? "vtable dispatch ok" : "WRONG");
}

// ── 4. std::vector ────────────────────────────────────────────────────────────
static void test_vector() {
    std::vector<int> v;
    for (int i = 0; i < 10; i++) v.push_back(i * i);
    int sum = 0;
    for (int x : v) sum += x;          // range-for
    // 0+1+4+9+16+25+36+49+64+81 = 285
    record("std::vector + range-for", sum == 285 && v.size() == 10,
           sum == 285 ? "sum=285,size=10" : "WRONG");
}

// ── 5. std::string ───────────────────────────────────────────────────────────
static void test_string() {
    std::string s = "Hello";
    s += ", RV32!";
    bool ok = s == "Hello, RV32!" && s.length() == 12;
    auto pos = s.find("RV32");
    record("std::string", ok && pos == 7, ok ? "concat+find ok" : "WRONG");
}

// ── 6. Lambdas ────────────────────────────────────────────────────────────────
static void test_lambdas() {
    int base = 10;
    auto add  = [base](int x) { return base + x; };
    auto mul2 = [](int x) { return x * 2; };

    std::vector<int> v = {1, 2, 3, 4, 5};
    std::transform(v.begin(), v.end(), v.begin(), mul2);
    int sum = std::accumulate(v.begin(), v.end(), 0);
    // 2+4+6+8+10 = 30
    bool ok = add(5) == 15 && sum == 30;
    record("lambdas + std::transform", ok, ok ? "capture+transform ok" : "WRONG");
}

// ── 7. std::array + std::sort ─────────────────────────────────────────────────
static void test_array_sort() {
    std::array<int, 8> a = {5, 3, 8, 1, 9, 2, 7, 4};
    std::sort(a.begin(), a.end());
    bool sorted = std::is_sorted(a.begin(), a.end());
    bool ok = sorted && a[0] == 1 && a[7] == 9;
    record("std::array + std::sort", ok, ok ? "sorted [1..9]" : "WRONG");
}

// ── 8. std::unique_ptr + move semantics ──────────────────────────────────────
static void test_unique_ptr() {
    auto p = std::make_unique<int>(42);
    bool has_val = (*p == 42);

    auto q = std::move(p);          // move ownership
    bool moved = (p == nullptr) && (*q == 42);

    record("std::unique_ptr + move", has_val && moved,
           has_val && moved ? "make+move ok" : "WRONG");
}

// ── 9. Operator overloading ───────────────────────────────────────────────────
struct Vec2 {
    float x, y;
    Vec2 operator+(const Vec2 &o) const { return {x + o.x, y + o.y}; }
    Vec2 operator*(float s)        const { return {x * s,   y * s};   }
    bool operator==(const Vec2 &o) const { return x == o.x && y == o.y; }
    float length() const { return sqrtf(x*x + y*y); }
};

static void test_operator_overload() {
    Vec2 a{3.0f, 4.0f}, b{1.0f, 2.0f};
    Vec2 c = (a + b) * 2.0f;       // {8, 12}
    bool ok = c == Vec2{8.0f, 12.0f} && a.length() == 5.0f;
    record("operator overloading", ok, ok ? "Vec2 math ok" : "WRONG");
}

// ── 10. std::function + higher-order functions ────────────────────────────────
static void test_std_function() {
    using Fn = std::function<int(int)>;
    auto make_adder = [](int n) -> Fn {
        return [n](int x) { return x + n; };
    };
    auto add10 = make_adder(10);
    auto add20 = make_adder(20);

    std::vector<Fn> fns = {add10, add20};
    int result = fns[0](5) + fns[1](5);   // 15 + 25 = 40
    record("std::function + closures", result == 40,
           result == 40 ? "HOF ok" : "WRONG");
}

// ── 11. std::vector of polymorphic objects ────────────────────────────────────
static void test_poly_vector() {
    std::vector<std::unique_ptr<Shape>> shapes;
    shapes.push_back(std::make_unique<Circle>(1.0f));
    shapes.push_back(std::make_unique<Circle>(2.0f));
    shapes.push_back(std::make_unique<Rect>(3.0f, 3.0f));
    shapes.push_back(std::make_unique<Rect>(5.0f, 2.0f));

    float total = 0.0f;
    for (const auto &s : shapes) total += s->area();
    // π*1 + π*4 + 9 + 10 = 5π + 19 ≈ 34.71
    bool ok = total > 34.0f && total < 36.0f;
    record("vector<unique_ptr<Base>>", ok, ok ? "poly area ok" : "WRONG");
}

// ── 12. Structured bindings (C++17) ──────────────────────────────────────────
static void test_structured_bindings() {
    std::array<std::pair<int,int>, 3> pairs = {{{1,2},{3,4},{5,6}}};
    int sum = 0;
    for (auto [a, b] : pairs) sum += a + b;   // 1+2+3+4+5+6 = 21
    record("structured bindings (C++17)", sum == 21,
           sum == 21 ? "sum=21 ok" : "WRONG");
}

// ─────────────────────────────────────────────────────────────────────────────

static void run_all_tests() {
    g_results.clear();
    test_templates();
    test_classes();
    test_virtual();
    test_vector();
    test_string();
    test_lambdas();
    test_array_sort();
    test_unique_ptr();
    test_operator_overload();
    test_std_function();
    test_poly_vector();
    test_structured_bindings();
}

// ─── Rendering ────────────────────────────────────────────────────────────────
static constexpr int TESTS_PER_PAGE = 6;
static int g_page = 0;

static void render() {
    clear_fb();

    int total_pages = (int(g_results.size()) + TESTS_PER_PAGE - 1) / TESTS_PER_PAGE;

    // Header
    fill_rect(0, 0, W, 14, C_HDR);
    hline(0, 14, W, C_BORDER);
    draw_str((W - 22*8)/2, 3, "C++ CAPABILITY TEST SUITE", C_ACCENT);
    draw_str(2, 3, "<", C_GRAY);
    {
        char pg[16];
        snprintf(pg, sizeof(pg), "%d/%d >", g_page+1, total_pages);
        int len = int(strlen(pg));
        draw_str(W - len*8 - 2, 3, pg, C_GRAY);
    }

    // Footer
    hline(0, H-10, W, C_BORDER);
    fill_rect(0, H-9, W, 9, C_HDR);
    draw_str(2, H-8, "LEFT/RIGHT:page  ESC:quit", C_GRAY);

    // Summary bar
    int pass = 0, fail = 0;
    for (auto &r : g_results) (r.pass ? pass : fail)++;
    fill_rect(0, H-20, W, 10, C_PANEL);
    draw_strf(4, H-19, pass == int(g_results.size()) ? C_PASS : C_WARN, 1,
              "Summary: %d/%d passed", pass, int(g_results.size()));

    // Test results
    int start = g_page * TESTS_PER_PAGE;
    int end   = tmin(start + TESTS_PER_PAGE, int(g_results.size()));

    int y = 20;
    for (int i = start; i < end; i++) {
        auto &r = g_results[i];

        // Row background
        fill_rect(4, y, W-8, 28, r.pass ? rgba(0x0A,0x20,0x0A) : rgba(0x22,0x08,0x08));
        hline(4, y, W-8, r.pass ? C_PASS : C_FAIL);
        hline(4, y+27, W-8, r.pass ? C_PASS : C_FAIL);

        // Badge
        const char *badge = r.pass ? "PASS" : "FAIL";
        uint32_t    badge_col = r.pass ? C_PASS : C_FAIL;
        fill_rect(W-56, y+1, 52, 26, r.pass ? rgba(0x10,0x44,0x10) : rgba(0x44,0x10,0x10));
        draw_str(W-50, y+10, badge, badge_col);

        // Test name
        draw_str(10, y+5, r.name.c_str(), C_WHITE);

        // Detail line
        draw_str(10, y+16, r.detail.c_str(), r.pass ? C_LGRAY : C_WARN);

        y += 32;
    }

    // Page dots
    {
        int dot_x = (W - total_pages*8) / 2;
        for (int i = 0; i < total_pages; i++)
            fill_rect(dot_x + i*8 + 2, H-5, 4, 4,
                      i == g_page ? C_ACCENT : C_DGRAY);
    }

    show_framebuffer(fb);
}

// ─── Main ─────────────────────────────────────────────────────────────────────
int main() {


    run_all_tests();

    while (true) {
        while (key_available()) {
            SDL_Scancode sc = pop_key();
            bool up = (sc & KEY_UP) != 0;
            sc = SDL_Scancode(sc & ~KEY_UP);
            if (!up) {
                if (sc == SDL_SCANCODE_ESCAPE) return 0;
                int total_pages = (int(g_results.size()) + TESTS_PER_PAGE - 1) / TESTS_PER_PAGE;
                if (sc == SDL_SCANCODE_RIGHT || sc == SDL_SCANCODE_D)
                    g_page = (g_page + 1) % total_pages;
                if (sc == SDL_SCANCODE_LEFT || sc == SDL_SCANCODE_A)
                    g_page = (g_page + total_pages - 1) % total_pages;
            }
        }
        render();
        sleep_us(16000);
    }
}