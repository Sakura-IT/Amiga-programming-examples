
project(AmigaUtils)
set(TARGET ${PROJECT_NAME}) 

enable_language(AMIGA_VASM)
include(AmigaGCCProject)

if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE "Release")
endif(NOT CMAKE_BUILD_TYPE) 

set(TARGET_LIB_DIR "${CMAKE_BINARY_DIR}/lib") 

#set(CMAKE_AMIGA_VASM_FLAGS "${CMAKE_AMIGA_VASM_FLAGS} -m68010")

set(SOURCES "")			# For C/C++ sources
set(ASM_SOURCES "")		# For assembler sources

add_subdirectory(src)

set(SOURCES ${SOURCES} ${ASM_SOURCES})

set_source_files_properties(${ASM_SOURCES} PROPERTIES LANGUAGE AMIGA_VASM)

set(LIBRARY_OUTPUT_PATH ${TARGET_LIB_DIR})
add_library(${TARGET} STATIC ${SOURCES}) 

### Installation

export(PACKAGE ${TARGET})

install(TARGETS ${TARGET} EXPORT ${TARGET} DESTINATION "lib")
install(DIRECTORY ${TARGET_MODULE_DIR} DESTINATION "${CMAKE_INSTALL_PREFIX}")
install(DIRECTORY ${CMAKE_SOURCE_DIR}/include DESTINATION "${CMAKE_INSTALL_PREFIX}")
install(EXPORT ${TARGET} DESTINATION "lib")

target_include_directories(${TARGET} PUBLIC
	$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>		# for headers when building
	$<INSTALL_INTERFACE:include>						# for client in install mode
)
