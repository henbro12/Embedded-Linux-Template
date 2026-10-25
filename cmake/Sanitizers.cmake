# SPDX-License-Identifier: MIT
# Applies PROJECT_SANITIZERS to every target, including third-party ones (required for ASan/TSan to be reliable).

if(PROJECT_SANITIZERS)
  list(JOIN PROJECT_SANITIZERS "," _sanitizers)
  message(STATUS "Sanitizers enabled: ${_sanitizers}")

  add_compile_options(-fsanitize=${_sanitizers} -fno-omit-frame-pointer -fno-sanitize-recover=all)
  add_link_options(-fsanitize=${_sanitizers})
endif()
