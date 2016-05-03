CC = gcc
CFLAGS = -nostartfiles -noixemul -O2 -D__NOLIBBASE__
OBJS = start.o main.o
EXE = Okno

all: $(OBJS)
	$(CC) $(CFLAGS) -s -o $(EXE) $^

start.o: start.c
	@Echo "Compiling $@..."
	@$(CC) $(CFLAGS) -fwritable-strings -c -o $@ $<

%.o: %.c
	@Echo "Compiling $@..."
	@$(CC) $(CFLAGS) -c -o $@ $<
