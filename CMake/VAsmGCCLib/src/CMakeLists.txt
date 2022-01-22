project(VASMGCCLib)

set(TARGET ${PROJECT_NAME}) 

set(CMAKE_CXX_STANDARD 14)

find_package(AmigaGCCUtils CONFIG REQUIRED)

add_executable(${TARGET}
    main.cpp
)

target_link_libraries(${TARGET}
	asmutils
	gccutils
	AmigaUtils
	AmigaGCCUtils
)
