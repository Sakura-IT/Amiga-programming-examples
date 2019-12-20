cmake_minimum_required(VERSION 3.0)
project(VASMOnly)
set(TARGET ${PROJECT_NAME}) 

find_package(AmigaUtils CONFIG REQUIRED)
enable_language(AMIGA_VASM)

include_directories(${CMAKE_SOURCE_DIR}/include)

set(SOURCES
    main.s
	strlen.s
)

set_source_files_properties(${SOURCES} PROPERTIES LANGUAGE AMIGA_VASM)

# Build as library
#set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)
#add_library(${TARGET} STATIC ${SOURCES}) 

# Build as executable
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
add_executable(${TARGET} ${SOURCES})
target_link_libraries(${TARGET} AmigaUtils)
