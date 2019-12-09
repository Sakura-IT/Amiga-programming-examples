
#include <cstdio>

#include <proto/exec.h>
#include <utils/system/system.h>
#include <utils/hardware/custom_registers.h>
#include <utils/time/time.h>

extern "C" uint32_t ASMStrlen(const char *str);
extern "C" uint32_t GCCStrlen(const char *str);

int main(int argc, char *argv[])
{
	clock_t elapsed = clock();

	SystemSave();
	// just an example but printf may not work if the system is taken over.
	SystemRestore();

	int rc = 0;
	const char *str = "StringLength";
	
	uint32_t asmlen = ASMStrlen(str);
	uint32_t gcclen = GCCStrlen(str);
	
	printf("Usage: HelloWorld [Arguments] %s:%u:%u\n", str, asmlen, gcclen);

	elapsed = clock() - elapsed;

	char buffer[50];
	printf("Elapsed: %s\n", utils::clockToTimeString(elapsed, buffer, sizeof(buffer)));

	return rc;
}
