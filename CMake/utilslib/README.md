# Tools libraries for Amiga

## asmutils

#### Lib: libAmigaUtils.a

The library contains only code, which has no additional dependencies. It can be used in any kind of project (ASM or C/C++).

## gccutils

#### Lib: libAmigaGCCUtils.a

This library contains tools, which require the C runtime environment and thus are not suitable for pure ASM projects. Of course it can be called from asm code as well, but there may be calls to C runtime functions involved.
