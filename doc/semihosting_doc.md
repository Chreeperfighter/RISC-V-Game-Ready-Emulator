# Semihosting specification

# Operation range

> 0x100 - 0x1FF

## SYS_FB_INFO (0x100)

### Entry:

On entry, the PARAMETER REGISTER points to a three-field data block to be used for returning the framebuffer information:

__field 1__

    Width of the framebuffer in pixels

__field 2__

    Height of the framebuffer in pixels

__field 3__

    Format of the framebuffer

```c
struct fb_info {
    uint32_t width;
    uint32_t height;
    uint32_t format;
};
```

#### Value of format

| Value | Format     |
| ----- | ---------- |
| 0     | "RGBA8888" |
| 1     | "BGRA8888" |
| 2     | "RGBX8888" |
| 3     | "XRGB8888" |

## Return

On exit:

- On success, the RETURN REGISTER contains 0, the PARAMETER REGISTER is unchanged, and the data block pointed to by the PARAMETER REGISTER is filled in with the framebuffer info.

- On failure, the RETURN REGISTER contains -1, and the PARAMETER REGISTER contains -1.


























