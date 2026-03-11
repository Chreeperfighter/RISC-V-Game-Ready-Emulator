#include <stdio.h>
#include <string.h>

#include "peanut_gb.h"
#include "rv32_input.h"
#include "rv32_display.h"
#include "rv32_time.h"

#define ENABLE_LCD 1

uint16_t selected_palette[3][4];

/**
 * Automatically assigns a colour palette to the game using a given game
 * checksum.
 * TODO: Not all checksums are programmed in yet because I'm lazy.
 */
void auto_assign_palette(uint8_t game_checksum)
{
	size_t palette_bytes = 3 * 4 * sizeof(uint16_t);

	switch(game_checksum)
	{
	/* Balloon Kid and Tetris Blast */
	case 0x71:
	case 0xFF:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x7E60, 0x7C00, 0x0000 }, /* OBJ0 */
			{ 0x7FFF, 0x7E60, 0x7C00, 0x0000 }, /* OBJ1 */
			{ 0x7FFF, 0x7E60, 0x7C00, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}

	/* Pokemon Yellow and Tetris */
	case 0x15:
	case 0xDB:
	case 0x95: /* Not officially */
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x7FE0, 0x7C00, 0x0000 }, /* OBJ0 */
			{ 0x7FFF, 0x7FE0, 0x7C00, 0x0000 }, /* OBJ1 */
			{ 0x7FFF, 0x7FE0, 0x7C00, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}

	/* Donkey Kong */
	case 0x19:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x7E10, 0x48E7, 0x0000 }, /* OBJ0 */
			{ 0x7FFF, 0x7E10, 0x48E7, 0x0000 }, /* OBJ1 */
			{ 0x7FFF, 0x7E60, 0x7C00, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}

	/* Pokemon Blue */
	case 0x61:
	case 0x45:

	/* Pokemon Blue Star */
	case 0xD8:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x7E10, 0x48E7, 0x0000 }, /* OBJ0 */
			{ 0x7FFF, 0x329F, 0x001F, 0x0000 }, /* OBJ1 */
			{ 0x7FFF, 0x329F, 0x001F, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}

	/* Pokemon Red */
	case 0x14:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x3FE6, 0x0200, 0x0000 }, /* OBJ0 */
			{ 0x7FFF, 0x7E10, 0x48E7, 0x0000 }, /* OBJ1 */
			{ 0x7FFF, 0x7E10, 0x48E7, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}

	/* Pokemon Red Star */
	case 0x8B:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x7E10, 0x48E7, 0x0000 }, /* OBJ0 */
			{ 0x7FFF, 0x329F, 0x001F, 0x0000 }, /* OBJ1 */
			{ 0x7FFF, 0x3FE6, 0x0200, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}

	/* Kirby */
	case 0x27:
	case 0x49:
	case 0x5C:
	case 0xB3:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7D8A, 0x6800, 0x3000, 0x0000 }, /* OBJ0 */
			{ 0x001F, 0x7FFF, 0x7FEF, 0x021F }, /* OBJ1 */
			{ 0x527F, 0x7FE0, 0x0180, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}

	/* Donkey Kong Land [1/2/III] */
	case 0x18:
	case 0x6A:
	case 0x4B:
	case 0x6B:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7F08, 0x7F40, 0x48E0, 0x2400 }, /* OBJ0 */
			{ 0x7FFF, 0x2EFF, 0x7C00, 0x001F }, /* OBJ1 */
			{ 0x7FFF, 0x463B, 0x2951, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}

	/* Link's Awakening */
	case 0x70:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x03E0, 0x1A00, 0x0120 }, /* OBJ0 */
			{ 0x7FFF, 0x329F, 0x001F, 0x001F }, /* OBJ1 */
			{ 0x7FFF, 0x7E10, 0x48E7, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}

	/* Mega Man [1/2/3] & others I don't care about. */
	case 0x01:
	case 0x10:
	case 0x29:
	case 0x52:
	case 0x5D:
	case 0x68:
	case 0x6D:
	case 0xF6:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x329F, 0x001F, 0x0000 }, /* OBJ0 */
			{ 0x7FFF, 0x3FE6, 0x0200, 0x0000 }, /* OBJ1 */
			{ 0x7FFF, 0x7EAC, 0x40C0, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}
	case 0xC9:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x7DC0, 0x4900, 0x0000 }, /* OBJ0 */
			{ 0x7FFF, 0x329F, 0x001F, 0x0000 }, /* OBJ1 */
			{ 0x7FF9, 0x33BD, 0x4E06, 0x2D6B }  /* BG  */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;

	}
		case 0x46: {
		const uint16_t palette[3][4] =
		{
			{ 0x7FE0, 0x7C00, 0x3000, 0x0000 }, /* OBJ0 */
			{ 0x7FFF, 0x3FE6, 0x0200, 0x0000 }, /* OBJ1 */
			{ 0x7FFF, 0x329F, 0x001F, 0x0000 }  /* BG */
		};
		memcpy(selected_palette, palette, palette_bytes);
		break;
	}
	default:
	{
		const uint16_t palette[3][4] =
		{
			{ 0x7FFF, 0x5294, 0x294A, 0x0000 },
			{ 0x7FFF, 0x5294, 0x294A, 0x0000 },
			{ 0x7FFF, 0x5294, 0x294A, 0x0000 }
		};
		memcpy(selected_palette, palette, palette_bytes);
	}
	}
}

