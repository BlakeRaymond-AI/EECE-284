;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Tue Mar 19 12:11:55 2013
;--------------------------------------------------------
$name square_lp828
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _pwmcounter
	public _LineFollow
	public _allocate2D
	public _test_fcn
	public _OnOffControl
	public _wait
	public _GetADC
	public _SPIWrite
	public _InitTimer0
	public _allocate2D_PARM_2
	public _gain
	public _error
	public _rightInd
	public _leftInd
	public _pwmR
	public _pwmL
	public _pwmcount
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_P1             DATA 0x90
_P1M0           DATA 0xc2
_P1M1           DATA 0xc3
_P2             DATA 0xa0
_P2M0           DATA 0xc4
_P2M1           DATA 0xc5
_P3             DATA 0xb0
_P3M0           DATA 0xc5
_P3M1           DATA 0xc6
_P4             DATA 0xc0
_P4M0           DATA 0xbe
_P4M1           DATA 0xbf
_PSW            DATA 0xd0
_ACC            DATA 0xe0
_B              DATA 0xf0
_SP             DATA 0x81
_DPL            DATA 0x82
_DPH            DATA 0x83
_DP0L           DATA 0x82
_DP0H           DATA 0x83
_DP1L           DATA 0x84
_DP1H           DATA 0x85
_AUXR           DATA 0x8e
_AUXR1          DATA 0xa2
_DPCF           DATA 0xa2
_PAGE           DATA 0x86
_TCON           DATA 0x88
_TMOD           DATA 0x89
_T2CON          DATA 0xc8
_T2MOD          DATA 0xc9
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TL2            DATA 0xcc
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TH2            DATA 0xcd
_TCONB          DATA 0x91
_RL0            DATA 0x92
_RL1            DATA 0x93
_RH0            DATA 0x94
_RH1            DATA 0x95
_RCAP2L         DATA 0xca
_RCAP2H         DATA 0xcb
_WDTRST         DATA 0xa6
_WDTCON         DATA 0xa7
_SCON           DATA 0x98
_SBUF           DATA 0x99
_SADEN          DATA 0xb9
_SADDR          DATA 0xa9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xb7
_IE2            DATA 0xb4
_IP2            DATA 0xb5
_IPH2           DATA 0xb6
_T2CCA          DATA 0xd1
_T2CCL          DATA 0xd2
_T2CCH          DATA 0xd3
_T2CCC          DATA 0xd4
_T2CCF          DATA 0xd5
_PCON           DATA 0x87
_CLKREG         DATA 0x8f
_GPMOD          DATA 0x9a
_GPLS           DATA 0x9b
_GPIEN          DATA 0x9c
_GPIF           DATA 0x9d
_SPSR           DATA 0xe8
_SPCR           DATA 0xe9
_SPDR           DATA 0xea
_MEMCON         DATA 0x96
_ACSRA          DATA 0x97
_ACSRB          DATA 0x9f
_AREF           DATA 0xaf
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_P1_7           BIT 0x97
_P1_6           BIT 0x96
_P1_5           BIT 0x95
_P1_4           BIT 0x94
_P1_3           BIT 0x93
_P1_2           BIT 0x92
_P1_1           BIT 0x91
_P1_0           BIT 0x90
_SCK            BIT 0x97
_MISO           BIT 0x96
_MOSI           BIT 0x95
_SSB            BIT 0x94
_T2EX           BIT 0x91
_T2             BIT 0x90
_P2_7           BIT 0xa7
_P2_6           BIT 0xa6
_P2_5           BIT 0xa5
_P2_4           BIT 0xa4
_P2_3           BIT 0xa3
_P2_2           BIT 0xa2
_P2_1           BIT 0xa1
_P2_0           BIT 0xa0
_CCD            BIT 0xa3
_CCC            BIT 0xa2
_CCB            BIT 0xa1
_CCA            BIT 0xa0
_P3_7           BIT 0xb7
_P3_6           BIT 0xb6
_P3_5           BIT 0xb5
_P3_4           BIT 0xb4
_P3_3           BIT 0xb3
_P3_2           BIT 0xb2
_P3_1           BIT 0xb1
_P3_0           BIT 0xb0
_T1             BIT 0xb5
_T0             BIT 0xb4
_INT1           BIT 0xb3
_INT0           BIT 0xb2
_TXD            BIT 0xb1
_RXD            BIT 0xb0
_P4_7           BIT 0xc7
_P4_6           BIT 0xc6
_P4_5           BIT 0xc5
_P4_4           BIT 0xc4
_P4_3           BIT 0xc3
_P4_2           BIT 0xc2
_P4_1           BIT 0xc1
_P4_0           BIT 0xc0
_XTAL2          BIT 0xc1
_XTAL1          BIT 0xc0
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_UD             BIT 0xd1
_P              BIT 0xd0
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_TF2            BIT 0xcf
_EXF2           BIT 0xce
_RCLK           BIT 0xcd
_TCLK           BIT 0xcc
_EXEN2          BIT 0xcb
_TR2            BIT 0xca
_C_T2           BIT 0xc9
_CP_RL2         BIT 0xc8
_SM0            BIT 0x9f
_FE             BIT 0x9f
_SM1            BIT 0x9e
_SM2            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_EA             BIT 0xaf
_EC             BIT 0xae
_ET2            BIT 0xad
_ES             BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_PC             BIT 0xbe
_PT2            BIT 0xbd
_PS             BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
_SPIF           BIT 0xef
_WCOL           BIT 0xee
_MODF           BIT 0xed
_TXE            BIT 0xec
_SSIG           BIT 0xea
_DISSO          BIT 0xe9
_ENH            BIT 0xe8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_pwmcount:
	ds 1
