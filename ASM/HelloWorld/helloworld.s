; Amiga programming example in assembler, using system calls.
; "Hello World" using the default output (usually console)
; Uses dos.library/PutStr() so requires kick 2.0+
; 14 processor instructions :-)
; Grzegorz Kraszewski, 2016
; Public Domain
; Description in Polish: http://krashan.ppa.pl/articles/amiga_asembler

SysBase			= 4

; Offsets of system functions in respective jumptables of library bases.
; Loading proper system includes would be more elegant.

OpenLibrary		= -552
CloseLibrary		= -414
PutStr			= -948

; Note: the program lacks proper startup code, so it will not run from Workbench

				LEA		DosName,A1		;dos.library name string
				MOVEQ	#36,D0			;minimum required version (36 = Kick 2.0)
				MOVEA.L	SysBase,A6
				JSR		OpenLibrary(A6)

				TST.L	D0				;zero if OpenLibrary() failed
				BEQ.S	NoDos			;if failed, skip to exit

				MOVE.L	#Hello,D1			;string to print
				MOVEA.L	D0,A6			;moving DOSBase to A6
				JSR		PutStr(A6)

				MOVEA.L	A6,A1			;DOSBase, library to close
				MOVEA.L	SysBase,A6
				JSR		CloseLibrary(A6)

NoDos			CLR.L	D0				;return 0 to the system
				RTS

; Data

DosName			DC.B		"dos.library",0
Hello			DC.B		"Hello World!",10,0



