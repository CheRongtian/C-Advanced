#!/bin/bash
:<<END
it functions on all .c files in the dict
END
for i in 0 1 2 3 4 5 6 7 8 9;
do
 grep -E '(^|[^0-9.])'$i *.c > lines_with_${i};
done
wc -l lines_with* # A rough histogram of your digital usage

:<<END
or:
for i in `seq 1 1000`;
do
 ./run_program > ${i}.out;
done
END