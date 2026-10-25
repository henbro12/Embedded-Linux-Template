# SPDX-License-Identifier: MIT

# Example application: replace with your own. Add more applications as apps/<name>.
add_executable(app
  main.cpp
)

target_link_libraries(app PRIVATE
  project::core
)

project_warnings(app)

install(TARGETS app RUNTIME DESTINATION bin)
