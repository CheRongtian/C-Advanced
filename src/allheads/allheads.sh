#!/bin/bash
shopt -s expand_aliases
rm -f a.out
go_libs="-lm"
go_flags="-g -Wall -include allheads.h -O3"
alias go_c="clang -xc - $go_libs $go_flags"

go_c << '----'
int main(){printf("Hello World.\n"); return 0;}
----
./a.out

:<<END
#!/bin/bash
go_libs="-lm"
go_flags="-g -Wall -include allheads.h -O3"
shopt -s expand_aliases

alias go_c="clang $go_libs $go_flags"

go_c file1.c file2.c file3.c

./a.out
END