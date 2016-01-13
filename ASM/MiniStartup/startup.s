; Amiga programming example in assembler.
; Minimal Workbench startup code.
; Grzegorz Kraszewski, 2016
; Public Domain

SysBase				= 4

; Offsets of system functions in respective jumptables of library bases.

; exec.library

OpenLibrary			= -552
CloseLibrary			= -414
FindTask			= -294
WaitPort			= -384
GetMsg				= -372
ReplyMsg			= -378
Forbid				= -132

; intuition.library

DisplayAlert			= -90

				INCLUDE	"dos/dosextens.i"

				MOVEM.L	D2/D3/A2/A6,-(SP)	;save used non-scratch registers
				CLR.L	D2			;will store WB startup msg here

				; Let's find our own process descriptor

				SUBA.L	A1,A1			;NULL here means "find my own process"
				MOVEA.L	SysBase,A6		
				JSR	FindTask(A6)

				; Check process console pointer. If 0 -> started from Workbench.

				MOVEA.L	D0,A2			;process descriptor in A2
				TST.L	pr_CLI(A2)
				BNE.S	NoWorkbench

				; Receive Workbench startup message

				LEA	pr_MsgPort(A2),A0	;process message port
				JSR	WaitPort(A6)		;first wait for message
				LEA	pr_MsgPort(A2),A0	;A0 is scratch, could be overwritten
				JSR	GetMsg(A6)		;then get message from port
				MOVE.L	D0,D2			;store it for later use

				; Let's jump to the main program now. Note that it should preserve
				; non-scratch registers.

NoWorkbench			BSR.S	Main
				MOVE.L	D0,D3			;remember return code

				; If in Workbench mode, reply the startup message now.
				
				TST.L	D2			;check if we've got the message
				BEQ.S	NoReplyNeeded
				JSR	Forbid(A6)		;disable multitasking
				MOVEA.L	D2,A1
				JSR	ReplyMsg(A6)		;reply the message

NoReplyNeeded			MOVE.L	D3,D0			;return result of Main() to the system 
				MOVEM.L	(SP)+,D2/D3/A2/A6	;restore used non-scratch registers
				RTS

;----------------------------------------------------------------------------------------
; Main program, old good Hello World, but another flavor ;-)
;----------------------------------------------------------------------------------------

Main				MOVE.L	A6,-(SP)		;save non-scratch register

				; Open intuition.library

				LEA	IntuiName(PC),A1	;intuition.library name string
				MOVEQ	#36,D0			;minimum required version (36 = Kick 2.0)
				MOVEA.L	SysBase,A6
				JSR	OpenLibrary(A6)

				TST.L	D0			;zero if OpenLibrary() failed
				BEQ.S	NoIntui			;if failed, skip to exit

				; Display some guru, as the number highest bit is 0, it is recoverable one.

				MOVEA.L	D0,A6			;moving IntuitionBase to A6
				MOVE.L	#$01234567,D0		;some funny guru number
				MOVEQ	#28,D1			;number of alert display lines
				LEA	Hello(PC),A0		;string to display
				JSR	DisplayAlert(A6)

				; Close intuition.library

				MOVEA.L	A6,A1			;IntuitionBase, library to close
				MOVEA.L	SysBase,A6
				JSR	CloseLibrary(A6)

NoIntui				CLR.L	D0			;return 0 to the system
				MOVEA.L	(SP)+,A6		;restore non-scratch register
				RTS

IntuiName			DC.B	"intuition.library",0

Hello				DC.W	16                         ;x position of the text in pixels
				DC.B	16,"Hello World!",0,0      ;y position of the text in pixels, followed by text
				
