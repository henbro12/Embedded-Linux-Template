# SPDX-License-Identifier: MIT
# Strict warnings for the project's own targets (not for third-party code).
# Warnings are errors; relax locally with `cmake --preset <name> --compile-no-warning-as-error`.

function(project_warnings target)
  set_target_properties(${target} PROPERTIES COMPILE_WARNING_AS_ERROR ON)

  target_compile_options(${target} PRIVATE
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -Wconversion
    -Wsign-conversion
    -Wdouble-promotion
    -Wcast-align
    -Wformat=2
    -Wimplicit-fallthrough
    -Wmisleading-indentation
    -Wnull-dereference
    -Wswitch-enum
    -Wundef
    -Wvla
    $<$<COMPILE_LANGUAGE:CXX>:-Wnon-virtual-dtor>
    $<$<COMPILE_LANGUAGE:CXX>:-Woverloaded-virtual>
    $<$<COMPILE_LANGUAGE:CXX>:-Wold-style-cast>
    $<$<AND:$<COMPILE_LANGUAGE:CXX>,$<CXX_COMPILER_ID:GNU>>:-Wuseless-cast>
  )
endfunction()
