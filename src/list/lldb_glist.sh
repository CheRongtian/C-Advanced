#!/bin/bash
clang -isysroot $(xcrun --show-sdk-path) -g -o glist_lldb glist.c $(pkg-config --cflags --libs glib-2.0)
lldb ./glist_lldb

:<< END
(lldb) command source lldb_showlist
(lldb) b 12
(lldb) r
(lldb) phear char list
(lldb) pnext char
END