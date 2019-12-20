#ifndef CUSTOM_REGISTERS_H
#define CUSTOM_REGISTERS_H

#define HWREGBASE	0xDFF000

#define	BLTDDAT		HWREGBASE+0x000	/* Blitter destination early read (unusable) */
#define	DMACONR		HWREGBASE+0x002	/* DMA control (and blitter status) read */
#define	VPOSR		HWREGBASE+0x004	/* Read vertical raster position bit 9 (and interlace odd/even frame) */
#define	VHPOSR		HWREGBASE+0x006	/* Rest of raster XY position - High byte: vertical, low byte: horizontal */
#define	DSKDATR		HWREGBASE+0x008	/* Disk data early read (unusable) */
#define	JOY0DAT		HWREGBASE+0x00a	/* Joystick/mouse 0 data */
#define	JOT1DAT		HWREGBASE+0x00c	/* Joystick/mouse 1 data */
#define	CLXDAT		HWREGBASE+0x00e	/* Poll (read and clear) sprite collision state */
#define	ADKCONR		HWREGBASE+0x010	/* Audio, disk control register read */
#define	POT0DAT		HWREGBASE+0x012	/* Pot counter pair 0 data */
#define	POT1DAT		HWREGBASE+0x014	/* Pot counter pair 1 data */
#define	POTGOR		HWREGBASE+0x016	/* Pot pin data read */
#define	SERDATR		HWREGBASE+0x018	/* Serial port data and status read */
#define	DSKBYTR		HWREGBASE+0x01a	/* Disk data byte and status read */
#define	INTENAR		HWREGBASE+0x01c	/* Interrupt enable bits read */
#define	INTREQR		HWREGBASE+0x01e	/* Interrupt request bits read */
#define	DSKPTH		HWREGBASE+0x020	/* Disk track buffer pointer (high 5 bits) */
#define	DSKPTL		HWREGBASE+0x022	/* Disk track buffer pointer (low 15 bits) */
#define	DSKLEN		HWREGBASE+0x024	/* Disk track buffer length */
#define	DSKDAT		HWREGBASE+0x026	/* Disk DMA data write */
#define	REFPTR		HWREGBASE+0x028	/* AGA: Refresh pointer */
#define	VPOSW		HWREGBASE+0x02a	/* Write vert most sig. bits (and frame flop) */
#define	VHPOSW		HWREGBASE+0x02c	/* Write vert and horiz pos of beam */
#define	COPCON		HWREGBASE+0x02e	/* Coprocessor control register (CDANG) */
#define	SERDAT		HWREGBASE+0x030	/* Serial port data and stop bits write */
#define	SERPER		HWREGBASE+0x032	/* Serial port period and control */
#define	POTGO		HWREGBASE+0x034	/* Pot count start, pot pin drive enable data */
#define	JOYTEST		HWREGBASE+0x036	/* Write to all 4 joystick/mouse counters at once */
#define	STREQU		HWREGBASE+0x038	/* Strobe for horiz sync with VBLANK and EQU */
#define	STRVBL		HWREGBASE+0x03a	/* Strobe for horiz sync with VBLANK */
#define	STRHOR		HWREGBASE+0x03c	/* Strobe for horiz sync */
#define	STRLONG		HWREGBASE+0x03e	/* Strobe for identification of long/short horiz line */
#define	BLTCON0		HWREGBASE+0x040	/* Blitter control reg 0 */
#define	BLTCON1		HWREGBASE+0x042	/* Blitter control reg 1 */
#define	BLTAFWM		HWREGBASE+0x044	/* Blitter first word mask for source A */
#define	BLTALWM		HWREGBASE+0x046	/* Blitter last word mask for source A */
#define	BLTCPTH		HWREGBASE+0x048	/* Blitter pointer to source C (high 5 bits) */
#define	BLTCPTL		HWREGBASE+0x04a	/* Blitter pointer to source C (low 15 bits) */
#define	BLTBPTH		HWREGBASE+0x04c	/* Blitter pointer to source B (high 5 bits) */
#define	BLTBPTL		HWREGBASE+0x04e	/* Blitter pointer to source B (low 15 bits) */
#define	BLTAPTH		HWREGBASE+0x050	/* Blitter pointer to source A (high 5 bits) */
#define	BLTAPTL		HWREGBASE+0x052	/* Blitter pointer to source A (low 15 bits) */
#define	BLTDPTH		HWREGBASE+0x054	/* Blitter pointer to destination D (high 5 bits) */
#define	BLTDPTL		HWREGBASE+0x056	/* Blitter pointer to destination D (low 15 bits) */
#define	BLTSIZE		HWREGBASE+0x058	/* Blitter start and size (win/width, height) */
#define	BLTCON0L	HWREGBASE+0x05a	/* Blitter control 0 lower 8 bits (minterms) */
#define	BLTSIZV		HWREGBASE+0x05c	/* Blitter V size (for 15 bit vert size) */
#define	BLTSIZH		HWREGBASE+0x05e	/* ECS: Blitter H size & start (for 11 bit H size) */
#define	BLTCMOD		HWREGBASE+0x060	/* Blitter modulo for source C */
#define	BLTBMOD		HWREGBASE+0x062	/* Blitter modulo for source B */
#define	BLTAMOD		HWREGBASE+0x064	/* Blitter modulo for source A */
#define	BLTDMOD		HWREGBASE+0x066	/* Blitter modulo for destination D */
#define	BLTCDAT		HWREGBASE+0x070	/* Blitter source C data reg */
#define	BLTBDAT		HWREGBASE+0x072	/* Blitter source B data reg */
#define	BLTADAT		HWREGBASE+0x074	/* Blitter source A data reg */
#define	SPRHDAT		HWREGBASE+0x078	/* AGA: Ext logic UHRES sprite pointer and data identifier */
#define	BPLHDAT		HWREGBASE+0x07a	/* AGA: Ext logic UHRES bit plane identifier */
#define	LISAID		HWREGBASE+0x07c	/* AGA: Chip revision level for Denise/Lisa */
#define	DSKSYNC		HWREGBASE+0x07e	/* Disk sync pattern */
#define	COP1LCH		HWREGBASE+0x080	/* Write Copper pointer 1 (high 5 bits) */
#define	COP1LCL		HWREGBASE+0x082	/* Write Copper pointer 1 (low 15 bits) */
#define	COP2LCH		HWREGBASE+0x084	/* Write Copper pointer 2 (high 5 bits) */
#define	COP2LCL		HWREGBASE+0x086	/* Write Copper pointer 2 (low 15 bits) */
#define	COPJMP1		HWREGBASE+0x088	/* Trigger Copper 1 (any value) */
#define	COPJMP2		HWREGBASE+0x08a	/* Trigger Copper 2 (any value) */
#define	COPINS		HWREGBASE+0x08c	/* Coprocessor inst fetch identify */
#define	DIWSTRT		HWREGBASE+0x08e	/* Display window start (upper left vert-hor pos) */
#define	DIWSTOP		HWREGBASE+0x090	/* Display window stop (lower right vert-hor pos) */
#define	DDFSTRT		HWREGBASE+0x092	/* Display bitplane data fetch start.hor pos */
#define	DDFSTOP		HWREGBASE+0x094	/* Display bitplane data fetch stop.hor pos */
#define	DMACON		HWREGBASE+0x096	/* DMA control write (clear or set) */
#define	CLXCON		HWREGBASE+0x098	/* Write Sprite collision control bits */
#define	INTENA		HWREGBASE+0x09a	/* Interrupt enable bits (clear or set bits) */
#define	INTREQ		HWREGBASE+0x09c	/* Interrupt request bits (clear or set bits) */
#define	ADKCON		HWREGBASE+0x09e	/* Audio, disk and UART control */
#define	AUD0LCH		HWREGBASE+0x0a0	/* Audio channel 0 pointer (high 5 bits) */
#define	AUD0LCL		HWREGBASE+0x0a2	/* Audio channel 0 pointer (low 15 bits) */
#define	AUD0LEN		HWREGBASE+0x0a4	/* Audio channel 0 length */
#define	AUD0PER		HWREGBASE+0x0a6	/* Audio channel 0 period */
#define	AUD0VOL		HWREGBASE+0x0a8	/* Audio channel 0 volume */
#define	AUD0DAT		HWREGBASE+0x0aa	/* Audio channel 0 data */
#define	AUD1LCH		HWREGBASE+0x0b0	/* Audio channel 1 pointer (high 5 bits) */
#define	AUD1LCL		HWREGBASE+0x0b2	/* Audio channel 1 pointer (low 15 bits) */
#define	AUD1LEN		HWREGBASE+0x0b4	/* Audio channel 1 length */
#define	AUD1PER		HWREGBASE+0x0b6	/* Audio channel 1 period */
#define	AUD1VOL		HWREGBASE+0x0b8	/* Audio channel 1 volume */
#define	AUD1DAT		HWREGBASE+0x0ba	/* Audio channel 1 data */
#define	AUD2LCH		HWREGBASE+0x0c0	/* Audio channel 2 pointer (high 5 bits) */
#define	AUD2LCL		HWREGBASE+0x0c2	/* Audio channel 2 pointer (low 15 bits) */
#define	AUD2LEN		HWREGBASE+0x0c4	/* Audio channel 2 length */
#define	AUD2PER		HWREGBASE+0x0c6	/* Audio channel 2 period */
#define	AUD2VOL		HWREGBASE+0x0c8	/* Audio channel 2 volume */
#define	AUD2DAT		HWREGBASE+0x0ca	/* Audio channel 2 data */
#define	AUD3LCH		HWREGBASE+0x0d0	/* Audio channel 3 pointer (high 5 bits) */
#define	AUD3LCL		HWREGBASE+0x0d2	/* Audio channel 3 pointer (low 15 bits) */
#define	AUD3LEN		HWREGBASE+0x0d4	/* Audio channel 3 length */
#define	AUD3PER		HWREGBASE+0x0d6	/* Audio channel 3 period */
#define	AUD3VOL		HWREGBASE+0x0d8	/* Audio channel 3 volume */
#define	AUD3DAT		HWREGBASE+0x0da	/* Audio channel 3 data */
#define	BPL1PTH		HWREGBASE+0x0e0	/* Bitplane pointer 1 (high 5 bits) */
#define	BPL1PTL		HWREGBASE+0x0e2	/* Bitplane pointer 1 (low 15 bits) */
#define	BPL2PTH		HWREGBASE+0x0e4	/* Bitplane pointer 2 (high 5 bits) */
#define	BPL2PTL		HWREGBASE+0x0e6	/* Bitplane pointer 2 (low 15 bits) */
#define	BPL3PTH		HWREGBASE+0x0e8	/* Bitplane pointer 3 (high 5 bits) */
#define	BPL3PTL		HWREGBASE+0x0ea	/* Bitplane pointer 3 (low 15 bits) */
#define	BPL4PTH		HWREGBASE+0x0ec	/* Bitplane pointer 4 (high 5 bits) */
#define	BPL4PTL		HWREGBASE+0x0ee	/* Bitplane pointer 4 (low 15 bits) */
#define	BPL5PTH		HWREGBASE+0x0f0	/* Bitplane pointer 5 (high 5 bits) */
#define	BPL5PTL		HWREGBASE+0x0f2	/* Bitplane pointer 5 (low 15 bits) */
#define	BPL6PTH		HWREGBASE+0x0f4	/* Bitplane pointer 6 (high 5 bits) */
#define	BPL6PTL		HWREGBASE+0x0f6	/* Bitplane pointer 6 (low 15 bits) */
#define	BPL7PTH		HWREGBASE+0x0f8	/* AGA: Bitplane pointer 7 (high 5 bits) */
#define	BPL7PTL		HWREGBASE+0x0fa	/* AGA: Bitplane pointer 7 (low 15 bits) */
#define	BPL8PTH		HWREGBASE+0x0fc	/* AGA: Bitplane pointer 8 (high 5 bits) */
#define	BPL8PTL		HWREGBASE+0x0fe	/* AGA: Bitplane pointer 8 (low 15 bits) */
#define	BPLCON0		HWREGBASE+0x100	/* Bitplane depth and screen mode) */
#define	BPLCON1		HWREGBASE+0x102	/* Bitplane/playfield horizontal scroll values */
#define	BPLCON2		HWREGBASE+0x104	/* Sprites vs. Playfields priority */
#define	BPLCON3		HWREGBASE+0x106	/* AGA: Bitplane control reg (enhanced features) */
#define	BPL1MOD		HWREGBASE+0x108	/* Bitplane modulo (odd planes) */
#define	BPL2MOD		HWREGBASE+0x10a	/* Bitplane modulo (even planes) */
#define	BPLCON4		HWREGBASE+0x10c	/* AGA: Bitplane control reg (bitplane & sprite masks) */
#define	CLXCON2		HWREGBASE+0x10e	/* AGA: Write Extended sprite collision control bits */
#define	BPL1DAT		HWREGBASE+0x110	/* Bitplane 1 data (parallel to serial convert) */
#define	BPL2DAT		HWREGBASE+0x112	/* Bitplane 2 data (parallel to serial convert) */
#define	BPL3DAT		HWREGBASE+0x114	/* Bitplane 3 data (parallel to serial convert) */
#define	BPL4DAT		HWREGBASE+0x116	/* Bitplane 4 data (parallel to serial convert) */
#define	BPL5DAT		HWREGBASE+0x118	/* Bitplane 5 data (parallel to serial convert) */
#define	BPL6DAT		HWREGBASE+0x11a	/* Bitplane 6 data (parallel to serial convert) */
#define	BPL7DAT		HWREGBASE+0x11c	/* AGA: Bitplane 7 data (parallel to serial convert) */
#define	BPL8DAT		HWREGBASE+0x11e	/* AGA: Bitplane 8 data (parallel to serial convert) */
#define	SPR0PTH		HWREGBASE+0x120	/* Sprite 0 pointer (high 5 bits) */
#define	SPR0PTL		HWREGBASE+0x122	/* Sprite 0 pointer (low 15 bits) */
#define	SPR1PTH		HWREGBASE+0x124	/* Sprite 1 pointer (high 5 bits) */
#define	SPR1PTL		HWREGBASE+0x126	/* Sprite 1 pointer (low 15 bits) */
#define	SPR2PTH		HWREGBASE+0x128	/* Sprite 2 pointer (high 5 bits) */
#define	SPR2PTL		HWREGBASE+0x12a	/* Sprite 2 pointer (low 15 bits) */
#define	SPR3PTH		HWREGBASE+0x12c	/* Sprite 3 pointer (high 5 bits) */
#define	SPR3PTL		HWREGBASE+0x12e	/* Sprite 3 pointer (low 15 bits) */
#define	SPR4PTH		HWREGBASE+0x130	/* Sprite 4 pointer (high 5 bits) */
#define	SPR4PTL		HWREGBASE+0x132	/* Sprite 4 pointer (low 15 bits) */
#define	SPR5PTH		HWREGBASE+0x134	/* Sprite 5 pointer (high 5 bits) */
#define	SPR5PTL		HWREGBASE+0x136	/* Sprite 5 pointer (low 15 bits) */
#define	SPR6PTH		HWREGBASE+0x138	/* Sprite 6 pointer (high 5 bits) */
#define	SPR6PTL		HWREGBASE+0x13a	/* Sprite 6 pointer (low 15 bits) */
#define	SPR7PTH		HWREGBASE+0x13c	/* Sprite 7 pointer (high 5 bits) */
#define	SPR7PTL		HWREGBASE+0x13e	/* Sprite 7 pointer (low 15 bits) */
#define	SPR0POS		HWREGBASE+0x140	/* Sprite 0 vert-horiz start pos data */
#define	SPR0CTL		HWREGBASE+0x142	/* Sprite 0 position and control data */
#define	SPR0DATA	HWREGBASE+0x144	/* Sprite 0 low bitplane data */
#define	SPR0DATB	HWREGBASE+0x146	/* Sprite 0 high bitplane data */
#define	SPR1POS		HWREGBASE+0x148	/* Sprite 1 vert-horiz start pos data */
#define	SPR1CTL		HWREGBASE+0x14a	/* Sprite 1 position and control data */
#define	SPR1DATA	HWREGBASE+0x14c	/* Sprite 1 low bitplane data */
#define	SPR1DATB	HWREGBASE+0x14e	/* Sprite 1 high bitplane data */
#define	SPR2POS		HWREGBASE+0x150	/* Sprite 2 vert-horiz start pos data */
#define	SPR2CTL		HWREGBASE+0x152	/* Sprite 2 position and control data */
#define	SPR2DATA	HWREGBASE+0x154	/* Sprite 2 low bitplane data */
#define	SPR2DATB	HWREGBASE+0x156	/* Sprite 2 high bitplane data */
#define	SPR3POS		HWREGBASE+0x158	/* Sprite 3 vert-horiz start pos data */
#define	SPR3CTL		HWREGBASE+0x15a	/* Sprite 3 position and control data */
#define	SPR3DATA	HWREGBASE+0x15c	/* Sprite 3 low bitplane data */
#define	SPR3DATB	HWREGBASE+0x15e	/* Sprite 3 high bitplane data */
#define	SPR4POS		HWREGBASE+0x160	/* Sprite 4 vert-horiz start pos data */
#define	SPR4CTL		HWREGBASE+0x162	/* Sprite 4 position and control data */
#define	SPR4DATA	HWREGBASE+0x164	/* Sprite 4 low bitplane data */
#define	SPR4DATB	HWREGBASE+0x166	/* Sprite 4 high bitplane data */
#define	SPR5POS		HWREGBASE+0x168	/* Sprite 5 vert-horiz start pos data */
#define	SPR5CTL		HWREGBASE+0x16a	/* Sprite 5 position and control data */
#define	SPR5DATA	HWREGBASE+0x16c	/* Sprite 5 low bitplane data */
#define	SPR5DATB	HWREGBASE+0x16e	/* Sprite 5 high bitplane data */
#define	SPR6POS		HWREGBASE+0x170	/* Sprite 6 vert-horiz start pos data */
#define	SPR6CTL		HWREGBASE+0x172	/* Sprite 6 position and control data */
#define	SPR6DATA	HWREGBASE+0x174	/* Sprite 6 low bitplane data */
#define	SPR6DATB	HWREGBASE+0x176	/* Sprite 6 high bitplane data */
#define	SPR7POS		HWREGBASE+0x178	/* Sprite 7 vert-horiz start pos data */
#define	SPR7CTL		HWREGBASE+0x17a	/* Sprite 7 position and control data */
#define	SPR7DATA	HWREGBASE+0x17c	/* Sprite 7 low bitplane data */
#define	SPR7DATB	HWREGBASE+0x17e	/* Sprite 7 high bitplane data */
#define	COLOR00		HWREGBASE+0x180	/* Palette colour 0 */
#define	COLOR01		HWREGBASE+0x182	/* Palette colour 1 */
#define	COLOR02		HWREGBASE+0x184	/* Palette colour 2 */
#define	COLOR03		HWREGBASE+0x186	/* Palette colour 3 */
#define	COLOR04		HWREGBASE+0x188	/* Palette colour 4 */
#define	COLOR05		HWREGBASE+0x18a	/* Palette colour 5 */
#define	COLOR06		HWREGBASE+0x18c	/* Palette colour 6 */
#define	COLOR07		HWREGBASE+0x18e	/* Palette colour 7 */
#define	COLOR08		HWREGBASE+0x190	/* Palette colour 8 */
#define	COLOR09		HWREGBASE+0x192	/* Palette colour 9 */
#define	COLOR10		HWREGBASE+0x194	/* Palette colour 10 */
#define	COLOR11		HWREGBASE+0x196	/* Palette colour 11 */
#define	COLOR12		HWREGBASE+0x198	/* Palette colour 12 */
#define	COLOR13		HWREGBASE+0x19a	/* Palette colour 13 */
#define	COLOR14		HWREGBASE+0x19c	/* Palette colour 14 */
#define	COLOR15		HWREGBASE+0x19e	/* Palette colour 15 */
#define	COLOR16		HWREGBASE+0x1a0	/* Palette colour 16 */
#define	COLOR17		HWREGBASE+0x1a2	/* Palette colour 17 */
#define	COLOR18		HWREGBASE+0x1a4	/* Palette colour 18 */
#define	COLOR19		HWREGBASE+0x1a6	/* Palette colour 19 */
#define	COLOR20		HWREGBASE+0x1a8	/* Palette colour 20 */
#define	COLOR21		HWREGBASE+0x1aa	/* Palette colour 21 */
#define	COLOR22		HWREGBASE+0x1ac	/* Palette colour 22 */
#define	COLOR23		HWREGBASE+0x1ae	/* Palette colour 23 */
#define	COLOR24		HWREGBASE+0x1b0	/* Palette colour 24 */
#define	COLOR25		HWREGBASE+0x1b2	/* Palette colour 25 */
#define	COLOR26		HWREGBASE+0x1b4	/* Palette colour 26 */
#define	COLOR27		HWREGBASE+0x1b6	/* Palette colour 27 */
#define	COLOR28		HWREGBASE+0x1b8	/* Palette colour 28 */
#define	COLOR29		HWREGBASE+0x1ba	/* Palette colour 29 */
#define	COLOR30		HWREGBASE+0x1bc	/* Palette colour 30 */
#define	COLOR31		HWREGBASE+0x1be	/* Palette colour 31 */
#define	HTOTAL		HWREGBASE+0x1c0	/* AGA: Highest number count in horiz line (VARBEAMEN = 1) */
#define	HSSTOP		HWREGBASE+0x1c2	/* AGA: Horiz line pos for HSYNC stop */
#define	HBSTRT		HWREGBASE+0x1c4	/* AGA: Horiz line pos for HBLANK start */
#define	HBSTOP		HWREGBASE+0x1c6	/* AGA: Horiz line pos for HBLANK stop */
#define	VTOTAL		HWREGBASE+0x1c8	/* AGA: Highest numbered vertical line (VARBEAMEN = 1) */
#define	VSSTOP		HWREGBASE+0x1ca	/* AGA: Vert line for Vsync stop */
#define	VBSTRT		HWREGBASE+0x1cc	/* AGA: Vert line for VBLANK start */
#define	VBSTOP		HWREGBASE+0x1ce	/* AGA: Vert line for VBLANK stop */
#define	SPRHSTRT	HWREGBASE+0x1d0	/* AGA: UHRES sprite vertical start */
#define	SPRHSTOP	HWREGBASE+0x1d2	/* AGA: UHRES sprite vertical stop */
#define	BPLHSTRT	HWREGBASE+0x1d4	/* AGA: UHRES bit plane vertical start */
#define	BPLHSTOP	HWREGBASE+0x1d6	/* AGA: UHRES bit plane vertical stop */
#define	HHPOSW		HWREGBASE+0x1d8	/* AGA: DUAL mode hires H beam counter write */
#define	HHPOSR		HWREGBASE+0x1da	/* AGA: DUAL mode hires H beam counter read */
#define	BEAMCON0	HWREGBASE+0x1dc	/* Beam counter control register */
#define	HSSTRT		HWREGBASE+0x1de	/* AGA: Horizontal sync start (VARHSY) */
#define	VSSTRT		HWREGBASE+0x1e0	/* AGA: Vertical sync start (VARVSY) */
#define	HCENTER		HWREGBASE+0x1e2	/* AGA: Horizontal pos for vsync on interlace */
#define	DIWHIGH		HWREGBASE+0x1e4	/* AGA: Display window upper bits for start/stop */
#define	BPLHMOD		HWREGBASE+0x1e6	/* AGA: UHRES bit plane modulo */
#define	SPRHPTH		HWREGBASE+0x1e8	/* AGA: UHRES sprite pointer (high 5 bits) */
#define	SPRHPTL		HWREGBASE+0x1ea	/* AGA: UHRES sprite pointer (low 15 bits) */
#define	BPLHPTH		HWREGBASE+0x1ec	/* AGA: VRam (UHRES) bitplane pointer (high 5 bits) */
#define	BPLHPTL		HWREGBASE+0x1ee	/* AGA: VRam (UHRES) bitplane pointer (low 15 bits) */
#define	FMODE		HWREGBASE+0x1fc	/* AGA: Write Fetch mode (0=OCS compatible) */
#define	NO_OP		HWREGBASE+0x1fe	/* No operation/NULL (Copper NOP instruction) */

#endif
