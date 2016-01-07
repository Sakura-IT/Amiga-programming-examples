# Joystick!

This is a my best attempt to read joystick direction in port 1. It uses non OS approach. To change
port of joystick, just change joy1dat into joy0dat.

Should work with most asemblers.
Usage 
```
		bsr	Joystick
		lea	left(pc),a0
		tst.b	(a0)+
		beq.b	.right

		do something for left direction

.right		tst.b	(a0)+
		beq.b	.up

		right direction
.up
		and so on...
```
