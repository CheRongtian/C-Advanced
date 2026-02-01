FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    pkg-config \
    clang \
    lldb \
    gdb \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget ftp://ftp.gnu.org/gnu/gsl/gsl-1.16.tar.gz \
    && tar -xvzf gsl-1.16.tar.gz \
    && cd gsl-1.16 \
    && ./configure CC=clang \
    && make \
    && make install \
    && ldconfig

WORKDIR /app

ENV CC=clang
ENV CXX=clang++

RUN echo "define pxml" > /root/.gdbinit && \
    echo "    p xmlElemDump(stdout, \$arg0, xmlDocGetRootElement(\$arg0))" >> /root/.gdbinit && \
    echo "end" >> /root/.gdbinit && \
    echo "document pxml" >> /root/.gdbinit && \
    echo "    Print the tree of an already opened XML document." >> /root/.gdbinit && \
    echo "end" >> /root/.gdbinit && \
    echo "set auto-load safe-path /" >> /root/.gdbinit