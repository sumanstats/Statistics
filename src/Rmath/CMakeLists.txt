cmake_minimum_required(VERSION 3.10)
project(Rmath VERSION 4.3.1 LANGUAGES C DESCRIPTION "Rmath shared standalone library of R")

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)

# /nologo /MT /std:c++latest /Ox /GL /DNDEBUG  /DWIN32 /DAO_ASSUME_WINDOWS98 -DMVM_HEAPSNAPSHOT_FORMAT=2 -D_GNU_SOURCE in MSVC
# but did not work with MSVC


##################################################
# Create target and set properties
##################################################

set(CMAKE_BUILD_TYPE Release)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/R_ext)

file(GLOB SOURCES "src/*.c" "src/standalone/*.c")


# generate shared library
add_library(Rmath SHARED
    ${SOURCES})

if (WIN32)
  set_target_properties(Rmath PROPERTIES PREFIX "")
endif()

# Generate makefiles compatible with GCC in windows with
# mkdir build && cd build && cmake .. -G "MinGW Makefiles" && make

# Generate Ninja build files with cmake .. -GNinja and after that run ninja
# also possible to generate MSYS Makefiles in Rtools chain 4.2