from PIL import Image

img = Image.new("RGBA", (800, 600), (0, 0, 0, 255))

for y in range(img.height):
    for x in range(img.width):
        img.putpixel((x, y), (255, 0, 0, 50))

img.show()