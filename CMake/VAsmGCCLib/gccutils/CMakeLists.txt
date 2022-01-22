project(gccutils)

set(TARGET ${PROJECT_NAME}) 

set(CMAKE_CXX_STANDARD 14)

set(SOURCES
    strlen.cpp
)

add_library(${TARGET} STATIC ${SOURCES}) 
