#include <at89lp828.h>

#define int8 char
#define uint8 unsigned char

#define ISPOSITIVE(n) (~((n)>>7)&1)
#define ISNEGATIVE(n) (((n)>>7)&1)

void delay(void)
{
	int j;
	int k;
	
	for(j=0; j<100; ++j)
	{
		for(k=0; k<1000; ++k);
	}
}

void pwm(uint8 leftMotorPower, uint8 rightMotorPower)
{
}

void pid(uint8 leftSignal, uint8 rightSignal)
{
	static uint8 speed = 127;
	static uint8 kP =1;
	static uint8 kD =1;
	static int8 prevX =0;
	static int8 x =0;
	static int8 deltaX =0;
	static uint8 leftMotorPower;
	static uint8 rightMotorPower;
	
	x = (leftSignal>>1) - (rightSignal>>1); //Right-handed coordinate system; on the wire is x=0
	
	if(ISPOSITIVE(x)) //Robot is to the right; reduce left power
	{
		//Reduce the left motor speed
		leftMotorPower = speed - kP*x;
		rightMotorPower = speed; 
	}
	else //Robot is to the left; reduce right power
	{		
		//Reduce the right motor speed
		leftMotorPower = speed;
		rightMotorPower = speed + kP*x;
	}
	
	deltaX = (x>>1) - (prevX>>1);
	
	if(ISPOSITIVE(deltaX)) //Robot is moving to the right; reduce left power
	{
		leftMotorPower -= kD*deltaX;
	}
	else //Robot is moving to the left; reduce right power
	{
		rightMotorPower += kD*deltaX;
	}
	
	//Fix negative motor powers
	if(ISNEGATIVE(leftMotorPower)) leftMotorPower =0;
	if(ISNEGATIVE(rightMotorPower)) rightMotorPower =0;
	
	pwm(leftMotorPower, rightMotorPower);
	
	prevX = x;	
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