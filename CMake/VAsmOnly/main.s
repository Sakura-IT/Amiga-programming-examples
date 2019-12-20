	include utils/hardware/custom_registers.i

SysBase			= 4

; For production code, you should use system includes. ;)

; Exec
OpenLibrary		= -552
CloseLibrary	= -414

; DOS Library
Output			= -60
Write			= -48

; Note: the program lacks proper startup code, so it will not run from Workbench

	xref    strlen

_start:
	jsr		SystemSave
	jsr		SystemRestore

	lea		DosName,a1		; dos.library name string
	moveq	#0,d0		; Should work with any version
	movea.l	SysBase,a6
	jsr		OpenLibrary(a6)

	tst.l	d0
	beq.s	NoDos		; Failed
	move.l	d0,DosBase
	movea.l	d0,a6
	
	jsr		Output(a6)
	move.l	d0,stdout
	move.l	d0,d1

	move.l	#Hello,d2		;string to print
	move.l	d2,a0
	jsr		strlen
	move.l	d0,d3
	jsr		Write(a6)

	movea.l	a6,a1			;DOSBase, library to close
	movea.l	SysBase,a6
	jsr		CloseLibrary(a6)

NoDos:
	clr.l	d0			;return 0 to the system
	rts

; Data
	CNOP 0,4

DosBase:		dc.l 0
stdout:			dc.l 0

	CNOP 0,4
DosName:		dc.b "dos.library",0

	CNOP 0,4
Hello:			dc.b "Hello World!",10,0
