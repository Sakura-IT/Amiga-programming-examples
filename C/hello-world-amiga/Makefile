CC=vc
LDFLAGS=-nostdlib

HELLO_EXE=hello
HELLO_OBJS=hello.o

all: $(HELLO_EXE)

$(HELLO_EXE) : $(HELLO_OBJS) 
	$(CC) $(LDFLAGS) -nostdlib -o $(HELLO_EXE) $(HELLO_OBJS)

%.o : %.c
	$(CC) -c -o $@ $<

