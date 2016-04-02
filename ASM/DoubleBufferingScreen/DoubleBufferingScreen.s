;
; Double buffering screen 
;
;-----------------------------------------------------------------------------

	INCDIR	"includes:"
	INCLUDE	"hardware/cia.i"
	INCLUDE	"hardware/custom.i"
	INCLUDE	"hardware/dmabits.i"
	INCLUDE	"hardware/intbits.i"

_custom		equ	$dff000
_ciaa		equ	$bfe001

SCREEN_WIDTH		= 320
SCREEN_HEIGHT		= 256
SCREEN_BPL		= 4
SCREEN_BROW		= SCREEN_WIDTH/8
SCREEN_LINE		= SCREEN_BROW*SCREEN_BPL

SCREEN_MODULO		= (SCREEN_BPL-1)*SCREEN_BROW

SCREEN_MEMSIZE		= SCREEN_LINE*SCREEN_HEIGHT
COPPER_MEMSIZE		= (SCREEN_BPL*2+3)*4

CHIPDATA_MEMSIZE = SCREEN_MEMSIZE*2+COPPER_MEMSIZE*2
;-----------------------------------------------------------------------------
;
;in
;	a5 - _custom
;
WAIT_BEAM:	MACRO
		lea	vposr(a5),a0
.1\@		moveq	#1,d0
		and.w	(a0),d0
		bne.b	.1\@
.2\@		moveq	#1,d0
		and.w	(a0),d0
		beq.b	.2\@
	ENDM

;-----------------------------------------------------------------------------
	RSRESET
screenWrk:	rs.l	1
screenTmp:	rs.l	1
copperWrk:	rs.l	1
copperTmp:	rs.l	1
oldStack:	rs.l	1
oldView:	rs.l	1
oldIntena:	rs.w	1
oldDma:		rs.w	1
gfxBase:	rs.l	1
dt_SIZEOF:	rs.b	0

;-----------------------------------------------------------------------------

Program:
		bsr.b	DoVariables
		bsr.w	OpenGraphicsLibrary
		beq.b	Exit
		bsr.w	DisableOs
		bsr.b	Main
Quit:		bsr.w	EnableOs
Exit:		bsr.w	CloseGraphicsLibrary
		move.l	dt+oldStack(pc),a7	;restore old stack
		rts

;-----------------------------------------------------------------------------
Main:
		bsr.w	Init

	;temporary things to show that double buffering works
		moveq	#-1,d0
		move.l	screenWrk(a6),a0
		move.l	d0,(a0)
		move.l	screenTmp(a6),a0
		add.l	#SCREEN_LINE*16,a0
		move.l	d0,(a0)

Loop:		WAIT_BEAM
		bsr.b	ScreenSwapPointers

.checkLmb
		btst	#6,_ciaa
		bne.b	Loop
		rts

;-----------------------------------------------------------------------------
;in
;a6	dt
;
ScreenSwapPointers:
		lea	screenWrk(a6),a0
		move.l	(a0)+,d0
		move.l	(a0),d1
		move.l	d0,(a0)
		move.l	d1,-(a0)
		rts

;-----------------------------------------------------------------------------
;
;out
;a6	dt
;
DoVariables:
		lea	dt(pc),a6

	;clear dt
		move.l	a6,a0
		moveq	#0,d0
		move.w	#dt_SIZEOF/4-1,d1
.clear		move.l	d0,(a0)+
		dbf	d1,.clear

		lea	chipData,a0

	IFND KICKSTART2
	;clear BSS area 
		move.l	a0,a1
		move.l	#CHIPDATA_MEMSIZE/4,d1
.clearBSS	move.l	d0,(a1)+
		subq.l	#1,d1
		bne.b	.clearBSS
	ENDC

	;set chip pointers
		move.l	a0,screenWrk(a6)
		add.l	#SCREEN_MEMSIZE,a0
		move.l	a0,screenTmp(a6)
		add.l	#SCREEN_MEMSIZE,a0
		move.l	a0,copperWrk(a6)
		add.l	#COPPER_MEMSIZE,a0
		move.l	a0,copperTmp(a6)

	;store old stack pointer
		lea	4(a7),a0
		move.l	a0,oldStack(a6)

		rts

;-----------------------------------------------------------------------------
;in
;a6	dt
;
;out
;a5	_custom
;
DisableOs:
	;save old view
		move.l	gfxBase(a6),a5
		move.l	$22(a5),oldView(a6)
		exg	a5,a6

	;set no view 
		sub.l	a1,a1
		bsr.b	LoadView

	;takeover the blitter
		jsr	-456(a6)	;gfx OwnBlitter
		jsr	-228(a6)	;gfx WaitBlit

		move.l	a5,a6

	;store hardware registers
		lea	_custom,a5
		move.w	#$c000,d1

		move.w	intenar(a5),d0
		or.w	d1,d0
		move.w	d0,oldIntena(a6)

		add.w	d1,d1
		move.w	dmaconr(a5),d0
		or.w	d1,d0
		move.w	d0,oldDma(a6)

		bra.b	StopDmaAndIntsAtVBlank

;-----------------------------------------------------------------------------
;in
;	a6 - gfx base
;	a1 - view
LoadView:
		jsr	-222(a6)	;gfx LoadView(view)
		jsr	-270(a6)	;gfx WaitTOF()
		jmp	-270(a6)	;gfx WaitTOF()

