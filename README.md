# Advanced C Learning Journey
This repository serves as a personal archive for documenting my journey into advanced C programming.

The primary goal is to deepen my understanding of the C language, master the modern compilation toolchain (LLVM), and practice using scientific libraries in a reproducible environment.

##  The Environment
To ensure a consistent development environment and manage dependencies (like GSL) without cluttering the local system, this project uses a containerized setup based on **Ubuntu 20.04**.

* **Toolchain**: **Clang & LLDB** (Chosen over GCC/GDB as I use Mac).
* **Libraries**: GSL (GNU Scientific Library) 1.16 pre-installed and configured.
* **Why Docker?**: To isolate the build environment and avoid OS-specific issues.

## Quick Start

### 1. Build the Environment
Run the following command in the project root to build the Docker image:

```bash
docker build -t c-learning-env .
```

### 2. Enter the Container
Mount the current directory to `/app` inside the container. This allows you to edit code in your local IDE (like VS Code) while compiling and running it inside the container.
```bash
 # MacOS / Linux
docker run -it --rm -v "$(pwd):/app" c-learning-env /bin/bash
```
```powershell
# Windows (PowerShell)
docker run -it --rm -v "${PWD}:/app" c-learning-env /bin/bash
```

## Development Workflow

### Compiling

I primarily use ```clang``` with specific flags to ensure strict standard compliance and debugging capability.

**Standard Compilation:**
To avoid compiler optimization interfering with the learning process (preventing "optimized out" variables during debugging), some may use ```-O0``` and ```-g```:

```bash
clang -g -O0 -o output_name source_file.c
```

**Building with GSL (Makefile):**
For projects that require GSL, I use  ```Makefile``` to handle library paths via `pkg-config` and also use ```CMakeLists.txt``` to compile.

**Makefile example**
```Makefile
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
```

### Debugging (LLDB)

Since this environment uses LLVM, **LLDB** is the default debugger.

```bash
lldb ./output_name
```

**Common LLDB Commands:**

| Command | Description |
| :--- | :--- |
| `b main` | Set a breakpoint at the main function |
| `r` | Run the program |
| `n` | Next line (Step over) |
| `s` | Step into function |
| `p variable` | Print variable value |
| `frame variable` | Show all local variables in the current scope |
| `br l` | List all breakpoints |

more are been recorded in the ```.sh``` files

##  Repository Structure

    .
    ├── Dockerfile       # Environment definition (Ubuntu + Clang + GSL)
    ├── .gitignore       # Git ignore rules
    ├── codes            # Source code (exercises and experiments)
    └── README.md        # Documentation

## 📚 References

* **Book**: [21st Century C: C Tips from the New School](http://shop.oreilly.com/product/0636920025108.do) by Ben Klemens
* **Tools**: [LLVM Compiler Infrastructure](https://llvm.org/), [LLVM GitHub Repo](https://github.com/llvm/llvm-project)