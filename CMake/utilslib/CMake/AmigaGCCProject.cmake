# This is required to fix the archiver for cross compiling.
# This workaround is a problem in CMAKE because ar is not replaced
# by the cross compiling archiver and will cause the following error
# when linking a library:
# <library>.a: error adding symbols: archive has no index; run ranlib to add one

set(AMIGA_COMPILER_NAME m68k-amigaos-gcc)
set(AMIGA_AR_NAME amiga-ar)
set(AMIGA_RANLIB_NAME amiga-ranlib)

find_path(AMIGA_M68K_COMPILER_PATH NAMES "${AMIGA_COMPILER_NAME}" "${AMIGA_COMPILER_NAME}.exe" CMAKE_FIND_ROOT_PATH_BOTH)

if ("${AMIGA_M68K_COMPILER_PATH}" STREQUAL "AMIGA_M68K_COMPILER_PATH-NOTFOUND")
	message(FATAL_ERROR "'${AMIGA_COMPILER_NAME}' not found. Make sure that '${AMIGA_COMPILER_NAME}' is in PATH!")
endif ("${AMIGA_M68K_COMPILER_PATH}" STREQUAL "AMIGA_M68K_COMPILER_PATH-NOTFOUND")

set(AMIGA_M68K_COMPILER_PATH "${AMIGA_M68K_COMPILER_PATH}/")

find_path(AMIGA_AR_PATH "${AMIGA_AR_NAME}" "${AMIGA_AR_NAME}.exe" CMAKE_FIND_ROOT_PATH_BOTH)
find_path(AMIGA_RANLIB_PATH "${AMIGA_RANLIB_NAME}" "${AMIGA_RANLIB_NAME}.exe" CMAKE_FIND_ROOT_PATH_BOTH)

set(CMAKE_AR "${AMIGA_AR_PATH}/${AMIGA_AR_NAME}")
set(CMAKE_RANLIB "${AMIGA_RANLIB_PATH}/${AMIGA_RANLIB_NAME}") 

set(UTILSLIB_OPTIONS "gcc")
set(UTILSLIB_BUILD_TYPE "")

if ("${CMAKE_BUILD_TYPE}" STREQUAL "")
    set(CMAKE_BUILD_TYPE "Release")
endif("${CMAKE_BUILD_TYPE}" STREQUAL "") 

# Set compiler flags which should be kept for both C and C++.
SET(COMMON_COMPILER_FLAGS "--save-temps -Wall -pedantic -mcrt=nix13 -fno-exceptions -fno-rtti")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMMON_COMPILER_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMMON_COMPILER_FLAGS}")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O1 -g -mregparm")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -mregparm")