static uint8_t *save_ram = NULL;
static uint8_t *fb = NULL;
bool running;
bool fast_mode;

/**
 * Return byte from ROM at given address.
 *
 * \param gb_s	emulator context
 * \param addr	address
 * \return		byte at address in ROM
 */
uint8_t gb_rom_read(struct gb_s* gb, const uint_fast32_t addr) {
    const uint8_t* rom = gb->direct.priv;
    return rom[addr];
}

/**
 * Return byte from cart RAM at given address.
 *
 * \param gb_s	emulator context
 * \param addr	address
 * \return		byte at address in RAM
 */
uint8_t gb_cart_ram_read(struct gb_s* gb, const uint_fast32_t addr) {
    return save_ram[addr];
}

/**
 * Write byte to cart RAM at given address.
 *
 * \param gb_s	emulator context
 * \param addr	address
 * \param val	value to write to address in RAM
 */
void gb_cart_ram_write(struct gb_s* gb, const uint_fast32_t addr, const uint8_t val) {
    save_ram[addr] = val;
}

/**
 * Notify front-end of error.
 *
 * \param gb_s		emulator context
 * \param gb_error_e	error code
 * \param addr		address of where error occurred
 */
void gb_error(struct gb_s* gb, const enum gb_error_e gb_error, const uint16_t addr) {
    printf("Error: %u on %u\n", gb_error, addr);
    exit(-1);
}

/**
 * Draw line on screen.
 *
 * \param gb_s		emulator context
 * \param pixels	The 160 pixels to draw.
 * 			Bits 1-0 are the colour to draw.
 * 			Bits 5-4 are the palette, where:
 * 				OBJ0 = 0b00,
 * 				OBJ1 = 0b01,
 * 				BG = 0b10
 * 			Other bits are undefined.
 * 			Bits 5-4 are only required by front-ends
 * 			which want to use a different colour for
 * 			different object palettes. This is what
 * 			the Game Boy Color (CGB) does to DMG
 * 			games.
 * \param line		Line to draw pixels on. This is
 * guaranteed to be between 0-144 inclusive.
 */
uint16_t rgb555_to_rgb565(uint16_t c) {
	return ((c & 0x7C00) << 1) |  // R: bits 14-10 -> 15-11
		   ((c & 0x03E0) << 1) |  // G: bits  9-5  -> 10-5 (shift + expand)
		   ((c & 0x001F));         // B: bits  4-0  -> 4-0
}

void lcd_draw_line(struct gb_s *gb, const uint8_t *pixels, const uint_fast8_t line) {
    uint16_t *fb16 = (uint16_t *)fb + line * 160;
    for (int i = 0; i < 160; i++) {
    	uint8_t shade      = pixels[i] & 0x03;
    	uint8_t palette_id = (pixels[i] >> 4) & 0x03;  // 0=OBJ0, 1=OBJ1, 2=BG
    	fb16[i] = rgb555_to_rgb565(selected_palette[palette_id][shade]);
    }
}

static uint8_t* load_save(const char* path, size_t* out_size) {
	FILE* f = fopen(path, "rb");
	if (!f)
		return NULL;

	fseek(f, 0, SEEK_END);
	long size = ftell(f);
	fseek(f, 0, SEEK_SET);

	if (size <= 0) {
		fclose(f);
		return NULL;
	}

	uint8_t* buf = malloc((size_t)size);
	if (!buf) {
		fclose(f);
		return NULL;
	}

	if (fread(buf, 1, (size_t)size, f) != (size_t)size) {
		free(buf);
		fclose(f);
		return NULL;
	}
	fclose(f);

	*out_size = (size_t)size;
	return buf;
}

void write_save(const char* path, const uint8_t* buf, size_t size) {
	FILE* f = fopen(path, "wb");
	if (!f)
		return;
	fwrite(buf, 1, size, f);
	fclose(f);
}

static uint8_t* load_rom(const char* path, size_t* out_size) {
    FILE* f = fopen(path, "rb");
    if (!f)
        return NULL;

    fseek(f, 0, SEEK_END);
    long size = ftell(f);
    fseek(f, 0, SEEK_SET);

    if (size <= 0) {
        fclose(f);
        return NULL;
    }

    uint8_t* buf = malloc((size_t)size);
    if (!buf) {
        fclose(f);
        return NULL;
    }

    if (fread(buf, 1, (size_t)size, f) != (size_t)size) {
        free(buf);
        fclose(f);
        return NULL;
    }
    fclose(f);

    *out_size = (size_t)size;
    return buf;
}

