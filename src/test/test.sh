#!/bin/bash
clang -include stdio.h test.c -o test --std=gnu99 -Wall -g -O3
./test