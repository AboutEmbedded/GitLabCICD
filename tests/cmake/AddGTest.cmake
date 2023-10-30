cmake_minimum_required(VERSION 3.13)

macro(EasyGtest CPPFILE)
    get_filename_component(filename ${CPPFILE} NAME_WE)
    add_executable(${filename} ${CPPFILE} ${ARGN})
    AddGtest(${filename} ${ARGN})
endmacro()

macro(AddGtest TESTNAME)
    target_link_libraries(${TESTNAME} PUBLIC gtest gmock gtest_main ${PROJECT_LIBRARIES})
    target_include_directories(${TESTNAME} PRIVATE ${CMAKE_SOURCE_DIR})

    if(GOOGLE_TEST_INDIVIDUAL)
        if(CMAKE_VERSION VERSION_LESS 3.10)
            gtest_add_tests(TARGET ${TESTNAME}
                            TEST_PREFIX "${TESTNAME}."
                            TEST_LIST TmpTestList)
            set_tests_properties(${TmpTestList} PROPERTIES FOLDER "Tests")
        else()
            gtest_discover_tests(${TESTNAME}
                TEST_PREFIX "${TESTNAME}."
                PROPERTIES FOLDER "Tests")
        endif()
    else()
        add_test(${TESTNAME} ${TESTNAME})
        set_target_properties(${TESTNAME} PROPERTIES FOLDER "Tests")
    endif()

    add_dependencies(build_and_test ${TESTNAME})
endmacro()
