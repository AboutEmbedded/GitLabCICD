enable_testing()

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
set(INSTALL_GTEST OFF CACHE BOOL "")

set(CMAKE_SUPPRESS_DEVELOPER_WARNINGS 1 CACHE BOOL "")
include(FetchContent)
FetchContent_Declare(googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.12.1)
FetchContent_MakeAvailable(googletest)
FetchContent_GetProperties(googletest)
if(NOT googletest_POPULATED)
  FetchContent_Populate(googletest)
  add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
endif()
unset(CMAKE_SUPPRESS_DEVELOPER_WARNINGS)

if(CMAKE_CONFIGURATION_TYPES)
    add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND}
        --force-new-ctest-process --output-on-failure
        --build-config "$<CONFIGURATION>")
else()
    add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND}
        --force-new-ctest-process --output-on-failure)
endif()
set_target_properties(check PROPERTIES FOLDER "Scripts")

target_include_directories(gtest SYSTEM BEFORE INTERFACE
    "$<BUILD_INTERFACE:${gtest_SOURCE_DIR}/include>"
#    "$<BUILD_INTERFACE:${gmock_SOURCE_DIR}/include>"
)

if(GOOGLE_TEST_INDIVIDUAL)
    if(NOT CMAKE_VERSION VERSION_LESS 3.9)
        include(GoogleTest)
    else()
        set(GOOGLE_TEST_INDIVIDUAL OFF)
    endif()
endif()

mark_as_advanced(
#    gmock_build_tests
    gtest_build_samples
    gtest_build_tests
    gtest_disable_pthreads
    gtest_force_shared_crt
    gtest_hide_internal_symbols
#    BUILD_GMOCK
    BUILD_GTEST
)

set_target_properties(gtest gtest_main PROPERTIES FOLDER "Extern")
#set_target_properties(gmock gmock_main PROPERTIES FOLDER "Extern")

add_custom_target(build_and_test GTEST_COLOR=1 ${CMAKE_CTEST_COMMAND} -V)

#file(COPY ${CMAKE_SOURCE_DIR}/tests/test_config.json DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/integration)

add_subdirectory(unit_tests)
#add_subdirectory(integration)
