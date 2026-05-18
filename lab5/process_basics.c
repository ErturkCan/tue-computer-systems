// process_basics.c — fork, exec, and wait basics
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(void) {
    printf("Parent PID: %d\n", getpid());

    pid_t pid = fork();

    if (pid < 0) {
        perror("fork failed");
        return 1;
    }

    if (pid == 0) {
        // Child process
        printf("Child PID: %d, parent PID: %d\n", getpid(), getppid());
        // Replace child process image with 'ls -la'
        execlp("ls", "ls", "-la", NULL);
        // execlp only returns if it fails
        perror("exec failed");
        exit(1);
    } else {
        // Parent waits for child to finish
        int status;
        waitpid(pid, &status, 0);
        printf("Child exited with status: %d\n", WEXITSTATUS(status));
    }

    return 0;
}
