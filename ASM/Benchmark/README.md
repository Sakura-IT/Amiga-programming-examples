# Benchmark

Uses _timer.device_ to measure execution time of some code and prints the time. It also illustrates the following:
* Using sections (code, data, bss).
* Accessing global data via base register.
* Using _VPrintf()_ from assembler.
* Strategy of resource allocation in assembler programs.

### timer.device

This system device provides access to Amiga hardware timers. Devices in Amiga use message based API, device messages are named IORequests. However a device is a special case of system library. Then it can also have simple library API, made of functions. This example uses only library interface of _timer.device_.

Opening a device is more complicated process than opening a library. To open a device one has to prepare valid IORequest message with valid message port to recieive possible responses of device commands issued. Then one can extract library base of a device from IORequest. So there are 4 steps:
* creation of MessagePort with _CreateMsgPort()_.
* creation of IORequest with _CreateIORequest()_ using this MessagePort.
* opening of the device with _OpenDevice()_.
* getting library base. Created IORequest after calling _OpenDevice()_contains pointer to Device structure, which is just extended Library structure. Address of it is the library base.

### Getting system time

Timer device provides _GetSysTime()_ function, which returns current time as set of two 32-bit words. The first one contains seconds, the second one contains microseconds. On Amigas equipped with RTC clock it is the real world time measured from the start of Amiga epoch (01-Jan-1978). When no RTC is available, time counts from 0. Anyway for measuring periods of time it does not matter.

### Time arithmetic

The example uses _SubTime()_ which subtracts two times stored as two 32-bit words. It takes care of carry between seconds and microseconds fields.

### Program sections

Bigger programs are usually divided into sections. Amiga uses 3 basic types:
* CODE contains executable code, it may however also coinatn data.
* DATA is a section designed to store program data like strings and tables.
* BSS is a section for data which are dynamically created by the program. Only size of this data is stored in the executable.
Any of these can be also forced to be loaded into chip memory (which may be useful for graphics or audio data contained in the executable).

### Accessing globals

Any program usually has some global variables, accessed throughout the code. Typical example are library bases. The simplest way to access them is just to use absolute adressing mode. This has two disadvantages: absolute addressing mode makes instructions longer and thus slower, also, as Amiga uses dynamic memory management, each absolute mode adds relocation to the executable making it even more bigger.

A solution may be addressing relative to program counter (PC). This however forces global data to be located in code section, and more importantly PC relative addressing cannot be used as destination.

Because of this most programmers (and also language compilers) access global data via dedicated address register, which is initialized once at program start. Which one to use? A0 and A1 are scratch, A7 is the stack pointer, A6 is used for library calls. Compilers usually use A5 as link to local stack frames, so A4 is typically used for global data.

### VPrintf()

The function works the same as C function _printf()_, however variable arguments are passed as an array of values, parsed according to placeholders specified in the format string. _VPrintf()_ assumes 16-bit integers when parsing the array. If 32-bit ones are used, placeholder should be prefixed by "l". It also applies to "%c" placeholder.

### Resource allocation

Any assembler program using the operating system has to allocate some resources before doing its job. These resources have to be obtained in specific order and freed in reverse order. Program also should gracefully exit if allocation of some resource fails. To make it easier I use a specific code writing strategy for resource allocation. Resource allocation section is written as a chain of subroutines. Each subroutine deals with one resource and contains both obtain and release code:
1. Try to obtain the resource.
2. Test for success.
3. If resource failed, skip to 5.
4. Call further program code as a subroutine.
5. Free the resource.
With this approach code for obtaining and releasing a resource is located in a single small fragment of code and usually written at the same time. Then resource leaks are avoided, also programs are stable and exit cleanly even if some resource is unobtainable. Adding error reporting and debugging the code are also easier.

