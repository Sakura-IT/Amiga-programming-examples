/* Intuition example. Low level window handling. */
/* Grzegorz Kraszewski, 2016 */

#include <proto/exec.h>
#include <proto/intuition.h>
#include <proto/dos.h>

extern struct Library *DOSBase, *SysBase;
struct Library *IntuitionBase;


ULONG OpenMyWindow(void);
ULONG TheLoop(struct Window *win);

/*----------------------------------------------------------------------------*/

ULONG Main(void)
{
	ULONG result = 0;

	if (IntuitionBase = OpenLibrary("intuition.library", 39))
	{
		result = OpenMyWindow();
		CloseLibrary(IntuitionBase);
	}
	else result = RETURN_FAIL;

	return result;
}

/*----------------------------------------------------------------------------*/

ULONG OpenMyWindow(void)
{
	struct Window *win;
	ULONG result = RETURN_FAIL;

	if (win = OpenWindowTags(NULL,
		WA_InnerWidth, 400,
		WA_InnerHeight, 200,
		WA_DragBar, TRUE,
		WA_CloseGadget, TRUE,
		WA_DepthGadget, TRUE,
		WA_Title, (ULONG)"My Window",
		WA_IDCMP, IDCMP_CLOSEWINDOW,
	TAG_END))
	{
		result = TheLoop(win);
		CloseWindow(win);
	}
	else PutStr("Failed to open program window\n");

	return result;
}

/*----------------------------------------------------------------------------*/

ULONG TheLoop(struct Window *win)
{
	BOOL running = TRUE;
	struct IntuiMessage *imsg;
	ULONG signals, portmask;

	portmask = 1 << win->UserPort->mp_SigBit;

	while (running)
	{
		signals = Wait(portmask | SIGBREAKF_CTRL_C);

		if (signals & SIGBREAKF_CTRL_C) running = FALSE;

		if (signals & portmask)
		{
			while (imsg = (struct IntuiMessage*)GetMsg(win->UserPort))
			{
				if (imsg->Class == IDCMP_CLOSEWINDOW) running = FALSE;
				ReplyMsg(&imsg->ExecMessage);
			}
		}
	}

	return 0;
}
