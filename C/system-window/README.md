# System Window

Opens an empty system window on the Workbench screen. Then waits for closing the window with the close gadget. It also illustrates the following:
* Minimal startup code instead of the standard one.
* Usage of tag based API functions.
* Simple makefile of the project for GNU Make.
The project has been compiled with Amiga native GCC 2.95.3. Note that the program requires Kickstart 3.0+, it will exit on older kickstart. System version check is implemented by requiring _dos.library_ v39+ in the startup code.

### Opening a window

### Handling CTRL-C signal

### Handling window messages

### Startup code

### Makefile