CC      = arm-linux-gnueabi-gcc
AS      = arm-linux-gnueabi-as
LD      = arm-linux-gnueabi-ld
QEMU    = qemu-arm
CFLAGS  = -static -marm

TARGETS = factorial fibonacci array_sum

all: $(TARGETS)

factorial: factorial.s
	$(AS) -o factorial.o factorial.s
	$(CC) $(CFLAGS) -o factorial factorial.o -nostartfiles

fibonacci: fibonacci.s test_fibonacci.c
	$(CC) $(CFLAGS) -o fibonacci fibonacci.s test_fibonacci.c

array_sum: array_sum.s test_array_sum.c
	$(CC) $(CFLAGS) -o array_sum array_sum.s test_array_sum.c

test: all
	$(QEMU) ./factorial
	$(QEMU) ./fibonacci
	$(QEMU) ./array_sum

clean:
	rm -f *.o $(TARGETS)
