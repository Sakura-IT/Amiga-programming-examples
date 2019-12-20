; #####################################################
; Return the length of a C-String (0-terminated)
;
; INPUT:  A0: Address of string
; RETURN: D0: Length of string
;
; TRASHED: D0, A0
;
; #####################################################

	include GCCLib.i

_ASMStrlen:
strlen:
	moveq.l #0,d0
    move.l  a0,d0

.loop
	tst.b   (a0)+
	bne     .loop

    sub.l   a0,d0
    neg.l   d0
    subq.l  #1,d0

    rts
