CC   = arm-linux-gnueabi-gcc
AS   = arm-linux-gnueabi-as

all: test_subroutines test_recursive_fact

test_subroutines: subroutines.s test_subroutines.c
	$(CC) -static -marm -o test_subroutines subroutines.s test_subroutines.c

test_recursive_fact: recursive_fact.s test_recursive_fact.c
	$(CC) -static -marm -o test_recursive_fact recursive_fact.s test_recursive_fact.c

clean:
	rm -f test_subroutines test_recursive_fact *.o
