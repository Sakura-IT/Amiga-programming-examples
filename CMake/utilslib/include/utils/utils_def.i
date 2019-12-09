	IFND _UTILS_DEF_I
_UTILS_DEF_I SET 1

; CALL_LIB for calling functions with A6 is already loaded

CALL_LIB	MACRO   ; functionOffset
	IFGT NARG-1
		FAIL [ERR] CALL_LIB MACRO - too many arguments !!!
	ENDC
	JSR     \1(A6)

    ENDM

CALLLIB	MACRO   ; functionOffset
	IFGT NARG-1
		FAIL [ERR] CALLLIB MACRO - too many arguments !!!
	ENDC
	CALL_LIB	_LVO\1

    ENDM

JMP_LIB	MACRO   ; functionOffset
	IFGT NARG-1
		FAIL [ERR] JMP_LIB MACRO - too many arguments !!!
	ENDC
	JMP     \1(A6)

    ENDM

JMPLIB	MACRO   ; functionOffset
	IFGT NARG-1
		FAIL [ERR] JMPLIB MACRO - too many arguments !!!
	ENDC
	JMP_LIB     _LVO\1

    ENDM

	ENDIF
