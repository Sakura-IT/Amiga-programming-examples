project(asmutils)

enable_language(VASM)

set(TARGET ${PROJECT_NAME}) 

set(SOURCES
	strlen.s
)

set_source_files_properties(${SOURCES} PROPERTIES LANGUAGE VASM)

# Build as library
add_library(${TARGET} STATIC ${SOURCES}) 
