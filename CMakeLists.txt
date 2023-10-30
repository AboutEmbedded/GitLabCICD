cmake_minimum_required(VERSION 3.0.0)
project(BasePrj VERSION 0.0.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")

include(GNUInstallDirs)

# Source files definition
file(GLOB_RECURSE SRC_FILES
    ${PROJECT_SOURCE_DIR}/main.cpp
    ${PROJECT_SOURCE_DIR}/user_code/src/functions.cpp
)

# Include dirs definition
include_directories(
    ${PROJECT_SOURCE_DIR}
    ${PROJECT_SOURCE_DIR}/user_code/inc
)

add_executable(${PROJECT_NAME}
    ${SRC_FILES}
)

add_subdirectory(tests)