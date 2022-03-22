cmake_minimum_required(VERSION 3.13)
project(co_learn)

set(CMAKE_CXX_STANDARD 11)

ADD_SUBDIRECTORY(thirdpart/libco)

INCLUDE_DIRECTORIES(thirdpart/libco)
# Macro for add example target
macro(add_example_target EXAMPLE_TARGET)
    add_executable("example_${EXAMPLE_TARGET}" "example_${EXAMPLE_TARGET}.cpp")
    target_link_libraries("example_${EXAMPLE_TARGET}" colib_static pthread dl)
endmacro(add_example_target)

add_example_target(consumer)
add_example_target(multi_consumer)
add_example_target(closure)
add_example_target(copystack)
add_example_target(echocli)
add_example_target(echosvr)
add_example_target(poll)
add_example_target(setenv)
add_example_target(specific)
add_example_target(thread)
add_example_target(loop)