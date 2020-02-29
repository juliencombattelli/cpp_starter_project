#!/bin/bash

set -e

runner_os=$1

[ "$runner_os" == "" ] && exit 1

echo "Running on $runner_os"

ninja_version="1.9.0"
cmake_version="3.16.2"

if [ "$runner_os" == "Windows" ]; then
    ninja_suffix="win.zip"
    cmake_suffix="win64-x64.zip"
    cmake_dir="cmake-${cmake_version}-win64-x64/bin"
elif [ "$runner_os" == "Linux" ]; then
    ninja_suffix="linux.zip"
    cmake_suffix="Linux-x86_64.tar.gz"
    cmake_dir="cmake-${cmake_version}-Linux-x86_64/bin"
elif [ "$runner_os" == "macOS" ]; then
    ninja_suffix="mac.zip"
    cmake_suffix="Darwin-x86_64.tar.gz"
    cmake_dir="cmake-${cmake_version}-Darwin-x86_64/CMake.app/Contents/bin"
fi

curl -LO "https://github.com/ninja-build/ninja/releases/download/v${ninja_version}/ninja-${ninja_suffix}"
cmake -E tar xf "./ninja-${ninja_suffix}"

curl -LO "https://github.com/Kitware/CMake/releases/download/v${cmake_version}/cmake-${cmake_version}-${cmake_suffix}"
cmake -E tar xf "./cmake-${cmake_version}-${cmake_suffix}"

# Save the path for other steps
cmake_dir=${GITHUB_WORKSPACE//\\//}/$cmake_dir
echo "::set-output name=cmake_dir::${cmake_dir}"

if [ "$runner_os" != "Windows" ]; then
    chmod +x ninja
    chmod +x $cmake_dir/cmake
fi
