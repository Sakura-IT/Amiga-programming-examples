
set(ASM_DIALECT "AMIGA_VASM")

set(AMIGA_ASSEMBLER_NAME vasmm68k_mot)
set(AMIGA_LINKER_NAME vlink)

find_path(AMIGA_M68K_ASSEMBLER_PATH NAMES "${AMIGA_ASSEMBLER_NAME}" "${AMIGA_ASSEMBLER_NAME}.exe" CMAKE_FIND_ROOT_PATH_BOTH)

# Remove the <path>/bin part
get_filename_component(AMIGA_PATH_PREFIX ${AMIGA_M68K_ASSEMBLER_PATH} DIRECTORY)

set(CMAKE_${ASM_DIALECT}_PREFIX "${AMIGA_PATH_PREFIX}/utils" CACHE INTERNAL "Installation path next to compiler")

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
	set(CMAKE_INSTALL_PREFIX "${CMAKE_AMIGA_VASM_PREFIX}" CACHE PATH "Amiga default prefix" FORCE)
endif(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

set(AMIGA_M68K_ASSEMBLER_PATH "${AMIGA_M68K_ASSEMBLER_PATH}/")

find_path(AMIGA_M68K_LINKER_PATH NAMES "${AMIGA_LINKER_NAME}" "${AMIGA_LINKER_NAME}.exe" CMAKE_FIND_ROOT_PATH_BOTH)
set(AMIGA_M68K_LINKER_PATH "${AMIGA_M68K_LINKER_PATH}/")

find_program(
    CMAKE_${ASM_DIALECT}_COMPILER 
        NAMES "${AMIGA_ASSEMBLER_NAME}" 
        HINTS "${AMIGA_M68K_ASSEMBLER_PATH}"
        DOC "VASM Amiga OS 1.x" 
)
mark_as_advanced(CMAKE_${ASM_DIALECT}_COMPILER)

find_program(
    CMAKE_${ASM_DIALECT}_LINKER 
        NAMES "${AMIGA_LINKER_NAME}" 
        HINTS "${AMIGA_M68K_LINKER_PATH}"
        DOC "VLink Amiga OS 1.x" 
)
mark_as_advanced(CMAKE_${ASM_DIALECT}_LINKER)

set(CMD "${CMAKE_${ASM_DIALECT}_COMPILER}")

execute_process(COMMAND "${CMD}" ERROR_QUIET OUTPUT_VARIABLE CMD_OUT)

string(REPLACE "\r" "" CMD_OUT ${CMD_OUT})
string(REPLACE "\n" ";" CMD_OUT ${CMD_OUT})
set(CMD_LIST ${CMD_OUT})
list(GET CMD_LIST 1 COMPILER_VERSION)
message(STATUS "VASM identification is: ${COMPILER_VERSION}")

set(CMAKE_${ASM_DIALECT}_SOURCE_FILE_EXTENSIONS vasm;VASM;asm;ASM;s;S)
set(CMAKE_${ASM_DIALECT}_COMPILER_ENV_VAR "VASM")
set(CMAKE_${ASM_DIALECT}_OUTPUT_EXTENSION .o)

# Configure variables set in this file for fast reload later on
configure_file(${CMAKE_CURRENT_LIST_DIR}/CMake${ASM_DIALECT}Compiler.cmake.in
               ${CMAKE_PLATFORM_INFO_DIR}/CMake${ASM_DIALECT}Compiler.cmake)

include_directories(${AMIGA_PATH_PREFIX}/m68k-amigaos/ndk-include) 

set(ASM_DIALECT)
