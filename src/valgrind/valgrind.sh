#!/bin/bash
clang -g -gdwarf-4 -Wall stddev_bugged.c -lm -o stddev_bugged_docker
# compile the file in docker environment
valgrind --vgdb-error=0 ./stddev_bugged_docker


# use another terminal
docker exec -it [DockerID] /bin/bash
gdb ./stddev_bugged_docker
# target remote | vgdb

:<< END
(gdb) r
(gdb) b mean_and_var
(gdb) n
......
(gdb) p ratio
END

valgrind --leak-check=full ./stddev_bugged_docker # check memory leakage