void process_input(struct gb_s* gb) {
    gb->direct.joypad = 0xFF;
    if (is_key_down(SDL_SCANCODE_Z))         gb->direct.joypad &= ~JOYPAD_A;
    if (is_key_down(SDL_SCANCODE_X))         gb->direct.joypad &= ~JOYPAD_B;
    if (is_key_down(SDL_SCANCODE_RETURN))    gb->direct.joypad &= ~JOYPAD_START;
    if (is_key_down(SDL_SCANCODE_BACKSPACE)) gb->direct.joypad &= ~JOYPAD_SELECT;
    if (is_key_down(SDL_SCANCODE_UP))        gb->direct.joypad &= ~JOYPAD_UP;
    if (is_key_down(SDL_SCANCODE_DOWN))      gb->direct.joypad &= ~JOYPAD_DOWN;
    if (is_key_down(SDL_SCANCODE_LEFT))      gb->direct.joypad &= ~JOYPAD_LEFT;
    if (is_key_down(SDL_SCANCODE_RIGHT))     gb->direct.joypad &= ~JOYPAD_RIGHT;
	fast_mode = is_key_down(SDL_SCANCODE_SPACE);
	if (is_key_down(SDL_SCANCODE_ESCAPE) || is_key_down(SDL_SCANCODE_Q))
		running = false;
}


int main(void) {
	bool ok;
	struct DisplayInfo display_info = get_display_info(&ok);
	if (!ok) {
		fprintf(stderr, "fatal: failed to get display info\n");
		exit(1);
	}
    if (display_info.format != FORMAT_RGB565) {
        fprintf(stderr, "fatal: unsupported display format %lu, expected RGB565\n", display_info.format);
        exit(1);
    }
    if (display_info.width != 160 || display_info.height != 144) {
        fprintf(stderr, "fatal: unsupported display resolution %lux%lu, expected 160x144\n", display_info.width, display_info.height);
        exit(1);
    }
    fb = malloc(display_info.width * display_info.height * (display_info.bpp / 8));
    if (!fb) {
        fprintf(stderr, "fatal: failed to allocate framebuffer\n");
        return -1;
    }
    struct gb_s gb;
	size_t save_size;
	const char* save_path = "zelda.sav";
	save_ram = load_save(save_path, &save_size);
	if (!save_ram) {
		save_ram = malloc(32768);
		if (!save_ram) {
			fprintf(stderr, "fatal: failed to allocate save RAM\n");
			free(fb);
			return -1;
		}
		save_size = 32768;
		memset(save_ram, 0, save_size);
	}
    size_t rom_size;
    uint8_t* rom_buffer = load_rom("zelda.gb", &rom_size);
    if (!rom_buffer) {
        fprintf(stderr, "fatal: failed to load ROM\n");
        free(save_ram);
        free(fb);
        return -1;
    }
    enum gb_init_error_e error = gb_init(&gb,
                 gb_rom_read,
                 gb_cart_ram_read,
                 gb_cart_ram_write,
                 gb_error,
                 rom_buffer);
    if (error != GB_INIT_NO_ERROR) {
        fprintf(stderr, "fatal: gb_init failed: %u\n", error);
        free(rom_buffer);
        free(save_ram);
        free(fb);
        return -1;
    }
    gb_init_lcd(&gb, lcd_draw_line);
	auto_assign_palette(gb_colour_hash(&gb));

    const uint32_t frame_time_us = 1000000 / 60;
	uint32_t frame_time_sum = 0;
	uint32_t perf_window_start_us = get_us(&ok);
	uint32_t perf_frame_count = 0;
	uint32_t next_frame_us = perf_window_start_us + frame_time_us;

	running = true;
	fast_mode = false;
    while (running) {
    	uint32_t frame_start_us = get_us(&ok);
        process_input(&gb);
        gb_run_frame(&gb);
        show_framebuffer(fb);
    	uint32_t frame_end_us = get_us(&ok);

    	frame_time_sum += frame_end_us - frame_start_us;
        perf_frame_count++;

        uint32_t elapsed_us = frame_end_us - perf_window_start_us;
        if (elapsed_us >= 1000000) {
            printf("avg frame: %lums  fps: %lu\n",
                (unsigned long)(frame_time_sum / perf_frame_count / 1000),
                (unsigned long)(perf_frame_count * 1000000 / elapsed_us));
            frame_time_sum = 0;
            perf_frame_count = 0;
            perf_window_start_us = frame_end_us;
        }

        if (!fast_mode && frame_end_us < next_frame_us) {
            sleep_us(next_frame_us - frame_end_us);
        }
        next_frame_us += frame_time_us;
    }
	write_save(save_path, save_ram, save_size);
    free(save_ram);
    free(rom_buffer);
    free(fb);
    return 0;
}