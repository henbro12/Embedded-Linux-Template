# Project structure

How the template is organised and why. For build commands, see the [README](../README.md).

## Libraries, applications and tests

```
libs/<name>/   the code: logic, drivers, protocols
apps/<name>/   thin executables that wire libraries together
tests/         unit tests, linked against the libraries
```

```
        libs/core
        ▲       ▲
        │       │   target_link_libraries
   apps/app   tests/unit_tests
```

- **`libs/`** holds the functionality. Each library is a CMake target with its own `CMakeLists.txt`,
  public headers in `include/<name>/` and sources in `src/`. Libraries are static by default.
- **`apps/`** holds executables. An app parses its arguments and configuration, constructs the objects
  it needs from the libraries and runs them. It contains little logic of its own.
- **`tests/`** links the same libraries as the apps and tests them directly, without starting a program.

## Why this split

- **Testability:** code in a library can be unit-tested; code in `main()` cannot. Keep as much as
  possible in libraries, especially anything that can run without real hardware.
- **Reuse:** several apps can share the same libraries, for example a service and a diagnostics tool.
- **Clear dependencies:** each target declares what it exposes (`PUBLIC`) and what it uses (`PRIVATE`),
  so dependencies stay visible as the project grows.
- **Flexible deliverables:** an app in `apps/` is one way to ship the code. A library can also be the
  deliverable itself, for example as a shared library for another application. All code is built
  position-independent, so a static library can be linked into a shared one without changes.

## Adding a library or app

1. Create `libs/<name>/` or `apps/<name>/` with a `CMakeLists.txt`, using `libs/core` or `apps/app` as
   a starting point.
2. Add `add_subdirectory(libs/<name>)` or `add_subdirectory(apps/<name>)` to the top-level
   `CMakeLists.txt`. Libraries must come before the targets that use them.
3. Call `project_warnings(<target>)` on the new target.
4. For a library, add a `project::<name>` alias and link against the alias. CMake then reports a typo in
   a target name as an error instead of treating it as a system library.
5. Add tests for the library under `tests/`.

## Supporting files

| Path | Purpose |
|---|---|
| `cmake/` | Warnings, sanitizers, project options, version info and pinned third-party dependencies |
| `CMakePresets.json` | Build configurations: debug with sanitizers, ThreadSanitizer, coverage, release |
| `scripts/` | clang-format and clang-tidy helpers |
| `.devcontainer/` | Development container with the full toolchain |
| `.github/` | CI: builds, tests, sanitizers, formatting and clang-tidy |
| `guidelines.md` | Coding guidelines |
