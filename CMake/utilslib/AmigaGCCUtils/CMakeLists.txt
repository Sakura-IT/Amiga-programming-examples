cmake_minimum_required(VERSION 3.0)
project(AmigaGCCUtils)

set(TARGET ${PROJECT_NAME}) 

enable_language(AMIGA_VASM)
include(AmigaGCCProject)

set(CMAKE_CXX_STANDARD 14)

set(TARGET_LIB_DIR "${CMAKE_BINARY_DIR}/lib") 

set(SOURCES
)

include_directories(${CMAKE_SOURCE_DIR}/include)

add_subdirectory(time)

add_library(${TARGET} ${SOURCES})

set(LIBRARY_OUTPUT_PATH ${TARGET_LIB_DIR}) 

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
