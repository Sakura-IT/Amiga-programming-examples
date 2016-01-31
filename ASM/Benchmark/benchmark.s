; Amiga programming example in assembler.
; Minimal Workbench startup code.
; Grzegorz Kraszewski, 2016
; Public Domain

;-------------------------------------------------------------------------------
; Offsets of system functions in respective jumptables of library bases.
;-------------------------------------------------------------------------------

; exec.library

Forbid				= -132
Permit				= -138
FindTask			= -294
GetMsg				= -372
ReplyMsg			= -378
WaitPort			= -384
CloseLibrary			= -414
OpenDevice			= -444
CloseDevice			= -450
OpenLibrary			= -552
CreateIORequest			= -654
DeleteIORequest			= -660
CreateMsgPort			= -666
DeleteMsgPort			= -672

; dos.library

VPrintf				= -954

; timer.device

SubTime				= -48
GetSysTime			= -66

;-------------------------------------------------------------------------------
; Offsets of global data area. This area is referenced using A4 register as
; a base throughout the code.
;-------------------------------------------------------------------------------
	
SysBase				= 0
DosBase				= 4
TimerPort			= 8
TimerRequest			= 12
TimerBase			= 16
GlobalsSize			= 20

;-------------------------------------------------------------------------------
; Code start.
;-------------------------------------------------------------------------------

				CODE

				INCLUDE	"dos/dosextens.i"
				INCLUDE	"devices/timer.i"

				MOVEM.L	D2/D3/A2/A4/A6,-(SP)
				LEA	Globals,A4
				MOVEA.L	4,A6
				MOVEQ	#0,D2
				MOVE.L	A6,SysBase(A4)

				; Let's find our own process descriptor

				SUBA.L	A1,A1
				JSR	FindTask(A6)

				; Check process console pointer. If 0 -> started from
				; Workbench.

				MOVEA.L	D0,A2
				TST.L	pr_CLI(A2)
				BNE.S	NoWorkbench

				; Receive Workbench startup message. Wait first, then pick
				; up.

				LEA	pr_MsgPort(A2),A0
				JSR	WaitPort(A6)
				LEA	pr_MsgPort(A2),A0
				JSR	GetMsg(A6)
				MOVE.L	D0,D2

				; Let's jump to the main program now. Note that it should
				; preserve non-scratch registers.

NoWorkbench			BSR.W	Main
				MOVE.L	D0,D3

				; If in Workbench mode, reply the startup message now.
				
				TST.L	D2
				BEQ.S	NoReplyNeeded
				JSR	Forbid(A6)
				MOVEA.L	D2,A1
				JSR	ReplyMsg(A6)

NoReplyNeeded			MOVE.L	D3,D0 
				MOVEM.L	(SP)+,D2/D3/A2/A4/A6
				RTS

;-------------------------------------------------------------------------------
; Main() opens dos.library and calls further code. On return frees dos.library.
; A2: DosBase
; A6: SysBase
;-------------------------------------------------------------------------------

Main				MOVEM.L	A2/A6,-(SP)

				; Open dos.library
				
				LEA	DosName,A1
				MOVEQ	#36,D0
				MOVEA.L	SysBase(A4),A6
				JSR	OpenLibrary(A6)

				MOVE.L	D0,DosBase(A4)
				MOVEA.L	D0,A2
				BEQ.S	NoDos

				BSR.S	GetTimerPort

				; Close dos.library

				MOVEA.L	A2,A1
				JSR	CloseLibrary(A6)

NoDos				MOVEQ	#0,D0
				MOVEM.L	(SP)+,A2/A6
				RTS

;-------------------------------------------------------------------------------
; GetTimerPort() creates timer.device port, calls further code then disposes
; the port. Assumption: SysBase in A6.
;-------------------------------------------------------------------------------

