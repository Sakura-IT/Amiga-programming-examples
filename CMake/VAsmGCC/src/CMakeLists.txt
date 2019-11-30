cmake_minimum_required(VERSION 3.14)
project(HelloWorld)

set(TARGET ${PROJECT_NAME}) 

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMMON_COMPILER_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMMON_COMPILER_FLAGS}")

add_executable(${TARGET}
    HelloWorld.cpp
)

target_link_libraries(${TARGET}
	asmutils
	gccutils
)
