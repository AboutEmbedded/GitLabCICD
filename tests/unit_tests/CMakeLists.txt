cmake_minimum_required(VERSION 3.0.0)
project(TestPrj VERSION 0.0.1)

include(${CMAKE_SOURCE_DIR}/tests/cmake/AddGTest.cmake)

file(GLOB_RECURSE SRC_FILES
    ${PROJECT_SOURCE_DIR}/tests.cpp
    ${PROJECT_SOURCE_DIR}/../../user_code/src/functions.cpp
)
EasyGtest(tests.cpp ${SRC_FILES})