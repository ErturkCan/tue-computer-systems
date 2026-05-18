#include <stdio.h>
#include <time.h>

#define N   512
#define BS  32  // block size tuned to fit in L1 cache

static double A[N][N], B[N][N], C[N][N];

// Blocked matrix multiply: processes NxN matrix in BSxBS tiles.
// Each tile fits in L1 cache, so repeated accesses hit cache instead of RAM.
void matrix_multiply_blocked(void) {
    for (int i = 0; i < N; i += BS)
        for (int j = 0; j < N; j += BS)
            for (int k = 0; k < N; k += BS)
                // Multiply tile (i,k) x (k,j) and accumulate into (i,j)
                for (int ii = i; ii < i + BS && ii < N; ii++)
                    for (int jj = j; jj < j + BS && jj < N; jj++)
                        for (int kk = k; kk < k + BS && kk < N; kk++)
                            C[ii][jj] += A[ii][kk] * B[kk][jj];
}

int main(void) {
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++) {
            A[i][j] = (double)(i + j) / N;
            B[i][j] = (double)(i * j + 1) / N;
        }

    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);

    matrix_multiply_blocked();

    clock_gettime(CLOCK_MONOTONIC, &end);
    double elapsed = (end.tv_sec - start.tv_sec) +
                     (end.tv_nsec - start.tv_nsec) / 1e9;

    printf("Blocked: %.3f seconds  (C[0][0] = %.4f)\n", elapsed, C[0][0]);
    return 0;
}
