# SPDX-License-Identifier: MIT
# Third-party dependencies, pinned by version and hash.
# For offline builds, point FETCHCONTENT_SOURCE_DIR_<NAME> at a local checkout.

include(FetchContent)

FetchContent_Declare(googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.18.0.tar.gz
  URL_HASH SHA256=6e3191c1455468b3fc35a417fb565c1c5071aee1b7e7f85e30cf48a98d37d8b5
  SYSTEM # include as system headers, so the project's strict warnings don't apply to them
)

set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
set(BUILD_GMOCK ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)
