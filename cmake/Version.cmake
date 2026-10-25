# SPDX-License-Identifier: MIT
# Version information for the build: the project version plus the git commit it was built from.
# Note: the commit is determined at configure time; re-run CMake to refresh it.

find_package(Git QUIET)

set(PROJECT_GIT_DESCRIBE "unknown")
if(GIT_FOUND)
  execute_process(
    COMMAND ${GIT_EXECUTABLE} describe --always --dirty --tags
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE _git_describe
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_QUIET
    RESULT_VARIABLE _git_result
  )
  if(_git_result EQUAL 0 AND _git_describe)
    set(PROJECT_GIT_DESCRIBE "${_git_describe}")
  endif()
endif()

message(STATUS "${PROJECT_NAME} ${PROJECT_VERSION} (${PROJECT_GIT_DESCRIBE})")
