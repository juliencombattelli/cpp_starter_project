option(ENABLE_TESTING "Enable test builds" ON)
if (ENABLE_TESTING)
    enable_testing()
    include(GoogleTest)
    find_package(GTest)
endif()