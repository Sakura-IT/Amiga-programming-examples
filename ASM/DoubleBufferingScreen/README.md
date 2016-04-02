# Double Buffering Screen

This example shows double buffering screens. Screen type is interleaved. 
There are two screens: working and temporary. First one is actual screen which user see.
On second one some work with screen should be done, like copying blocks, etc.
During verticall blank swapping with temoporary screen is done. Usually such
screen swaping is done by routine which doing two things. swap screen pointers
and write screen adress into copperlist. In this approach screen swapping is done via copper,
mean we have two copperlists. First one set second one and second one set first, in other
words copper doing this job instead of processor. 

To swap screen pointers a ScreenSwapPointers is called every frame

On screen you should see a blinking two tiny lines.

To exit just press left mouse button.
