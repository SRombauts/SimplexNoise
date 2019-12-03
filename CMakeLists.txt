# Copyright (c) 2014-2018 Sebastien Rombauts (sebastien.rombauts@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)

cmake_minimum_required(VERSION 2.6)
project (SimplexNoise)

# Print some standard CMake variables
message(STATUS "CMAKE_SYSTEM_NAME/_VERSION      '${CMAKE_SYSTEM_NAME}' '${CMAKE_SYSTEM_VERSION}'")
message(STATUS "CMAKE_CXX_COMPILER_ID/_VERSION  '${CMAKE_CXX_COMPILER_ID}' '${CMAKE_CXX_COMPILER_VERSION}'")
if (NOT MSVC)
    message(STATUS "CMAKE_BUILD_TYPE                '${CMAKE_BUILD_TYPE}'")
endif (NOT MSVC)

# Define useful variables to handle OS/Compiler differences
if (MSVC)
    set(CPPLINT_ARG_OUTPUT      "--output=vs7")
    set(CPPCHECK_ARG_TEMPLATE   "--template=vs")
    set(DEV_NULL                "NUL")
    set(SYSTEM_LIBRARIES        "")
    # Set warning level to maximum (instead of default /W3)
    set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} /W4")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
else (MSVC)
    set(CPPLINT_ARG_OUTPUT      "--output=eclipse")
    set(CPPCHECK_ARG_TEMPLATE   "--template=gcc")
    set(DEV_NULL                "/dev/null")
    if (NOT APPLE)
        set(SYSTEM_LIBRARIES        "rt")
    endif (NOT APPLE)
    # C++11 :
    add_definitions(-std=c++0x) # equivalent to "-std=c++11" but backward compatible for GCC 4.6 on Travic-CI
    # Stack protection
    add_definitions(-fstack-protector-all)
    
    if (CMAKE_COMPILER_IS_GNUCXX)
        # GCC flags
        # For stacktraces:
        add_definitions(-rdynamic -fstack-protector-all)
        # Enable maximum of Warnings :
        add_definitions(-Wall -Wextra -Wswitch-default -Wswitch-enum -Winit-self -Wformat-security -Wfloat-equal -Wcast-qual -Wconversion -Wlogical-op -Winline)
        if (CMAKE_CXX_COMPILER_VERSION VERSION_EQUAL "4.9" OR CMAKE_CXX_COMPILER_VERSION VERSION_GREATER "4.9")
            add_definitions (-Wfloat-conversion)
            add_definitions (-Wshadow)
        endif ()
    elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
        # Clang flags
        # Enable maximum of Warnings :
        add_definitions(-Weverything)
        add_definitions(-Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-padded -Wno-covered-switch-default -Wno-unreachable-code)
    endif (CMAKE_COMPILER_IS_GNUCXX)
endif (MSVC)
set(CPPLINT_ARG_LINELENGTH "--linelength=120")
set(CPPLINT_ARG_VERBOSE    "--verbose=1")

# List all sources/headers files
set(source_files
 ${PROJECT_SOURCE_DIR}/src/SimplexNoise.cpp
 ${PROJECT_SOURCE_DIR}/src/SimplexNoise.h
 ${PROJECT_SOURCE_DIR}/test/main.cpp
)
source_group(src,     FILES ${source_files})

# List script files
set(script_files
 ${PROJECT_SOURCE_DIR}/.travis.yml
 ${PROJECT_SOURCE_DIR}/appveyor.yml
 ${PROJECT_SOURCE_DIR}/build.bat
 ${PROJECT_SOURCE_DIR}/build.sh
)
source_group(scripts, FILES ${script_files})

# List doc files
set(doc_files
 ${PROJECT_SOURCE_DIR}/README.md
 ${PROJECT_SOURCE_DIR}/LICENSE.txt
)
source_group(doc,     FILES ${doc_files})

# All includes are relative to the "src" directory
include_directories("${PROJECT_SOURCE_DIR}/src")

# add the application executable
add_executable(SimplexNoise ${source_files} ${doc_files} ${script_files})
target_link_libraries(SimplexNoise ${SYSTEM_LIBRARIES})


# Optional additional targets:

option(SIMPLEXNOISE_RUN_CPPLINT "Run cpplint.py tool for Google C++ StyleGuide." ON)
if (SIMPLEXNOISE_RUN_CPPLINT)
    # add a cpplint target to the "all" target
    add_custom_target(cpplint
     ALL
     COMMAND python ${PROJECT_SOURCE_DIR}/cpplint/cpplint.py ${CPPLINT_ARG_OUTPUT} ${CPPLINT_ARG_LINELENGTH} ${CPPLINT_ARG_VERBOSE} ${source_files}
    )
else (SIMPLEXNOISE_RUN_CPPLINT)
    message(STATUS "SIMPLEXNOISE_RUN_CPPLINT OFF")
endif (SIMPLEXNOISE_RUN_CPPLINT)

option(SIMPLEXNOISE_RUN_CPPCHECK "Run cppcheck C++ static analysis tool." ON)
if (SIMPLEXNOISE_RUN_CPPCHECK)
    find_program(CPPCHECK_EXECUTABLE NAMES cppcheck)
    if (CPPCHECK_EXECUTABLE)
        # add a cppcheck target to the "all" target
        add_custom_target(cppcheck
         ALL
         COMMAND cppcheck --enable=style --quiet ${CPPCHECK_ARG_TEMPLATE} ${PROJECT_SOURCE_DIR}/src
        )
    else (CPPCHECK_EXECUTABLE)
        message(STATUS "Could NOT find cppcheck")
    endif (CPPCHECK_EXECUTABLE)
else (SIMPLEXNOISE_RUN_CPPCHECK)
    message(STATUS "SIMPLEXNOISE_RUN_CPPCHECK OFF")
endif (SIMPLEXNOISE_RUN_CPPCHECK)

option(SIMPLEXNOISE_RUN_DOXYGEN "Run Doxygen C++ documentation tool." ON)
if (SIMPLEXNOISE_RUN_DOXYGEN)
    find_package(Doxygen)
    if (DOXYGEN_FOUND)
        # add a Doxygen target to the "all" target
        add_custom_target(doxygen
         ALL
         COMMAND doxygen Doxyfile > ${DEV_NULL}
         WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        )
    endif (DOXYGEN_FOUND)
else (SIMPLEXNOISE_RUN_DOXYGEN)
    message(STATUS "SIMPLEXNOISE_RUN_DOXYGEN OFF")
endif (SIMPLEXNOISE_RUN_DOXYGEN)

