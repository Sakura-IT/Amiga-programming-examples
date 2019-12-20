; Based on: http://stingray.untergrund.net/MiniStartup.s

	include lvo/exec_lib.i
	include lvo/graphics_lib.i

	include utils/utils_def.i
	include utils/hardware/custom_registers.i

	xdef _SetVBI
	xdef SetVBI
	xdef _ClearVBI
	xdef ClearVBI


	xdef _SystemSave
	xdef SystemSave

	xdef _SystemRestore
	xdef SystemRestore

INTENASET	= %1100000000100000
DMASET		= %1000001111100000

	section .text,code
	
_SystemSave:
SystemSave:
	movem.l	d0-a6,-(a7)
	move.l	$4.w,a6

	lea	GFXname,a1

	moveq	#0,d0
	CALLLIB	OpenLibrary
	move.l	d0,GFXbase
	beq.b	.END

	move.l	d0,a6
	move.l	34(a6),OldView
	sub.l	a1,a1
	bsr.w	DoView
	move.l	$26(a6),OldCop1	; Store old CL 1
	move.l	$32(a6),OldCop2	; Store old CL 2
	
	bsr	GetVBR

	move.l	d0,VBRptr
	move.l	d0,a0

	;***	Store Custom Regs	***

	lea	$dff000,a6				; base address
	move.w	$10(a6),ADK			; Store old ADKCON
	move.w	$1C(a6),OldINTENA	; Store old INTENA
	move.w	$02(a6),DMAVal		; Store old DMA
	move.w	#$7FFF,d0
	jsr	WaitRaster
	move.w	d0,$9A(a6)			; Disable Interrupts
	move.w	d0,$96(a6)			; Clear all DMA channels
	move.w	d0,$9C(a6)			; Clear all INT requests

	move.l	$6c(a0),OldVBI
	lea	NewVBI,a1
	move.l	a1,$6c(a0)

	move.w	#INTENASET!$C000,$9A(a6)	; set Interrupts+ BIT 14/15
	move.w	#DMASET!$8200,$96(a6)		; set DMA	+ BIT 09/15

.END:
	movem.l	(a7)+,d0-a6

    rts

_SystemRestore:
SystemRestore:
	movem.l	d0-a6,-(a7)

	lea	$dff000,a6
	clr.l	VBIptr

	move.w	#$8000,d0
	or.w	d0,OldINTENA	; SET/CLR-Bit to 1
	or.w	d0,DMAVal		; SET/CLR-Bit to 1
	or.w	d0,ADK			; SET/CLR-Bit to 1
	subq.w	#1,d0
	jsr	WaitRaster
	move.w	d0,$9A(a6)					; Clear all INT bits
	move.w	d0,$96(a6)					; Clear all DMA channels
	move.w	d0,$9C(a6)					; Clear all INT requests

	move.l	VBRptr,a0
	move.l	OldVBI,$6c(a0)

	move.l	OldCop1,$80(a6)			; Restore old CL 1
	move.l	OldCop2,$84(a6)			; Restore old CL 2
	move.w	d0,$88(a6)					; start copper1
	move.w	OldINTENA,$9A(a6)		; Restore INTENA
	move.w	DMAVal,$96(a6)			; Restore DMAcon
	move.w	ADK,$9E(a6)				; Restore ADKcon

	move.l	GFXbase,a6
	move.l	OldView,a1				; restore old viewport
	bsr.b	DoView

	move.l	a6,a1
	move.l	$4.w,a6
	CALLLIB CloseLibrary
	movem.l	(a7)+,d0-a6

	rts

DoView:
	; Two WaitTOF() calls are needed after the LoadView to wait for both the
	; long and short frame copperlists of interlaced displays to finish.

	CALLLIB LoadView
	CALLLIB WaitTOF
	JMPLIB WaitTOF

*******************************************
*** Get Address of the VBR		***
*******************************************

GetVBR:
	move.l	a5,-(a7)
	moveq	#0,d0				; default at $0
	move.l	$4.w,a6
	btst	#0,296+1(a6)		; 68010+?
	beq.b	.is68k				; nope.
	lea		.getit(pc),a5
	CALLLIB Supervisor

.is68k:
	move.l	(a7)+,a5
	rts

.getit:

	mc68010
	movec   vbr,d0
	mc68000

	rte				; back to user state code

*******************************************
*** VERTICAL BLANK (VBI)		        ***
*******************************************

_ClearVBI:
ClearVBI:
	moveq	#0,d0

_SetVBI:
SetVBI:
	move.l	VBIptr,a0
	move.l	d0, VBIptr
	move.l	a0,d0
	rts

NewVBI:
	movem.l	d0-a6,-(a7)
	move.l	VBIptr,d0
	beq.b	noVBI
	move.l	d0,a0
	jsr	(a0)
	
noVBI:
	lea	$dff09c,a6
	moveq	#$20,d0
	move.w	d0,(a6)
	move.w	d0,(a6)			; twice to avoid a4k hw bug
	movem.l	(a7)+,d0-a6
	rte

; *******************************************************************************
; *******************************************************************************
; DATA
; *******************************************************************************
; *******************************************************************************

	section .data,data

	CNOP 0,2
GFXname:	dc.b	'graphics.library',0

	section .bss,bss

	CNOP 0,2
GFXbase:	ds.l 1
OldView:	ds.l 1
OldCop1:	ds.l 1
OldCop2:	ds.l 1
VBRptr:		ds.l 1
OldVBI:		ds.l 1
ADK:		ds.w 1
OldINTENA:	ds.w 1
DMAVal:		ds.w 1
VBIptr:		ds.l 1
