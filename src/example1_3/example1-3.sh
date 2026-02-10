#!/bin/bash
brew install pkg-config
brew install wget
wget ftp://ftp.gnu.org/gnu/gsl/gsl-1.16.tar.gz
tar xvzf gsl-*gz
cd gsl-1.16
./configure
make
sudo make install