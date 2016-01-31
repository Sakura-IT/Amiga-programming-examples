CC=vc

PRIME_EXE=prime-numbers
PRIME_OBJS=prime-numbers.o

all: $(PRIME_EXE)

$(PRIME_EXE) : $(PRIME_OBJS) 
	$(CC) $(LDFLAGS) -o $(PRIME_EXE) $(PRIME_OBJS)

%.o : %.c
	$(CC) -c -o $@ $<

