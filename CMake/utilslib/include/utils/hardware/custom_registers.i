	IFND _UTILS_CUSTOM_REGISTERS_I
_UTILS_CUSTOM_REGISTERS_I SET 1

HWREGBASE	EQU $DFF000

BLTDDAT		EQU $dff000		; Blitter destination early read (unusable)
DMACONR		EQU $dff002		; DMA control (and blitter status) read
VPOSR		EQU $dff004		; Read vertical raster position bit 9 (and interlace odd/even frame)
VHPOSR		EQU $dff006		; Rest of raster XY position - High byte: vertical, low byte: horizontal
DSKDATR		EQU $dff008		; Disk data early read (unusable)
JOY0DAT		EQU $dff00a		; Joystick/mouse 0 data
JOT1DAT		EQU $dff00c		; Joystick/mouse 1 data
CLXDAT		EQU $dff00e		; Poll (read and clear) sprite collision state
ADKCONR		EQU $dff010		; Audio, disk control register read
POT0DAT		EQU $dff012		; Pot counter pair 0 data
POT1DAT		EQU $dff014		; Pot counter pair 1 data
POTGOR		EQU $dff016		; Pot pin data read
SERDATR		EQU $dff018		; Serial port data and status read
DSKBYTR		EQU $dff01a		; Disk data byte and status read
INTENAR		EQU $dff01c		; Interrupt enable bits read
INTREQR		EQU $dff01e		; Interrupt request bits read
DSKPTH		EQU $dff020		; Disk track buffer pointer (high 5 bits)
DSKPTL		EQU $dff022		; Disk track buffer pointer (low 15 bits)
DSKLEN		EQU $dff024		; Disk track buffer length
DSKDAT		EQU $dff026		; Disk DMA data write
REFPTR		EQU $dff028		; AGA: Refresh pointer
VPOSW		EQU $dff02a		; Write vert most sig. bits (and frame flop)
VHPOSW		EQU $dff02c		; Write vert and horiz pos of beam
COPCON		EQU $dff02e		; Coprocessor control register (CDANG)
SERDAT		EQU $dff030		; Serial port data and stop bits write
SERPER		EQU $dff032		; Serial port period and control
POTGO		EQU $dff034		; Pot count start, pot pin drive enable data
JOYTEST		EQU $dff036		; Write to all 4 joystick/mouse counters at once
STREQU		EQU $dff038		; Strobe for horiz sync with VBLANK and EQU
STRVBL		EQU $dff03a		; Strobe for horiz sync with VBLANK
STRHOR		EQU $dff03c		; Strobe for horiz sync
STRLONG		EQU $dff03e		; Strobe for identification of long/short horiz line
BLTCON0		EQU $dff040		; Blitter control reg 0
BLTCON1		EQU $dff042		; Blitter control reg 1
BLTAFWM		EQU $dff044		; Blitter first word mask for source A
BLTALWM		EQU $dff046		; Blitter last word mask for source A
BLTCPTH		EQU $dff048		; Blitter pointer to source C (high 5 bits)
BLTCPTL		EQU $dff04a		; Blitter pointer to source C (low 15 bits)
BLTBPTH		EQU $dff04c		; Blitter pointer to source B (high 5 bits)
BLTBPTL		EQU $dff04e		; Blitter pointer to source B (low 15 bits)
BLTAPTH		EQU $dff050		; Blitter pointer to source A (high 5 bits)
BLTAPTL		EQU $dff052		; Blitter pointer to source A (low 15 bits)
BLTDPTH		EQU $dff054		; Blitter pointer to destination D (high 5 bits)
BLTDPTL		EQU $dff056		; Blitter pointer to destination D (low 15 bits)
BLTSIZE		EQU $dff058		; Blitter start and size (win/width, height)
BLTCON0L	EQU $dff05a		; Blitter control 0 lower 8 bits (minterms)
BLTSIZV		EQU $dff05c		; Blitter V size (for 15 bit vert size)
BLTSIZH		EQU $dff05e		; ECS: Blitter H size & start (for 11 bit H size)
BLTCMOD		EQU $dff060		; Blitter modulo for source C
BLTBMOD		EQU $dff062		; Blitter modulo for source B
BLTAMOD		EQU $dff064		; Blitter modulo for source A
BLTDMOD		EQU $dff066		; Blitter modulo for destination D
BLTCDAT		EQU $dff070		; Blitter source C data reg
BLTBDAT		EQU $dff072		; Blitter source B data reg
BLTADAT		EQU $dff074		; Blitter source A data reg
SPRHDAT		EQU $dff078		; AGA: Ext logic UHRES sprite pointer and data identifier
BPLHDAT		EQU $dff07a		; AGA: Ext logic UHRES bit plane identifier
LISAID		EQU $dff07c		; AGA: Chip revision level for Denise/Lisa
DSKSYNC		EQU $dff07e		; Disk sync pattern
COP1LCH		EQU $dff080		; Write Copper pointer 1 (high 5 bits)
COP1LCL		EQU $dff082		; Write Copper pointer 1 (low 15 bits)
COP2LCH		EQU $dff084		; Write Copper pointer 2 (high 5 bits)
COP2LCL		EQU $dff086		; Write Copper pointer 2 (low 15 bits)
COPJMP1		EQU $dff088		; Trigger Copper 1 (any value)
COPJMP2		EQU $dff08a		; Trigger Copper 2 (any value)
COPINS		EQU $dff08c		; Coprocessor inst fetch identify
DIWSTRT		EQU $dff08e		; Display window start (upper left vert-hor pos)
DIWSTOP		EQU $dff090		; Display window stop (lower right vert-hor pos)
DDFSTRT		EQU $dff092		; Display bitplane data fetch start.hor pos
DDFSTOP		EQU $dff094		; Display bitplane data fetch stop.hor pos
DMACON		EQU $dff096		; DMA control write (clear or set)
CLXCON		EQU $dff098		; Write Sprite collision control bits
INTENA		EQU $dff09a		; Interrupt enable bits (clear or set bits)
INTREQ		EQU $dff09c		; Interrupt request bits (clear or set bits)
ADKCON		EQU $dff09e		; Audio, disk and UART control
AUD0LCH		EQU $dff0a0		; Audio channel 0 pointer (high 5 bits)
AUD0LCL		EQU $dff0a2		; Audio channel 0 pointer (low 15 bits)
AUD0LEN		EQU $dff0a4		; Audio channel 0 length
AUD0PER		EQU $dff0a6		; Audio channel 0 period
AUD0VOL		EQU $dff0a8		; Audio channel 0 volume
AUD0DAT		EQU $dff0aa		; Audio channel 0 data
AUD1LCH		EQU $dff0b0		; Audio channel 1 pointer (high 5 bits)
AUD1LCL		EQU $dff0b2		; Audio channel 1 pointer (low 15 bits)
AUD1LEN		EQU $dff0b4		; Audio channel 1 length
AUD1PER		EQU $dff0b6		; Audio channel 1 period
AUD1VOL		EQU $dff0b8		; Audio channel 1 volume
AUD1DAT		EQU $dff0ba		; Audio channel 1 data
AUD2LCH		EQU $dff0c0		; Audio channel 2 pointer (high 5 bits)
AUD2LCL		EQU $dff0c2		; Audio channel 2 pointer (low 15 bits)
AUD2LEN		EQU $dff0c4		; Audio channel 2 length
AUD2PER		EQU $dff0c6		; Audio channel 2 period
AUD2VOL		EQU $dff0c8		; Audio channel 2 volume
AUD2DAT		EQU $dff0ca		; Audio channel 2 data
AUD3LCH		EQU $dff0d0		; Audio channel 3 pointer (high 5 bits)
AUD3LCL		EQU $dff0d2		; Audio channel 3 pointer (low 15 bits)
AUD3LEN		EQU $dff0d4		; Audio channel 3 length
AUD3PER		EQU $dff0d6		; Audio channel 3 period
AUD3VOL		EQU $dff0d8		; Audio channel 3 volume
AUD3DAT		EQU $dff0da		; Audio channel 3 data
BPL1PTH		EQU $dff0e0		; Bitplane pointer 1 (high 5 bits)
BPL1PTL		EQU $dff0e2		; Bitplane pointer 1 (low 15 bits)
BPL2PTH		EQU $dff0e4		; Bitplane pointer 2 (high 5 bits)
BPL2PTL		EQU $dff0e6		; Bitplane pointer 2 (low 15 bits)
BPL3PTH		EQU $dff0e8		; Bitplane pointer 3 (high 5 bits)
BPL3PTL		EQU $dff0ea		; Bitplane pointer 3 (low 15 bits)
BPL4PTH		EQU $dff0ec		; Bitplane pointer 4 (high 5 bits)
BPL4PTL		EQU $dff0ee		; Bitplane pointer 4 (low 15 bits)
BPL5PTH		EQU $dff0f0		; Bitplane pointer 5 (high 5 bits)
BPL5PTL		EQU $dff0f2		; Bitplane pointer 5 (low 15 bits)
BPL6PTH		EQU $dff0f4		; Bitplane pointer 6 (high 5 bits)
BPL6PTL		EQU $dff0f6		; Bitplane pointer 6 (low 15 bits)
BPL7PTH		EQU $dff0f8		; AGA: Bitplane pointer 7 (high 5 bits)
BPL7PTL		EQU $dff0fa		; AGA: Bitplane pointer 7 (low 15 bits)
BPL8PTH		EQU $dff0fc		; AGA: Bitplane pointer 8 (high 5 bits)
BPL8PTL		EQU $dff0fe		; AGA: Bitplane pointer 8 (low 15 bits)
BPLCON0		EQU $dff100		; Bitplane depth and screen mode)
BPLCON1		EQU $dff102		; Bitplane/playfield horizontal scroll values
BPLCON2		EQU $dff104		; Sprites vs. Playfields priority
BPLCON3		EQU $dff106		; AGA: Bitplane control reg (enhanced features)
BPL1MOD		EQU $dff108		; Bitplane modulo (odd planes)
BPL2MOD		EQU $dff10a		; Bitplane modulo (even planes)
BPLCON4		EQU $dff10c		; AGA: Bitplane control reg (bitplane & sprite masks)
CLXCON2		EQU $dff10e		; AGA: Write Extended sprite collision control bits
BPL1DAT		EQU $dff110		; Bitplane 1 data (parallel to serial convert)
BPL2DAT		EQU $dff112		; Bitplane 2 data (parallel to serial convert)
BPL3DAT		EQU $dff114		; Bitplane 3 data (parallel to serial convert)
BPL4DAT		EQU $dff116		; Bitplane 4 data (parallel to serial convert)
BPL5DAT		EQU $dff118		; Bitplane 5 data (parallel to serial convert)
BPL6DAT		EQU $dff11a		; Bitplane 6 data (parallel to serial convert)
BPL7DAT		EQU $dff11c		; AGA: Bitplane 7 data (parallel to serial convert)
BPL8DAT		EQU $dff11e		; AGA: Bitplane 8 data (parallel to serial convert)
SPR0PTH		EQU $dff120		; Sprite 0 pointer (high 5 bits)
SPR0PTL		EQU $dff122		; Sprite 0 pointer (low 15 bits)
SPR1PTH		EQU $dff124		; Sprite 1 pointer (high 5 bits)
SPR1PTL		EQU $dff126		; Sprite 1 pointer (low 15 bits)
SPR2PTH		EQU $dff128		; Sprite 2 pointer (high 5 bits)
SPR2PTL		EQU $dff12a		; Sprite 2 pointer (low 15 bits)
SPR3PTH		EQU $dff12c		; Sprite 3 pointer (high 5 bits)
SPR3PTL		EQU $dff12e		; Sprite 3 pointer (low 15 bits)
SPR4PTH		EQU $dff130		; Sprite 4 pointer (high 5 bits)
SPR4PTL		EQU $dff132		; Sprite 4 pointer (low 15 bits)
SPR5PTH		EQU $dff134		; Sprite 5 pointer (high 5 bits)
SPR5PTL		EQU $dff136		; Sprite 5 pointer (low 15 bits)
SPR6PTH		EQU $dff138		; Sprite 6 pointer (high 5 bits)
SPR6PTL		EQU $dff13a		; Sprite 6 pointer (low 15 bits)
SPR7PTH		EQU $dff13c		; Sprite 7 pointer (high 5 bits)
SPR7PTL		EQU $dff13e		; Sprite 7 pointer (low 15 bits)
SPR0POS		EQU $dff140		; Sprite 0 vert-horiz start pos data
SPR0CTL		EQU $dff142		; Sprite 0 position and control data
SPR0DATA	EQU $dff144		; Sprite 0 low bitplane data
SPR0DATB	EQU $dff146		; Sprite 0 high bitplane data
SPR1POS		EQU $dff148		; Sprite 1 vert-horiz start pos data
SPR1CTL		EQU $dff14a		; Sprite 1 position and control data
SPR1DATA	EQU $dff14c		; Sprite 1 low bitplane data
SPR1DATB	EQU $dff14e		; Sprite 1 high bitplane data
SPR2POS		EQU $dff150		; Sprite 2 vert-horiz start pos data
SPR2CTL		EQU $dff152		; Sprite 2 position and control data
SPR2DATA	EQU $dff154		; Sprite 2 low bitplane data
SPR2DATB	EQU $dff156		; Sprite 2 high bitplane data
SPR3POS		EQU $dff158		; Sprite 3 vert-horiz start pos data
SPR3CTL		EQU $dff15a		; Sprite 3 position and control data
SPR3DATA	EQU $dff15c		; Sprite 3 low bitplane data
SPR3DATB	EQU $dff15e		; Sprite 3 high bitplane data
SPR4POS		EQU $dff160		; Sprite 4 vert-horiz start pos data
SPR4CTL		EQU $dff162		; Sprite 4 position and control data
SPR4DATA	EQU $dff164		; Sprite 4 low bitplane data
SPR4DATB	EQU $dff166		; Sprite 4 high bitplane data
SPR5POS		EQU $dff168		; Sprite 5 vert-horiz start pos data
SPR5CTL		EQU $dff16a		; Sprite 5 position and control data
SPR5DATA	EQU $dff16c		; Sprite 5 low bitplane data
SPR5DATB	EQU $dff16e		; Sprite 5 high bitplane data
SPR6POS		EQU $dff170		; Sprite 6 vert-horiz start pos data
SPR6CTL		EQU $dff172		; Sprite 6 position and control data
SPR6DATA	EQU $dff174		; Sprite 6 low bitplane data
SPR6DATB	EQU $dff176		; Sprite 6 high bitplane data
SPR7POS		EQU $dff178		; Sprite 7 vert-horiz start pos data
SPR7CTL		EQU $dff17a		; Sprite 7 position and control data
SPR7DATA	EQU $dff17c		; Sprite 7 low bitplane data
SPR7DATB	EQU $dff17e		; Sprite 7 high bitplane data
COLOR00		EQU $dff180		; Palette colour 0
COLOR01		EQU $dff182		; Palette colour 1
COLOR02		EQU $dff184		; Palette colour 2
COLOR03		EQU $dff186		; Palette colour 3
COLOR04		EQU $dff188		; Palette colour 4
COLOR05		EQU $dff18a		; Palette colour 5
COLOR06		EQU $dff18c		; Palette colour 6
COLOR07		EQU $dff18e		; Palette colour 7
COLOR08		EQU $dff190		; Palette colour 8
COLOR09		EQU $dff192		; Palette colour 9
COLOR10		EQU $dff194		; Palette colour 10
COLOR11		EQU $dff196		; Palette colour 11
COLOR12		EQU $dff198		; Palette colour 12
COLOR13		EQU $dff19a		; Palette colour 13
COLOR14		EQU $dff19c		; Palette colour 14
COLOR15		EQU $dff19e		; Palette colour 15
COLOR16		EQU $dff1a0		; Palette colour 16
COLOR17		EQU $dff1a2		; Palette colour 17
COLOR18		EQU $dff1a4		; Palette colour 18
COLOR19		EQU $dff1a6		; Palette colour 19
COLOR20		EQU $dff1a8		; Palette colour 20
COLOR21		EQU $dff1aa		; Palette colour 21
COLOR22		EQU $dff1ac		; Palette colour 22
COLOR23		EQU $dff1ae		; Palette colour 23
COLOR24		EQU $dff1b0		; Palette colour 24
COLOR25		EQU $dff1b2		; Palette colour 25
COLOR26		EQU $dff1b4		; Palette colour 26
COLOR27		EQU $dff1b6		; Palette colour 27
COLOR28		EQU $dff1b8		; Palette colour 28
COLOR29		EQU $dff1ba		; Palette colour 29
COLOR30		EQU $dff1bc		; Palette colour 30
COLOR31		EQU $dff1be		; Palette colour 31
HTOTAL		EQU $dff1c0		; AGA: Highest number count in horiz line (VARBEAMEN = 1)
HSSTOP		EQU $dff1c2		; AGA: Horiz line pos for HSYNC stop
HBSTRT		EQU $dff1c4		; AGA: Horiz line pos for HBLANK start
HBSTOP		EQU $dff1c6		; AGA: Horiz line pos for HBLANK stop
VTOTAL		EQU $dff1c8		; AGA: Highest numbered vertical line (VARBEAMEN = 1)
VSSTOP		EQU $dff1ca		; AGA: Vert line for Vsync stop
VBSTRT		EQU $dff1cc		; AGA: Vert line for VBLANK start
VBSTOP		EQU $dff1ce		; AGA: Vert line for VBLANK stop
SPRHSTRT	EQU $dff1d0		; AGA: UHRES sprite vertical start
SPRHSTOP	EQU $dff1d2		; AGA: UHRES sprite vertical stop
BPLHSTRT	EQU $dff1d4		; AGA: UHRES bit plane vertical start
BPLHSTOP	EQU $dff1d6		; AGA: UHRES bit plane vertical stop
HHPOSW		EQU $dff1d8		; AGA: DUAL mode hires H beam counter write
HHPOSR		EQU $dff1da		; AGA: DUAL mode hires H beam counter read
BEAMCON0	EQU $dff1dc		; Beam counter control register
HSSTRT		EQU $dff1de		; AGA: Horizontal sync start (VARHSY)
VSSTRT		EQU $dff1e0		; AGA: Vertical sync start (VARVSY)
HCENTER		EQU $dff1e2		; AGA: Horizontal pos for vsync on interlace
DIWHIGH		EQU $dff1e4		; AGA: Display window upper bits for start/stop
BPLHMOD		EQU $dff1e6		; AGA: UHRES bit plane modulo
SPRHPTH		EQU $dff1e8		; AGA: UHRES sprite pointer (high 5 bits)
SPRHPTL		EQU $dff1ea		; AGA: UHRES sprite pointer (low 15 bits)
BPLHPTH		EQU $dff1ec		; AGA: VRam (UHRES) bitplane pointer (high 5 bits)
BPLHPTL		EQU $dff1ee		; AGA: VRam (UHRES) bitplane pointer (low 15 bits)
FMODE		EQU $dff1fc		; AGA: Write Fetch mode (0=OCS compatible)
NO_OP		EQU $dff1fe		; No operation/NULL (Copper NOP instruction)

	ENDIF
	