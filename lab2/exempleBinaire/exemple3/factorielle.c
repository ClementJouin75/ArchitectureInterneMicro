#include <stdint.h>

int facto(int n)
{
	if(n==1) return 1;
	else return n*facto(n-1);
}

int main(void) {
	volatile int r = facto(5);
	while(1);
    return 0;
}
