option(USE_CONAN "ON if the dependencies are provided by Conan" OFF)
if(USE_CONAN)
    # TODO check if conan_paths.cmake exists
    #      warn the user to run 'conan install' if necessary
    include(${CMAKE_CURRENT_BINARY_DIR}/conan_paths.cmake)
endif()