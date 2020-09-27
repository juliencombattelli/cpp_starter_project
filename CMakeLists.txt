cmake_minimum_required(VERSION 3.17.4)
project(conan-test)

set(CMAKE_MODULE_PATH 
    ${CMAKE_SOURCE_DIR}/cmake/Scripts 
    ${CMAKE_CURRENT_LIST_DIR}/cmake/Modules 
    ${CMAKE_MODULE_PATH}
)

include(Conan)
include(Doxygen)
include(InterproceduralOptimization)
include(PrecompiledHeaders)
include(Sanitizers)
include(StaticAnalyzers)
include(Warnings)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(math src/Math/Factorial.cpp)
target_include_directories(math PUBLIC include)

find_package(fmt REQUIRED)
find_package(spdlog REQUIRED)

add_executable(intro src/main.cpp)
target_link_libraries(intro PRIVATE fmt::fmt spdlog::spdlog)

if(BUILD_TEST)
    add_subdirectory(test)
endif()