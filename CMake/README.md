# CMake examples with for Amiga 

These are examples for creating Amiga Projects using amigaos compiler from here: https://github.com/bebbo/amiga-gcc

In order to use this you have to put the tools directory into your path and execute

`. amiga-env`

The examples should run on any kickstartfrom 1.x up.

### Installation

The default path for the toolchain is expected to be `/opt/amiga/`. If you have setup your toolchain in a different path, you may take a look into the tools directory and adjust the paths in `amiga-env` accordingly.

```
git clone https://github.com/skeetor/Amiga-programming-examples
export PATH=<MYPATH>/Amiga-programming-examples/CMake/tools:$PATH
. amiga-env
cd Amiga-programming-examples/CMake/utilslib
cmake . -B build-release
cd build-release
make && make install
```

This part of the project will be moved to https://github.com/skeetor/amiga-utils and maintained there as this serves only as an example.

Now you can build the example projects below.

### VASMOnly

A sample project which is for pure assembly projects using VAsm. This project can not be mixed with C/C++ code, as it is a "bare-metal" project, having no crt startup code.

### VASMGcc

This project is a sample to show how to mix assembler and C/C++ objects in a single project (or by using a library).
The assembler part is built as a seperate static library in CMake and linked to your executable, so you canuse the same approach for creatig asm libraries as well.

### VASMGccLib

This project shows an example where you create a library with ASM modules and link them to your main executable.


The above examples should cover all common project szenarios.

Have fun with assembler :-).


### Example

```
cd Amiga-programming-examples/CMake/VasmGCC
cmake . -B build-release
cd build-release
make
```

Help: -D CMAKE_FIND_DEBUG_MODE=ON
