cmake_minimum_required(VERSION 3.0)

project(AmigaToolLibraries)

set(TARGET_MODULE_DIR "${CMAKE_SOURCE_DIR}/CMake")
set (CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${TARGET_MODULE_DIR}") 

if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE "Release")
endif(NOT CMAKE_BUILD_TYPE) 

add_subdirectory(AmigaUtils)
add_subdirectory(AmigaGCCUtils)
