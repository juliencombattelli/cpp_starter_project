add_executable(math-test test.cpp)
target_link_libraries(math-test 
    PRIVATE
        math
        project_warnings project_options CONAN_PKG::gtest
)
gtest_discover_tests(math-test)