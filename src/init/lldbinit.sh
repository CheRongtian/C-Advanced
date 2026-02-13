#!/bin/bash
cat <<EOF > .lldbinit
command regex pxml 's/(.+)/expr -- (void)xmlElemDump(stdout, %1, (void *)xmlDocGetRootElement(%1))/'
EOF
clang -g -O0 -o ../test3/test3 ../test3/test3.c \
      $(pkg-config --cflags --libs libxml-2.0)
lldb -s .lldbinit ../test3/test3
:<< END
(lldb) b main
(lldb) r
(lldb) n
(lldb) n
(lldb) n
(lldb) n
(lldb) pxml doc
END

