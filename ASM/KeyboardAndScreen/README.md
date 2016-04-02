# Keyboard And Screen

This simple example shows how keyboard should be handled. 
It is just interleaved screen and keyboard PORTS. 

To test key ESC following simple code is used

```
		tst.b	keys+KEYCODE_ESC(a6)
		bne.b	Quit

```


