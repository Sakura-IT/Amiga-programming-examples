
#include <cstdio>

extern "C" uint32_t ASMStrlen(const char *str);
extern "C" uint32_t GCCStrlen(const char *str);

int main(int argc, char *argv[])
{
	int rc = 0;
	const char *str = "StringLength";
	
	uint32_t asmlen = ASMStrlen(str);
	//uint32_t asmlen = 0;
	uint32_t gcclen = GCCStrlen(str);
	
	printf("Usage: HelloWorld [Arguments] %s:%u:%u\n", str, asmlen, gcclen);

	return rc;
}
