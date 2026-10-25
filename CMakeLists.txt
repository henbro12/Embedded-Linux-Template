# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.25)

project(EmbeddedLinuxTemplate
  VERSION 0.1.0
  DESCRIPTION "Template for embedded Linux C++ projects"
  LANGUAGES CXX
)

# C++20 by default (widest support in embedded toolchains); override with -DCMAKE_CXX_STANDARD=23
if(NOT DEFINED CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 20)
endif()
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Allows static libraries to be linked into shared libraries later on
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(ProjectOptions)
include(CompilerWarnings)
include(Sanitizers)
include(Version)

add_subdirectory(libs/core)
add_subdirectory(apps/app)

include(CTest)
if(BUILD_TESTING)
  include(Dependencies)
  add_subdirectory(tests)
endif()
