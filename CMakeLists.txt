cmake_minimum_required(VERSION 3.15)
project(gsl_example VERSION 1.0.0 LANGUAGES C)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)

find_package(GSL REQUIRED)

add_executable(example1-3 example1-3.c)

target_link_libraries(example1-3 PRIVATE GSL::gsl GSL::gslcblas)

install(TARGETS example1-3 DESTINATION bin)