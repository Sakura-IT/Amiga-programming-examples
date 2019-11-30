# CMake examples with for Amiga 

These are examples for creating Amiga Projects using amigaos compiler from here: https://github.com/bebbo/amiga-gcc

In order to use this you have to put the tools directory into your path and execute

`. amiga-env`

The examples should run on any kickstartfrom 1.x up.

### VASMOnly

A sample project which is for pure assembly projects using VAsm. This project can not be mixed with C/C++ code, as it is a "bare-metal" project, having no crt startup code.

### VASMGcc

This project is a sample to show how to mix assembler and C/C++ objects in a single project (or by using a library).
The assembler part is built as a seperate static library in CMake and linked to your executable, so you canuse the same approach for creatig asm libraries as well.

Have fun with assembler :-).
