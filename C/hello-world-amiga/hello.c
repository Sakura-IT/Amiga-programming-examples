/*
 * Hello world using AmigaOS API.
 */

#include <proto/exec.h>
#include <proto/dos.h>

main(int argc, void *argv[])
{
	struct Library *SysBase;
	struct Library *DOSBase;

	SysBase = *((struct Library **)4UL);
	DOSBase = OpenLibrary("dos.library",0);

	if (DOSBase) {
		Write(Output(),"Hello world!\n",13);
		CloseLibrary(DOSBase);
	}

	return(0);
}

