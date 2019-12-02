project(asmutils ASM)

set(TARGET ${PROJECT_NAME}) 

set(SOURCES
	strlen.s
)

# Build as library
add_library(${TARGET} STATIC ${SOURCES}) 
