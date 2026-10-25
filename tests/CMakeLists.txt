# SPDX-License-Identifier: MIT

add_executable(unit_tests
  test_greeter.cpp
  test_version.cpp
)

target_link_libraries(unit_tests PRIVATE
  project::core
  GTest::gtest_main
  GTest::gmock
)

project_warnings(unit_tests)

include(GoogleTest)
gtest_discover_tests(unit_tests
  TEST_PREFIX "unit."
)
