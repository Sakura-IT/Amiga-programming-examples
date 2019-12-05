project(VASMGCCLibMain)

set(TARGET ${PROJECT_NAME}) 

set(CMAKE_CXX_STANDARD 14)

add_executable(${TARGET}
    main.cpp
)

target_link_libraries(${TARGET}
	asmutils
	gccutils
)
