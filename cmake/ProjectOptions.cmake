# SPDX-License-Identifier: MIT
# Project-wide options. Set them in CMakePresets.json or with -D on the command line.

set(PROJECT_SANITIZERS "" CACHE STRING
  "Semicolon-separated sanitizers for all targets, e.g. 'address;undefined' or 'thread'")

option(PROJECT_COVERAGE "Instrument all targets for code coverage (GCC/Clang --coverage)" OFF)

if(PROJECT_COVERAGE)
  add_compile_options(--coverage -O0)
  add_link_options(--coverage)
endif()
