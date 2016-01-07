	INCLUDE	hardware/custom.i

;
;in a5 _custom
;

Joystick:
		lea	left(pc),a0
		move.w	joy1dat(a5),d1
		move.w	d1,d0
		add.w	d1,d1
		eor.w	d0,d1
		and.w	#514,d0
		and.w	#514,d1
		move.w	d0,(a0)+
		move.w	d1,(a0)
		rts

left:		dc.b	0
right:		dc.b	0
up:		dc.b	0
down:		dc.b	0

;Usage
;		lea	left(pc),a0
;		tst.b	(a0)+
;		beq.b	.right
;
;		do something for left direction
;
;.right		tst.b	(a0)+
;		beq.b	.up
;
;		;right direction
;.up
;		;and so on...
;
