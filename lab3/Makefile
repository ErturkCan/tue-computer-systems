CC = arm-linux-gnueabi-gcc

all: test_linked_list

test_linked_list: linked_list.s test_linked_list.c
	$(CC) -static -marm -o test_linked_list linked_list.s test_linked_list.c

clean:
	rm -f test_linked_list *.o
