#include "system.h"
#include "alt_types.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"
#include <altera_avalon_pio_regs.h>

int alt_irq_register(alt_u32 id, void* context, void (*isr)(void*, alt_u32));

volatile alt_u16 cpt = 0;

static void simple_irq(void* context, alt_u32 id)
{
    if (id == TIMER_0_IRQ) {
        // 16-bit is enough to store a 2^12-1 counter
        //alt_u16 cpt = IORD_ALTERA_AVALON_TIMER_SNAPL(TIMER_0_BASE);
        cpt = cpt & 0x0FFF; 
        IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, cpt++);
        IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0);
    }
}

int main() {
    // Init Timer
    IOWR_ALTERA_AVALON_TIMER_PERIOD_0(TIMER_0_BASE, TIMER_0_PERIOD);

    alt_irq_register(TIMER_0_IRQ,NULL,simple_irq);

    while (1) {}
    return 0;
}
