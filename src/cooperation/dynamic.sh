#!/bin/bash
clang dynamic.c -o dynamic -lreadline -ldl
./dynamic

:<< END
e.g.
>>double fn(double in){
>>double c = in * 4;
>>return c;
>>}
f(1) = 4
f(2) = 8
f(10) = 40
END