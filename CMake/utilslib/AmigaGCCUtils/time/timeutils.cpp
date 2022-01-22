
#include <cstdio>

#include "utils/time/time.h"

namespace _ns = utils;

namespace utils
{
	char *clockToTimeString(clock_t timer, char *buffer, size_t bufferLen)
	{
		unsigned int ms = timer % CLOCKS_PER_SEC;
		unsigned int s = (unsigned int) ((timer / CLOCKS_PER_SEC));
		unsigned int h = s / 3600;
		unsigned int m = (s - h * 3600) / 60;
		s -= ((h * 3600) + (m * 60));

		snprintf(buffer, bufferLen, "%02u:%02u:%02u.%03u", h, m, s, ms);

		return buffer;
	}
}
