#include <at89lp828.h>

void delay(void)
{
	int j;
	int k;
	
	for(j=0; j<100; ++j)
	{
		for(k=0; k<1000; ++k);
	}
}

void main(void)
{
	while(1)
	{
		P2_1 = 0;
		delay();
		P2_1 = 1;
		delay();
	}
}