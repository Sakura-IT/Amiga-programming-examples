����                                        *********************************
* 640x512x4 (16 col) interlaced	*
* Based on example from Kurs	*
* asemblera dla poczatkujacych	*
* Adam Doligalski with fix.	*
* Init source from '90		*
* Fix 01.03.2020 HoneyBadger	*
*********************************

	Section MainCode,code_P

Start:
; System Save, not all, but you will see os again...
	movem.l D0-A6,-(sp)
	Move.l 4.w,A6
	Move.l 156(A6),A1
	Move.l 38(A1),Old_Copper
; System Save end

	move.l #ScreenTitle,D0
	Bsr.w Init_Screen
	Bsr.w Init_Coppers

	Move.l #Copper_1,$dff080
WaitForLOF:
	Move.w $DFF004,D0
	BMI WaitForLOF
	Move.l #0,$dff088
LoopTitle:
	Btst.b #6,$bfe001
	bne LoopTitle

	Move.l Old_Copper,$dff080
	Move.w #0,$dff088
	Movem.l (sp)+,D0-A6
	
	Rts
;-------------------------------

;------------------------------

Init_Screen:
	Lea Planes_1,A0
	Lea Planes_2,A1
	Move.w #3,D7

Init_ScreensLoop: EVEN
	Move.w D0,6(A0)
	Swap D0
	Move.w D0,2(A0)
	Swap D0
	Add.l #$50,D0
	Move.w D0,6(A1)
	Swap D0
	Move.w D0,2(A1)
	Swap D0
	Add.l #$a000-$50,D0
	Adda.l #$8,A0
	Adda.l #$8,A1
	Dbf D7,Init_ScreensLoop
	Rts

;------------------------------

Init_Coppers: EVEN
	Move.l #Copper_1,D0
	Move.w D0,Cop_1_Run+6
	Swap D0
	Move.w D0,Cop_1_Run+2
	Move.l #Copper_2,d0
	Move.w D0,Cop_2_Run+6
	Swap D0
	Move.w D0,Cop_2_Run+2
	rts
;-----------------------------

	Section Copper,data_C

Copper_1: EVEN
	DC.L $01FC0000
	DC.L $0100c004
	DC.L $008E2781,$009027C1
	DC.L $0092003c,$009400d4
;	DC.L $008E2C81,$00902CC1
;	DC.L $0092003c,$009400d4
	DC.L $00960020
	DC.L $01020000,$01040000
	DC.L $01080050,$010A0050
Planes_1:
	DC.L $00E00000,$00E20000
	DC.L $00E40000,$00E60000
	DC.L $00E80000,$00EA0000
	DC.L $00EC0000,$00EE0000
	DC.L $2C01FFFE
	DC.L $FFDFFFFE
	DC.L $2C01FFFE
Cop_2_Run:
	DC.L $00800000
	DC.L $00820000
	incbin "ram:Winter640x512x4Copper.pal"
	DC.L $FFFFFFFE
;-----------------------------

Copper_2:
Planes_2:
	DC.L $00E00000,$00E20000
	DC.L $00E40000,$00E60000
	DC.L $00E80000,$00EA0000
	DC.L $00EC0000,$00EE0000
	DC.L $2C01FFFE
	DC.L $FFDFFFFE
	DC.L $2C01FFFE

Cop_1_Run:
	DC.L $00800000
	DC.L $00820000
	DC.L $FFFFFFFE

;-----------------------------
	Section Images,data_c


ScreenTitle: EVEN
	incbin "ram:Winter640x512x4.raw"
Old_Copper:
	DC.L 0
