#!/bin/bash
cat <<EOF > .lldbinit
command regex pxml 's/(.+)/expr -- (void)xmlElemDump((void *)__stdoutp, %1, (void *)xmlDocGetRootElement(%1))/'
EOF
clang -isysroot $(xcrun --show-sdk-path) -O0 -g test3.c -o test3 \
      -I$(xcrun --show-sdk-path)/usr/include/libxml2 -lxml2
lldb ./test3
:<< END
(lldb) b main
(lldb) r
(lldb) n
(lldb) n
(lldb) n
(lldb) n
(lldb) pxml doc
END
# This is for my MacOS running in local~
# For Docker, it would be good to use the gdb file as I have use __stdoutp for lldb, but for gdb, it should be stdoutp