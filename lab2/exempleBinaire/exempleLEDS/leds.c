#include <stdint.h>

volatile extern uint32_t GPIO_DIR;
volatile extern uint32_t GPIO_VAL;

int main(void) {
    uint32_t val = 0;
    GPIO_DIR = 0xffffffff;
	while(1){
        GPIO_VAL = val; /* GPIO_VAL is write only */
        val += 1;
    }
    return 0;
}