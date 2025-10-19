#include <stdint.h>
#include "framebuffer_test.h"

int main(void) {
    init_display();
    run_bouncing_ball_demo_size(10);

    return 0;
}
