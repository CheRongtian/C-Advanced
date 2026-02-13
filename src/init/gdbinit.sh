#!/bin/bash
clang -g -O0 -o ../test3/test3 ../test3/test3.c $(pkg-config --cflags --libs libxml-2.0)
gdb ../test3/test3

:<< END
(gdb) b main
(gdb) run
(gdb) n
(gdb) n
(gdb) n
(gdb) n
(gdb) pxml doc
END