_pwmL:
	ds 1
_pwmR:
	ds 1
_leftInd:
	ds 2
_rightInd:
	ds 2
_error:
	ds 2
_gain:
	ds 2
_allocate2D_PARM_2:
	ds 2
_allocate2D_rows_1_54:
	ds 2
_allocate2D_arr2D_1_55:
	ds 3
_allocate2D_i_1_55:
	ds 2
_allocate2D_sloc0_1_0:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x000b
	ljmp	_pwmcounter
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'InitTimer0'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:34: void InitTimer0 (void)
;	-----------------------------------------
;	 function InitTimer0
;	-----------------------------------------
_InitTimer0:
	using	0
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:37: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:38: TMOD=(TMOD&0xf0)|0x01; // 16-bit timer
	mov	a,#0xF0
	anl	a,_TMOD
	orl	a,#0x01
	mov	_TMOD,a
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:39: RH0=TIMER0_RELOAD_VALUE/0x100;
	mov	_RH0,#0xFE
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:40: RL0=TIMER0_RELOAD_VALUE%0x100;
	mov	_RL0,#0x90
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:41: TR0=1; // Start timer 0 (bit 4 in TCON)
	setb	_TR0
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:42: ET0=1; // Enable timer 0 interrupt
	setb	_ET0
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:43: EA=1;  // Enable global interrupts
	setb	_EA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:46: void SPIWrite (unsigned char value)
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	r2,dpl
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:48: SPIF=00;
	clr	_SPIF
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:49: SPDR=value;
	mov	_SPDR,r2
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:50: while (SPIF==0); // Wait for transmission to end
L003001?:
	jnb	_SPIF,L003001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:53: unsigned int GetADC (unsigned char channel) // Read 10 bits from the MCP3004 ADC converter
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:57: SSIG=1;
	setb	_SSIG
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:58: SPCR=SPE|MSTR|CPOL|CPHA|SPR1|SPR0; // Mode (1,1): see figure 6--2 of MCP3004 datasheet.
	mov	_SPCR,#0x5F
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:59: P1_4=0;                            // Activate the MCP3004 ADC.
	clr	_P1_4
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:60: SPIWrite(0x01);                    // Send the start bit.
	mov	dpl,#0x01
	push	ar2
	lcall	_SPIWrite
	pop	ar2
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:61: SPIWrite((channel*0x10)|0x80);     // Send single/diff* bit, D2, D1, and D0 bits.
	mov	a,r2
	swap	a
	anl	a,#0xf0
	mov	r2,a
	mov	a,#0x80
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:62: adc=((SPDR & 0x03)*0x100);         // SPDR has the 2--most significant bits of volt.
	mov	a,#0x03
	anl	a,_SPDR
	mov	r3,a
	mov	r2,#0x00
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:63: SPIWrite(0x55);                    // It doesn't matter what we send now.
	mov	dpl,#0x55
	push	ar2
	push	ar3
	lcall	_SPIWrite
	pop	ar3
	pop	ar2
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:64: adc+=SPDR;                         // SPDR contains the low part of the result.
	mov	r4,_SPDR
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
	mov	r3,a
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:65: P1_4=1;                            // Deactivate the MCP3004 ADC.
	setb	_P1_4
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:66: return adc;
	mov	dpl,r2
	mov	dph,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait'
;------------------------------------------------------------
;time                      Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:69: void wait(int time) //10000 = 5ms
;	-----------------------------------------
;	 function wait
;	-----------------------------------------
_wait:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:71: while(--time);
L005001?:
	dec	r2
	cjne	r2,#0xff,L005008?
	dec	r3
