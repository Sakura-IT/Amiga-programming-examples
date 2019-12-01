cmake_minimum_required(VERSION 3.14)

set(VASM_PATH "/opt/amiga/bin/")
set(VLINK_PATH "/opt/amiga/bin/")

set(CMAKE_ASM_COMPILER "${VASM_PATH}vasmm68k_mot")
set(CMAKE_ASM_FLAGS "-esc -kick1hunks -Fhunk -chklabels -nocase -quiet")
set(CMAKE_ASM_FLAGS_DEBUG "${CMAKE_ASM_FLAGS} -dwarf")
set(CMAKE_ASM_FLAGS_RELEASE "${CMAKE_ASM_FLAGS} -nosym")

if ("${UTILSLIB_OPTIONS}" STREQUAL "")
    set(UTILSLIB_OPTIONS "asm")
endif("${UTILSLIB_OPTIONS}" STREQUAL  "") 

if ("${CMAKE_BUILD_TYPE}" STREQUAL  "")
    set(CMAKE_BUILD_TYPE "Release")
endif("${CMAKE_BUILD_TYPE}" STREQUAL  "") 

if ("${CMAKE_BUILD_TYPE}" STREQUAL  "Debug")
    message("-- ASM debug version")
	set(CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> ${CMAKE_ASM_FLAGS_DEBUG} -o <OBJECT> <SOURCE>")
endif("${CMAKE_BUILD_TYPE}" STREQUAL  "Debug") 

if("${CMAKE_BUILD_TYPE}" STREQUAL  "Release") 
    message("-- ASM release version")
	set(CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> ${CMAKE_ASM_FLAGS_RELEASE} -o <OBJECT> <SOURCE>")
endif("${CMAKE_BUILD_TYPE}" STREQUAL  "Release")  

if ("${UTILSLIB_OPTIONS}" STREQUAL "asm")
	set(CMAKE_LINKER "${VASM_PATH}vlink")
	set(CMAKE_EXE_LINKER_FLAGS "-b amigahunk -Bstatic -nostdlib")
	set(CMAKE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS}")
	set(CMAKE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS} -S -s")
	set(CMAKE_ASM_LINK_EXECUTABLE "${CMAKE_LINKER} ${CMAKE_EXE_LINKER_FLAGS} <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

	if ("${CMAKE_BUILD_TYPE}" STREQUAL  "Debug")
		set(CMAKE_ASM_LINK_EXECUTABLE "${CMAKE_LINKER} ${CMAKE_EXE_LINKER_FLAGS_DEBUG} <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
	else()
		set(CMAKE_ASM_LINK_EXECUTABLE "${CMAKE_LINKER} ${CMAKE_EXE_LINKER_FLAGS_RELEASE} <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
	endif("${CMAKE_BUILD_TYPE}" STREQUAL  "Debug") 

endif("${UTILSLIB_OPTIONS}" STREQUAL "asm") 

message("-- Library asmutils ${CMAKE_BUILD_TYPE} added: ${UTILSLIB_DIR}")
