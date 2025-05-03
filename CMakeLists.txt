cmake_minimum_required(VERSION 3.10)
project(hello LANGUAGES C)

set(SOURCE_DIR src)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# main 'hello'
add_executable(hello)
target_sources(hello PRIVATE ${SOURCE_DIR}/main.c ${SOURCE_DIR}/hello.c)

# unit tests
set(TEST_SOURCE_DIR tests)
add_executable(hello_tests ${TEST_SOURCE_DIR}/main_test.c ${SOURCE_DIR}/hello.c)
target_link_libraries(hello_tests cunit)

# target: cleanup
add_custom_target(cleanup
  COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/bin
  COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/build
  COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/CMakeFiles
  COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_BINARY_DIR}/cmake_install.cmake
  COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_BINARY_DIR}/CMakeCache.txt
  COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_BINARY_DIR}/Makefile
  VERBATIM)
