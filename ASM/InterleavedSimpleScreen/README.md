# Interleaved Simple Screen

This simple example shows 16 colors low res interleaved screen (320x256).
Interleaved screan mean that organization of lines is other then in normal screen.

So memory on our interleaved screen will look
0 line of plane 0, 0 line of plane 1, 0 line of plane 2, 0 line of plane 3
2 line of plane 0, 1 line of plane 2, 1 line of plane 2, 1 line of plane 3
...
255 line of plane 0, 255 line of plane 2, 255 line of plane 2, 255 line of plane 3

Each bitplane line will take 320/8 = 40 bytes. We have four bitplane lines and that give us
one screen line which take 160 bytes.

In this approach it is **very important to set proper screen modulo** to hide lines from other planes.
In this case we must hide: line of plane 1, line of plane 2, line of plane 3.

This example just shows only black screen.
If you want to see something more on screen, then you must set before label Loop a color
''' 
		move.w	#$fff,color+2(a5)	;set color 1 to white
''' 
and write some data to screen address
'''
		move.l	screen(a6),a0		;get screen adress
		moveq	#-1,d0
		move.l	d0,(a0)			;set 32 pixels line in top of screen
'''

The advantage of such screen I will explain on example. Lets assume that we 
copy 16x16x4 block on screen. In non interleaved screen we need four blits to copy
such tile. In interleaved screen we need only one. 

To exit just press left mouse button.
