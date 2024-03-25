#include <stdint.h>

volatile uint32_t val = 0;

int main(void) {
    val = 100;
    while(1)
    {
        volatile int num = 0;
        for(int i = 0; i<10;i++)
        {
            num += i;
            val += num;
        }
    }
    return 0;
}
