# SPDX-License-Identifier: MIT

# Example library: replace with your own code. Add more libraries as libs/<name>.
add_library(core STATIC
  src/greeter.cpp
)

# Generated header with the project version and git commit
configure_file(src/version.h.in ${CMAKE_CURRENT_BINARY_DIR}/generated/core/version.h @ONLY)

target_include_directories(core PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/include
  ${CMAKE_CURRENT_BINARY_DIR}/generated
)

target_compile_features(core PUBLIC cxx_std_20)
project_warnings(core)

add_library(project::core ALIAS core)
