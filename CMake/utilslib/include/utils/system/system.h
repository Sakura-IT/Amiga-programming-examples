#ifndef _UTILSLIB_SYSTEM_H
#define _UTILSLIB_SYSTEM_H

#include "utils/utils_def.h"

/**
 * Save the system state, so that the OS can be taken over.
 * This method may not be called multiple times as UB might happen.
 * Note, that OS library methods may no longer work properly.
 */
C_FUNCTION void SystemSave(void);

/**
 * Restores the OS back to it's previously saved state.
 * Calling this, without calling SystemSave first, will most
 * certainly crash the system.
 */
C_FUNCTION void SystemRestore(void);

/**
 * Sets the new Vertical Blank Interrupt handler. This should be called
 * before SystemSave has been used. The previous handler is returned
 * and may be called from the client caller.
 * Calling this, while the VBI is currently processed, may result in UB.
 */
C_FUNCTION void *SetVBI(void *newVBIPtr);

/**
 * Clear the current Vertical Blank Interrupt handler. This will not disable
 * the interrupt, only a stub which returns early is executed.
 * The current handler is returned.
 * Calling this, while the VBI is currently processed, may result in UB.
 */
C_FUNCTION void *ClearVBI(void);

#endif // _UTILSLIB_SYSTEM_H
