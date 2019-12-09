; A small loop which flashes the power led 10 times
; which can be used as a debug indicator in situations where 
; normal debugging doesn't work
;

	section .text,code

_PowerLEDOff::
PowerLEDOff::
	bset #1,$BFE001 
	rts
	
_PowerLEDOn::
PowerLEDOn::
	bclr #1,$BFE001 
	rts

_DebugPowerLED::
DebugPowerLED::
	movem.l	d0-d1,-(a7)
	jsr PowerLEDOn

	move #10,d1

.loop:
	move #50000, d0

.delay:
	subq #1,d0
	bne .delay

	btst #0,d1
	beq .off
	jsr PowerLEDOn

.cont:
	subq #1,d1
	bne .loop

	jsr PowerLEDOn
	movem.l	(a7)+,d0-d1
	rts

.off:
	jsr PowerLEDOff
	bra .cont