L005008?:
	mov	a,r2
	orl	a,r3
	jnz	L005001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'OnOffControl'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:74: void OnOffControl()
;	-----------------------------------------
;	 function OnOffControl
;	-----------------------------------------
_OnOffControl:
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:76: leftInd = GetADC(INDUCTOR_LEFT_CH);
	mov	dpl,#0x00
	lcall	_GetADC
	mov	_leftInd,dpl
	mov	(_leftInd + 1),dph
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:77: rightInd = GetADC(INDUCTOR_RIGHT_CH);
	mov	dpl,#0x01
	lcall	_GetADC
	mov	_rightInd,dpl
	mov	(_rightInd + 1),dph
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:79: if(leftInd > rightInd)
	clr	c
	mov	a,_rightInd
	subb	a,_leftInd
	mov	a,(_rightInd + 1)
	subb	a,(_leftInd + 1)
	jnc	L006002?
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:81: pwmL = 0;
	mov	_pwmL,#0x00
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:82: pwmR = 100;
	mov	_pwmR,#0x64
	ret
L006002?:
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:86: pwmL = 100;
	mov	_pwmL,#0x64
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:87: pwmR = 0;		
	mov	_pwmR,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'test_fcn'
;------------------------------------------------------------
;test                      Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:91: void test_fcn()
;	-----------------------------------------
;	 function test_fcn
;	-----------------------------------------
_test_fcn:
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:94: test = (char*) malloc(90*sizeof(char));
	mov	dptr,#0x005A
	ljmp	_malloc
;------------------------------------------------------------
;Allocation info for local variables in function 'allocate2D'
;------------------------------------------------------------
;cols                      Allocated with name '_allocate2D_PARM_2'
;rows                      Allocated with name '_allocate2D_rows_1_54'
;arr2D                     Allocated with name '_allocate2D_arr2D_1_55'
;i                         Allocated with name '_allocate2D_i_1_55'
;sloc0                     Allocated with name '_allocate2D_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:97: int** allocate2D(int rows,int cols)
;	-----------------------------------------
;	 function allocate2D
;	-----------------------------------------
_allocate2D:
	mov	_allocate2D_rows_1_54,dpl
	mov	(_allocate2D_rows_1_54 + 1),dph
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:102: arr2D = (int**)malloc(rows*sizeof(int*));
	mov	__mulint_PARM_2,_allocate2D_rows_1_54
	mov	(__mulint_PARM_2 + 1),(_allocate2D_rows_1_54 + 1)
	mov	dptr,#0x0003
	lcall	__mulint
	lcall	_malloc
	mov	r4,dpl
	mov	r5,dph
	mov	_allocate2D_arr2D_1_55,r4
	mov	(_allocate2D_arr2D_1_55 + 1),r5
	mov	(_allocate2D_arr2D_1_55 + 2),#0x00
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:103: for(i=0;i<rows;i++)
	mov	a,_allocate2D_PARM_2
	add	a,_allocate2D_PARM_2
	mov	r7,a
	mov	a,(_allocate2D_PARM_2 + 1)
	rlc	a
	mov	r0,a
	clr	a
	mov	_allocate2D_i_1_55,a
	mov	(_allocate2D_i_1_55 + 1),a
	mov	_allocate2D_sloc0_1_0,a
	mov	(_allocate2D_sloc0_1_0 + 1),a
