// file_io.c — read a file and print its contents using raw Linux syscalls
// No stdio, no stdlib file functions — direct kernel interface.
#include <sys/syscall.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        const char msg[] = "Usage: file_io <filename>\n";
        syscall(SYS_write, STDOUT_FILENO, msg, sizeof(msg) - 1);
        return 1;
    }

    // Open file — O_RDONLY = 0
    int fd = syscall(SYS_open, argv[1], O_RDONLY, 0);
    if (fd < 0) {
        const char msg[] = "Error: cannot open file\n";
        syscall(SYS_write, STDERR_FILENO, msg, sizeof(msg) - 1);
        return 1;
    }

    char buf[4096];
    long n;

    // Read in 4KB chunks until EOF
    while ((n = syscall(SYS_read, fd, buf, sizeof(buf))) > 0)
        syscall(SYS_write, STDOUT_FILENO, buf, n);

    syscall(SYS_close, fd);
    return 0;
}
