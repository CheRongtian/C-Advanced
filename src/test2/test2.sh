#!/bin/bash
clang -O0 -g test2.c -o test2
lldb test2
:<<END
(lldb) b main
(lldb) r
(lldb) p int *$ptr = &x[3] #$ptr point to the memory addr of x[3]
(lldb) p *$ptr = 8 #output: (int)8 #give value to the memory that $ptr points to
(lldb) p *($ptr++) #output: (int) 8 #read the value of the memory that $ptr points to and then $ptr move sizeof(int) step
(lldb) p *$ptr #output: (int) 0 #demonstrate the value
END