GetTimerPort			MOVEA.L	SysBase(A4),A6
				JSR	CreateMsgPort(A6)

				MOVE.L	D0,TimerPort(A4)
				BEQ.S	NoTimerPort
				BSR.S	GetTimerRequest

				MOVEA.L	TimerPort(A4),A0
				JSR	DeleteMsgPort(A6)
				
NoTimerPort			RTS

;-------------------------------------------------------------------------------
; GetTimerRequest() allocates IORequest for timer, calls further code, then
; disposes the request. Assumptions: SysBase in A6, TimerPort in D0.
;-------------------------------------------------------------------------------

GetTimerRequest			MOVEA.L	D0,A0
				MOVEQ	#IOTV_SIZE,D0
				JSR	CreateIORequest(A6)

				MOVE.L	D0,TimerRequest(A4)
				BEQ.S	NoTimerRequest
				BSR.S	OpenTimerDevice

				MOVEA.L	TimerRequest(A4),A0
				JSR	DeleteIORequest(A6)
				
NoTimerRequest			RTS

;-------------------------------------------------------------------------------
; OpenTimerDevice() opens the device, extracts its library base and calls
; further code. Then closes the device. Assumptions: SysBase in A6, TimerRequest
; in D0. A2 is used to store TimerRequest
;-------------------------------------------------------------------------------

OpenTimerDevice			MOVE.L	A2,-(SP)
				MOVEA.L	D0,A1
				MOVEQ	#UNIT_MICROHZ,D0
				LEA	TimerName,A0
				MOVEQ	#0,D1
				MOVEA.L	A1,A2
				JSR	OpenDevice(A6)
				BNE.S	DeviceFailed

				MOVE.L	IO_DEVICE(A2),TimerBase(a4)
				BSR.S	MeasureTime

				MOVEA.L	A2,A1
				JSR	CloseDevice(A6)

DeviceFailed			MOVEA.L	(SP)+,A2
				RTS		

;-------------------------------------------------------------------------------
; MeasureTime() gets system time, calls benchmarked code with multitasking
; stopped, gets system time again calculates the difference and prints it.
;-------------------------------------------------------------------------------

StartSeconds			DC.L	0
StartMicros			DC.L	0
EndSeconds			DC.L	0
EndMicros			DC.L	0

MeasureTime			MOVE.L	A6,-(SP)
				LEA	StartSeconds(PC),A0
				MOVEA.L	TimerBase(A4),A6
				JSR	GetSysTime(A6)

				MOVEA.L	SysBase(A4),A6
				JSR	Forbid(A6)
				JSR	BenchmarkedCode
				JSR	Permit(A6)

				MOVEA.L	TimerBase(A4),A6
				LEA	EndSeconds(PC),A0
				JSR	GetSysTime(A6)

				LEA	EndSeconds(PC),A0
				LEA	StartSeconds(PC),A1
				JSR	SubTime(A6)

				BSR.S	PrintDiff

				MOVEA.L	(SP)+,A6
				RTS

;-------------------------------------------------------------------------------
; PrintDiff() prints time amount stored in EndSeconds and EndMicros.
;-------------------------------------------------------------------------------

PrintDiff			MOVEM.L	D2/A6,-(SP)

				MOVE.L	#PFmt,D1
				MOVE.L	#EndSeconds,D2
				MOVEA.L	DosBase(A4),A6
				JSR	VPrintf(A6)

				MOVEM.L	(SP)+,D2/A6
				RTS		



BenchmarkedCode			MOVE.W	#9999,D0
Loop				DBF	D0,Loop
				RTS



				DATA

DosName				DC.B	"dos.library",0
TimerName			DC.B	"timer.device",0
				ALIGN	4

Hello				DC.B	"Hello World!",0
				ALIGN	4

PFmt				DC.B	"Time: %ld.%06ld seconds.",10,0

;-------------------------------------------------------------------------------
; Global data section.
;-------------------------------------------------------------------------------

				BSS

Globals				DS.B	GlobalsSize