;-----------------------------------------------------------------------------
;
;in
;	a5 - custom
;
StopDmaAndIntsAtVBlank:
		WAIT_BEAM
		move.w	#$7fff,d0
		move.w	d0,dmacon(a5)	;dma off
		move.w	d0,intena(a5)	;disable ints
		move.w	d0,intreq(a5)	;clear pending ints
		rts

;-----------------------------------------------------------------------------
;in
;a5	custom
;a6	dt
;
EnableOs:
		move.l	a6,a4

		move.l	gfxBase(a4),a6
		jsr	-228(a6)	;gfx WaitBlit()

		bsr.b	StopDmaAndIntsAtVBlank

	;restore hardware regs
		move.w	oldIntena(a4),intena(a5)
		move.w	oldDma(a4),dmacon(a5)

		jsr	-462(a6)	;gfx DisownBlitter()

	;load old view
		move.l	oldView(a4),a1
		bsr.b	LoadView

		move.l	$26(a6),cop1lc(a5)

		move.l	a4,a6
		rts

;-----------------------------------------------------------------------------
;
;in
;a6	dt
;
;out
;d0	zero mean some library do not open 
;	non zero everything were ok
;
OpenGraphicsLibrary:
		move.l	4.w,a6			;exec base
		lea	.gfxName(pc),a1		;library name
		jsr	-408(a6)		;exec OldOpenLibrary()
		lea	dt(pc),a6
		move.l	d0,gfxBase(a6)		;store result of opening
		rts

.gfxName:	dc.b	'graphics.library',0,0

;-----------------------------------------------------------------------------
;
;in
;a6	dt
;
;out
;a6	exec base
;
CloseGraphicsLibrary:
		move.l	gfxBase(a6),a1	;library base
		move.l	4.w,a6		;exec base
	IFND KICKSTART2
		move.l	a1,d0		;trick to check if lib base is zero
		beq.b	.exit
	ENDC
		jsr	-414(a6)	;exec CloseLibrary
.exit		rts

;-----------------------------------------------------------------------------
; in
;a5 - custom
; out
;a6 - dt variables
;
Init:
	;set screen hardware registers
		lea	pubScreenRegs(pc),a0
		moveq	#(pubScreenRegsEnd-pubScreenRegs)/4-1,d0
.setScreenRegs
		move.w	(a0)+,d1
		move.w	(a0)+,(a5,d1.w)
		dbf	d0,.setScreenRegs

	;for aga machines reset fmode and bplcon3
		move.w	#$2200,d0
		move.w	vposr(a5),d1
		and.w	d0,d1
		cmp.w	d0,d1
		bne.b	.makeCoppers

		moveq	#0,d0
		move.w	d0,fmode(a5)
		move.w	d0,bplcon3(a5)

.makeCoppers
	;first copper list
		move.l	copperWrk(a6),a0
		move.l	screenWrk(a6),d0
		move.l	copperTmp(a6),d5
		bsr.b	CopperMakeList

	;second copper list
		move.l	copperTmp(a6),a0
		move.l	screenTmp(a6),d0
		move.l	copperWrk(a6),d5
		bsr.b	CopperMakeList

	;set first copperlist
		move.l	copperWrk(a6),cop1lc(a5)
		move.w	#DMAF_SETCLR|DMAF_MASTER|DMAF_RASTER|DMAF_COPPER,dmacon(a5)

		rts

;-----------------------------------------------------------------------------
;in
;	a0 - copper
;	d0 - screen
;	d5 - copper address to set in copperlist
;	a6 - dt
;out
;
CopperMakeList:
	;add bitplanes
		moveq	#2,d1
		move.w	#bplpt,d2
		swap	d1
		moveq	#SCREEN_BPL-1,d3
		moveq	#SCREEN_BROW,d4
		bsr	.copperSetPointers

	;add copper adress
		move.w	#cop1lc,d2
		moveq	#1-1,d3
		move.l	d5,d0
		moveq	#0,d4
		bsr	.copperSetPointers

	;add end copperlist
		moveq	#-2,d0
		move.l	d0,(a0)+

		rts

;
;in	a0 - copper
;	d0 - address 
;	d1 - $02000000
;	d2 - pt (for example bplpt)
;	d3 - amount of pt - 1
;	d4 - value to add to address
;
.copperSetPointers:
		swap	d2

.setPointers	swap	d0
		move.w	d0,d2
		move.l	d2,(a0)+
		add.l	d1,d2
		swap	d0
		move.w	d0,d2
		move.l	d2,(a0)+
		add.l	d1,d2
		add.l	d4,d0
		dbf	d3,.setPointers
		rts

;-----------------------------------------------------------------------------

dt:		ds.b	dt_SIZEOF

pubScreenRegs:
		dc.w	color,0		;black background (color0)
		dc.w	color+2,$fff	;white color1
		dc.w	diwstrt,$2c81	;standard borders 
		dc.w	diwstop,$2cc1
		dc.w	ddfstrt,$0038
		dc.w	ddfstop,$00d0
		dc.w	bplcon0,SCREEN_BPL*$1000+$200
		dc.w	bplcon1,0
		dc.w	bplcon2,0
		dc.w	bpl1mod,SCREEN_MODULO
		dc.w	bpl2mod,SCREEN_MODULO
		dc.w	spr+sd_ctl,0	;disarm mouse pointer sprite
pubScreenRegsEnd:

;-----------------------------------------------------------------------------

	SECTION	screens,BSS_C

chipData:	ds.b	CHIPDATA_MEMSIZE
