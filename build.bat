@REM Copyright (c) 2014-2015 Sebastien Rombauts (sebastien.rombauts@gmail.com)
@REM
@REM Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
@REM or copy at http://opensource.org/licenses/MIT)
mkdir build
cd build

# Generate a Visual Studio solution for latest version found
cmake .. @REM -G "Visual Studio 10"

# Build default configuration (ie 'Debug')
cmake --build .
cd ..
