#!/bin/bash
clang  -g -Wall stddev_bugged.c -lm -o stddev_bugged
lldb stddev_bugged

:<<END
(lldb) b mean_and_var #set a breakpoint
(lldb) r #run the code until the breakpoint
(lldb) parray 10 data #see 10 data in p
(lldb) bt #backtrace
(lldb) f 1 #check frame1
(lldb) p *(double(*)[7])d #start from d, print next 7 value as an array
(lldb) down #switch to the older stack
(lldb) thread list #list of threads
(lldb) b 16 #set a breakpoint in the loop
(lldb) breakpoint list #list of breakpoints
(lldb) break dis 1 #disable breakpoint NO.1
(lldb) break del 1 #delete breakpoint NO.1
(lldb) c #continue run the code
(lldb) frame variable #check local variable table
(lldb) dis avg #Automatic display: From now, whenever the program pauses, the debugger will automatically print the value of avg
END