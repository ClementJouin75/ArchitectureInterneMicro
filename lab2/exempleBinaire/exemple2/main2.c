#include <stdint.h>

volatile uint32_t val = 0;

__attribute__((noinline))
uint32_t func()
{
	return 0x10;
}

int main(void) {
    val = 100;
	__asm__ ("nop");
    while(1)
    {
        volatile int num = func();
        for(int i = 0; i<10;i++)
        {
            num += i;
            val += num;
        }
    }
    return 0;
}
