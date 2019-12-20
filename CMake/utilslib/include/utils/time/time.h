#ifndef _UTILSLIB_TIME_H
#define _UTILSLIB_TIME_H

#include <cstddef>
#include <time.h> 

namespace utils
{
	char *clockToTimeString(clock_t timer, char *buffer, size_t bufferLen);
}

#endif // _UTILSLIB_TIME_H
