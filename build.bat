@REM Copyright (c) 2014-2018 Sebastien Rombauts (sebastien.rombauts@gmail.com)
@REM
@REM Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
@REM or copy at http://opensource.org/licenses/MIT)
mkdir build
cd build

@REM Generate a Visual Studio solution for latest version found
@REM cmake .. -G "Visual Studio 12"
cmake ..

@REM Build default configuration (ie 'Debug')
cmake --build .
cd ..
