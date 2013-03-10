#include <stdio.h>
#include <stdlib.h>
#include <at89lp828.h>

#define CLK 3686400L
#define BAUD 115200L
#define TIMER_2_RELOAD (0x10000L-(CLK/(16L*BAUD)))

//We want timer 0 to interrupt every 100 microseconds ((1/10000Hz)=100 us)
#define FREQ 10000L
#define TIMER0_RELOAD_VALUE (65536L-(CLK/FREQ))

#define INDUCTOR_LEFT_CH 0
#define INDUCTOR_RIGHT_CH 1

//These variables are used in the ISR
volatile unsigned char pwmcount;
volatile unsigned char pwmL;
volatile unsigned char pwmR;

volatile unsigned int leftInd;
volatile unsigned int rightInd;

void InitTimer0 (void)
{
	// Initialize timer 0 for ISR 'pwmcounter' below
	TR0=0; // Stop timer 0
	TMOD=(TMOD&0xf0)|0x01; // 16-bit timer
	RH0=TIMER0_RELOAD_VALUE/0x100;
	RL0=TIMER0_RELOAD_VALUE%0x100;
	TR0=1; // Start timer 0 (bit 4 in TCON)
	ET0=1; // Enable timer 0 interrupt
	EA=1;  // Enable global interrupts
}

void SPIWrite (unsigned char value)
{
	SPIF=00;
	SPDR=value;
	while (SPIF==0); // Wait for transmission to end
}

unsigned int GetADC (unsigned char channel) // Read 10 bits from the MCP3004 ADC converter
{
	unsigned int adc;
	// initialize the SPI port to read the MCP3004 ADC attached to it.
	SSIG=1;
	SPCR=SPE|MSTR|CPOL|CPHA|SPR1|SPR0; // Mode (1,1): see figure 6--2 of MCP3004 datasheet.
	P1_4=0;                            // Activate the MCP3004 ADC.
	SPIWrite(0x01);                    // Send the start bit.
	SPIWrite((channel*0x10)|0x80);     // Send single/diff* bit, D2, D1, and D0 bits.
	adc=((SPDR & 0x03)*0x100);         // SPDR has the 2--most significant bits of volt.
	SPIWrite(0x55);                    // It doesn't matter what we send now.
	adc+=SPDR;                         // SPDR contains the low part of the result.
	P1_4=1;                            // Deactivate the MCP3004 ADC.
	return adc;
}

void wait(int time)
{
	while(--time);
}

void LineFollow()
{
	leftInd = GetADC(INDUCTOR_LEFT_CH);
	rightInd = GetADC(INDUCTOR_RIGHT_CH);
	
	if(leftInd > rightInd)
	{
		pwmL = 100;
		pwmR = 0;
	}
	else
	{
		pwmL = 0;
		pwmR = 100;		
	}
}

// Interrupt 1 is for timer 0.  This function is executed every time
// timer 0 overflows: 100 us.
void pwmcounter (void) interrupt 1
{
	if(++pwmcount>99) pwmcount=0;
	P1_0=(pwmL>pwmcount)?1:0;
	P2_0=(pwmR>pwmcount)?1:0;	
}

void main (void)
{
    setbaud_timer2(TIMER_2_RELOAD); // Initialize serial port using timer 2 
	InitTimer0(); // Initialize timer 0 and its interrupt
	pwmL=0; //0% duty cycle wave at 100Hz
	pwmR=0;	
	
	while(1)
	{
		LineFollow();
		wait(10000);	
	}
}

