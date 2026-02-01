#!/bin/bash
# docker build -t advanced-c-env . # create the docker image
# docker run --privileged -it -v $(pwd):/app advanced-c-env /bin/bash # run the image
clang -g -o glist glist.c $(pkg-config --cflags --libs glib-2.0) # compile the file
./glist

:<< END
(gdb) source gdb_showlist
(gdb) b 12
(gdb) r
(gdb) phead char list
END