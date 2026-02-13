#!/bin/bash
clang -g -O0 -o glist_lldb glist.c $(pkg-config --cflags --libs glib-2.0)
lldb ./glist_lldb

:<< END
(lldb) command source lldb_showlist
(lldb) b 12
(lldb) r
(lldb) phead char list
(lldb) pnext char
END