#include <system.h>
#include <unistd.h>
#include <altera_avalon_pio_regs.h>

int main() {
    // PIO_0_BASE defined in system.h
    unsigned char cpt = 0;
    while (1) {
        IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, cpt);
        cpt = (cpt+1) & 0x0F;
        usleep(500000);
    }
    return 0;
}
