
#include <cstdio>

extern "C" uint32_t GCCStrlen(const char *s)
{
	const char *p = s;

	for(;;)
	{
		if (!*p)
			break;
		p++;
	}

	return p-s;
}
