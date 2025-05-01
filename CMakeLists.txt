cmake_minimum_required(VERSION 3.10)
project(hello LANGUAGES C)

set(SOURCE_DIR src)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_executable(hello ${SOURCE_DIR}/main.c ${SOURCE_DIR}/hello.c)
