# MiniStartup

This example shows what has to be done at program startup, to have it working when started from Workbench (by clicking program icon). It is minimal startup, it only handles Workbench message.

### Key points

* To detect if a program was started from console or from Workbench, one tests *pr_CLI* field of the process structure. If it is NULL, program has been started from icon.
* Workbench sends a message to message port located in the process structure. The process should receive this message at startup and reply it at exit.
* Replying the message should be done with task switching disabled. When process ends, switching is automatically restored and Workbench picks up the reply. Then it removes the process and frees its code. Replying the message after *Forbid()* eliminates possible race condition and freeing code of still running process.

### Notes

* Unlike "HelloWorld", this example displays system alert instead of sending a string to console. The reason is simple, when program is started from Workbench, it has no console, so text would be printed nowhere.
* An icon for the program may be created with IconEdit, or by copying icon of another program and changing its name to match the name of executable (for example if executable is named "startup", icon should be named "startup.info").
