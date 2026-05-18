#!/usr/bin/env bash
set -e

echo "Compiling..."
gcc -O0 -o matrix_naive  matrix_naive.c  -lm
gcc -O0 -o matrix_cached matrix_cached.c -lm

echo "Running (3 times each)..."
for i in 1 2 3; do ./matrix_naive;  done
for i in 1 2 3; do ./matrix_cached; done
