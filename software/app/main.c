#include <system.h>
#include <unistd.h>
#include <altera_avalon_pio_regs.h>
#include <alt_types.h>

int main() {
    // 16-bit is enough to store a 2^12-1 counter
    alt_u16 cpt = 0;
    while (1) {
        IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, cpt);
        cpt = (cpt+1) & 0x0FFF;
        usleep(31250);
    }
    return 0;
}
