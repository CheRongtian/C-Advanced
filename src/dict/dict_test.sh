#!/bin/bash
clang -g -o dict_test dict_test.c dict.c keyval.c $(pkg-config --cflags --libs glib-2.0) -isysroot $(xcrun --show-sdk-path)


# for gcov.sh
chmod +x gcov.sh
./gcov.sh