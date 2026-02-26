AM_CFLAGS = $(shell pkg-config --cflags glib-2.0) -g -O3 -Wall

lib_LTLIBRARIES = libdict.la
libdict_la_SOURCES = ../dict/dict.c ../dict/keyval.c

include_HEADERS = ../dict/keyval.h ../dict/dict.h

bin_PROGRAMS = dict_use
dict_use_SOURCES = dict_use.c
dict_use_LDADD = libdict.la

TESTS = $(check_PROGRAMS)
check_PROGRAMS = dict_test
dict_test_LDADD = libdict.la