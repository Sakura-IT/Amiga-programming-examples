# This is required to fix the archiver for cross compiling.
# This workaround is a problem in CMAKE because ar is not replaced
# by the cross compiling archiver and will cause the following error
# when linking a library:
# <library>.a: error adding symbols: archive has no index; run ranlib to add one
get_filename_component(COMPILER_DIRECTORY "${CMAKE_C_COMPILER}" DIRECTORY)
set(CMAKE_AR "${COMPILER_DIRECTORY}amiga-ar")
set(CMAKE_RANLIB "${COMPILER_DIRECTORY}amiga-ranlib") 

set(UTILSLIB_OPTIONS "gcc")
set(UTILSLIB_BUILD_TYPE "")

if ("${CMAKE_BUILD_TYPE}" STREQUAL  "")
    set(CMAKE_BUILD_TYPE "Release")
endif("${CMAKE_BUILD_TYPE}" STREQUAL  "") 

# Set compiler flags which should be kept for both C and C++.
SET(COMMON_COMPILER_FLAGS "--save-temps -Wall -pedantic -mcrt=nix13")
#SET(COMMON_COMPILER_FLAGS "--save-temps -Wall -pedantic -noixemul")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMMON_COMPILER_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMMON_COMPILER_FLAGS}")

if ("${CMAKE_BUILD_TYPE}" STREQUAL  "Debug")
    message("-- Building debug version")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -g -mregparm")
endif("${CMAKE_BUILD_TYPE}" STREQUAL  "Debug") 

if("${CMAKE_BUILD_TYPE}" STREQUAL  "Release") 
    message("-- Building release version")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -mregparm")
endif("${CMAKE_BUILD_TYPE}" STREQUAL  "Release")  

set(UTILSLIB_BUILD_TYPE "${CMAKE_BUILD_TYPE}")

include(AmigaASMOptions)

include_directories(${UTILSLIB_PATH})
include_directories(${UTILSLIB_DIR})
link_directories(${UTILSLIB_PATH}/lib/${CMAKE_BUILD_TYPE}) 

message("-- Library libutils ${UTILSLIB_BUILD_TYPE} added: ${UTILSLIB_DIR}")
