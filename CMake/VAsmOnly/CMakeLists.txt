cmake_minimum_required(VERSION 3.14)

set(UTILSLIB_PATH "${CMAKE_SOURCE_DIR}/..")
set(UTILSLIB_DIR "${UTILSLIB_PATH}/utilslib")
set (CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${UTILSLIB_DIR}/CMake")

# **** PROJECT START ****
project(VASMOnly)

enable_language(VASM) 

set(TARGET ${PROJECT_NAME}) 

set(SOURCES
    test.s
	strlen.s
)

set_source_files_properties(${SOURCES} PROPERTIES LANGUAGE VASM)

# Build as library
#set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)
#add_library(${TARGET} STATIC ${SOURCES}) 

# Build as executable
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
add_executable(${TARGET} ${SOURCES})
