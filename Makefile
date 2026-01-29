CC = clang
CFLAGS = -O2 -Wall -Wextra -Wpedantic
LDLIBS = $(shell pkg-config --libs gsl)
CPPFLAGS = $(shell pkg-config --cflags gsl)

PROGRAM = example1-3
SOURCE = example1-3.c

all: $(PROGRAM)

$(PROGRAM): $(SOURCE)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(SOURCE) -o $(PROGRAM) $(LDLIBS)

clean:
	rm -f $(PROGRAM) *.o

run: $(PROGRAM)
	./$(PROGRAM)