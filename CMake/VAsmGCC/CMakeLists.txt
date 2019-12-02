cmake_minimum_required(VERSION 3.10)

set(UTILSLIB_PATH "${CMAKE_SOURCE_DIR}/.." CACHE STRING "Path to lib")
set (UTILSLIB_DIR "${UTILSLIB_PATH}/utilslib") 
set (CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${UTILSLIB_DIR}/CMake") 
include(AmigaCompilerOptions) 

# **** PROJECT START ****
project(VASMGcc C ASM)

set(TARGET ${PROJECT_NAME}) 

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)  
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)

# Set compiler flags which should be kept for both C and C++.
SET(COMMON_COMPILER_FLAGS "--save-temps -O2")

add_subdirectory(asmutils)
add_subdirectory(gccutils)
add_subdirectory(src)
