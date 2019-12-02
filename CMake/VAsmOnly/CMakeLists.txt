cmake_minimum_required(VERSION 3.10)

set(UTILSLIB_PATH "${CMAKE_SOURCE_DIR}/..")
set(UTILSLIB_DIR "${UTILSLIB_PATH}/utilslib")

set (CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${UTILSLIB_DIR}/CMake")
include(AmigaASMOptions) 

# **** PROJECT START ****
project(VASMOnly ASM)

set(TARGET ${PROJECT_NAME}) 

set(SOURCES
    test.s
	strlen.s
)

# Build as library
#add_library(${TARGET} STATIC ${SOURCES}) 

# Build as executable
add_executable(${TARGET} ${SOURCES})

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)  
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib) 
