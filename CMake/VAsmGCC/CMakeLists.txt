cmake_minimum_required(VERSION 3.0) 
project(VASMGcc)
set(TARGET ${PROJECT_NAME}) 

find_package(AmigaUtils CONFIG REQUIRED)
find_package(AmigaGCCUtils CONFIG REQUIRED)
include(AmigaGCCProject)

enable_language(AMIGA_VASM)

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O1")

set(ASM_SOURCES
	strlen.asm
)

set(SOURCES
	main.cpp
	strlen.cpp
	${ASM_SOURCES}
)

set_source_files_properties(${ASM_SOURCES} PROPERTIES LANGUAGE AMIGA_VASM)

add_executable(${TARGET} ${SOURCES}) 
target_link_libraries(${TARGET} AmigaUtils AmigaGCCUtils)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)  
