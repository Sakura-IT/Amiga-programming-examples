# HelloWorld

Example of using Amiga OS functions from assembler. The whole example consists
of 14 processor instructions and compiles to 128 bytes of executable.

### Key points

* Amiga API is grouped into libraries, basic set of them resides in Kickstart ROM.
* Each library has a base (a structure), which contains a jump table to library functions.
* To call a library function, load arguments to registers, load library base address to A6, then do JSR jump relative to A6 with function offset in the jumptable. Offsets are always negative and usually start at -30.
* To use a library one calls OpenLibrary() from _exec.library_. This call returns a library base.
* As _exec.library_ is used to open other libraries, it is always open. Its base address is stored at fixed location $00000004.
* Any library (except _exec.library_) has to be closed after use with CloseLibrary().

### Notes

* "Hello World" can be made even shorter than 128 bytes, but I have preferred code readability over optimization.
* The program has no proper startup code for Workbench. It works from CLI window, but when one adds icon to it and runs from Workbench, it will crash.
* _dos.library_/PutStr() call appeared in version 36 (Kickstart 2.0). This example won't work with Kickstart 1.3 in stock Amiga 500.

Have fun with assembler :-).