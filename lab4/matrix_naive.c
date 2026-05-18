#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define N 512

static double A[N][N], B[N][N], C[N][N];

// Column-major access on B causes cache misses on every inner iteration.
// Each access to B[k][j] skips N doubles = N*8 bytes in memory.
void matrix_multiply_naive(void) {
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            for (int k = 0; k < N; k++)
                C[i][j] += A[i][k] * B[k][j];  // B accessed column-wise: bad locality
}

int main(void) {
    // Fill matrices with simple values
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++) {
            A[i][j] = (double)(i + j) / N;
            B[i][j] = (double)(i * j + 1) / N;
        }

    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);

    matrix_multiply_naive();

    clock_gettime(CLOCK_MONOTONIC, &end);
    double elapsed = (end.tv_sec - start.tv_sec) +
                     (end.tv_nsec - start.tv_nsec) / 1e9;

    printf("Naive:  %.3f seconds  (C[0][0] = %.4f)\n", elapsed, C[0][0]);
    return 0;
}
