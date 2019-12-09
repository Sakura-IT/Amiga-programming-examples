	include utils/hardware/custom_registers.i

	xdef _WaitRaster
	xdef WaitRaster

	section .text,code

_WaitRaster:
WaitRaster:
	move.l	d0,-(a7)

.loop
	move.l	VPOSR,d0
	and.l	#$1ff00,d0
	cmp.l	#303<<8,d0
	bne.b	.loop

	move.l	(a7)+,d0
	rts
