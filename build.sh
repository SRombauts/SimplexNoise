# Copyright (c) 2014-2018 Sebastien Rombauts (sebastien.rombauts@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
mkdir -p build
cd build

# Detect if clang is installed, then use it by default
if command -v clang >/dev/null 2>&1 ; then
    echo "Export environment variables to compile with clang++ instead of g++"
    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++ 
    export CCACHE_CPP2=yes # CMake special ccache mode for clang
fi

# Generate a Makefile with Debug flags
cmake .. -DCMAKE_BUILD_TYPE=Debug

# Build (ie 'make')
cmake --build .