L008001?:
	clr	c
	mov	a,_allocate2D_i_1_55
	subb	a,_allocate2D_rows_1_54
	mov	a,(_allocate2D_i_1_55 + 1)
	xrl	a,#0x80
	mov	b,(_allocate2D_rows_1_54 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L008004?
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:105: arr2D[i] = (int*)malloc(cols*sizeof(int));
	mov	a,_allocate2D_sloc0_1_0
	add	a,_allocate2D_arr2D_1_55
	mov	r3,a
	mov	a,(_allocate2D_sloc0_1_0 + 1)
	addc	a,(_allocate2D_arr2D_1_55 + 1)
	mov	r4,a
	mov	r5,(_allocate2D_arr2D_1_55 + 2)
	mov	dpl,r7
	mov	dph,r0
	push	ar3
	push	ar4
	push	ar5
	push	ar7
	push	ar0
	lcall	_malloc
	mov	r6,dpl
	mov	r2,dph
	pop	ar0
	pop	ar7
	pop	ar5
	pop	ar4
	pop	ar3
	mov	r1,#0x00
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,r6
	lcall	__gptrput
	inc	dptr
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r1
	lcall	__gptrput
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:103: for(i=0;i<rows;i++)
	mov	a,#0x03
	add	a,_allocate2D_sloc0_1_0
	mov	_allocate2D_sloc0_1_0,a
	clr	a
	addc	a,(_allocate2D_sloc0_1_0 + 1)
	mov	(_allocate2D_sloc0_1_0 + 1),a
	inc	_allocate2D_i_1_55
	clr	a
	cjne	a,_allocate2D_i_1_55,L008001?
	inc	(_allocate2D_i_1_55 + 1)
	sjmp	L008001?
L008004?:
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:108: return arr2D;
	mov	dpl,_allocate2D_arr2D_1_55
	mov	dph,(_allocate2D_arr2D_1_55 + 1)
	mov	b,(_allocate2D_arr2D_1_55 + 2)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LineFollow'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:113: void LineFollow()
;	-----------------------------------------
;	 function LineFollow
;	-----------------------------------------
_LineFollow:
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:115: leftInd = GetADC(INDUCTOR_LEFT_CH);
	mov	dpl,#0x00
	lcall	_GetADC
	mov	_leftInd,dpl
	mov	(_leftInd + 1),dph
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:116: rightInd = GetADC(INDUCTOR_RIGHT_CH);
	mov	dpl,#0x01
	lcall	_GetADC
	mov	_rightInd,dpl
	mov	(_rightInd + 1),dph
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:118: error = leftInd - rightInd;
	mov	a,_leftInd
	clr	c
	subb	a,_rightInd
	mov	_error,a
	mov	a,(_leftInd + 1)
	subb	a,(_rightInd + 1)
	mov	(_error + 1),a
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:121: gain = KP*error;
	mov	dpl,_error
	mov	dph,(_error + 1)
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3E
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2sint
	mov	_gain,dpl
	mov	(_gain + 1),dph
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:123: if(error > 0)
	clr	c
	clr	a
	subb	a,_error
	clr	a
	xrl	a,#0x80
	mov	b,(_error + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L009002?
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:125: pwmL = (gain<100)?100-gain:0;
	clr	c
	mov	a,_gain
	subb	a,#0x64
	mov	a,(_gain + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L009006?
	mov	r2,_gain
	mov	a,#0x64
	clr	c
	subb	a,r2
	mov	r2,a
	sjmp	L009007?
L009006?:
	mov	r2,#0x00
L009007?:
	mov	_pwmL,r2
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:126: pwmR = 100;
	mov	_pwmR,#0x64
	ret
L009002?:
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:130: gain *= -1;
	clr	c
	clr	a
	subb	a,_gain
	mov	_gain,a
	clr	a
	subb	a,(_gain + 1)
	mov	(_gain + 1),a
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:131: pwmL = 100;
	mov	_pwmL,#0x64
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:132: pwmR = (gain<100)?100-gain:0;	
	clr	c
	mov	a,_gain
	subb	a,#0x64
	mov	a,(_gain + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L009008?
	mov	r2,_gain
	mov	a,#0x64
	clr	c
	subb	a,r2
	mov	r2,a
	sjmp	L009009?
L009008?:
	mov	r2,#0x00
L009009?:
	mov	_pwmR,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'pwmcounter'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:138: void pwmcounter (void) interrupt 1
;	-----------------------------------------
;	 function pwmcounter
;	-----------------------------------------
_pwmcounter:
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:140: if(++pwmcount>99) pwmcount=0;
	inc	_pwmcount
	mov	a,_pwmcount
	add	a,#0xff - 0x63
	jnc	L010002?
	mov	_pwmcount,#0x00
L010002?:
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:141: P1_0=(pwmL>pwmcount)?1:0;
	clr	c
	mov	a,_pwmcount
	subb	a,_pwmL
	mov	_P1_0,c
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:142: P1_1=(pwmR>pwmcount)?1:0;	
	clr	c
	mov	a,_pwmcount
	subb	a,_pwmR
	mov	_P1_1,c
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:145: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:147: setbaud_timer2(TIMER_2_RELOAD); // Initialize serial port using timer 2 
	mov	dptr,#0xFFFE
	lcall	_setbaud_timer2
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:148: InitTimer0(); // Initialize timer 0 and its interrupt
	lcall	_InitTimer0
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:149: pwmL=0; //% duty cycle wave at 100Hz
	mov	_pwmL,#0x00
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:150: pwmR=0;	
	mov	_pwmR,#0x00
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:152: while(1)
L011002?:
;	C:\Users\Blake\Dropbox\Documents\GitHub\EECE-284\square_lp828.c:154: OnOffControl();
	lcall	_OnOffControl
	sjmp	L011002?
	rseg R_CSEG

	rseg R_CONST

	rseg R_XINIT

	CSEG

end
