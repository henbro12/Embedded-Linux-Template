# Embedded Linux C++ Template

CMake template for C++ projects on Linux. Includes presets, GoogleTest, sanitizers, coverage,
clang-format/clang-tidy and GitHub Actions CI.

## Requirements

- GCC 13+ or Clang 17+
- CMake 3.25+, Ninja, Git
- Optional: clang-format, clang-tidy, gcovr

```bash
sudo apt install build-essential cmake ninja-build git clang clang-format clang-tidy gcovr
```

The devcontainer in `.devcontainer/` has all of this installed.

## VS Code and devcontainer

1. Install Docker and the VS Code **Dev Containers** extension.
2. Open this folder in VS Code and choose **Reopen in Container** (or run *Dev Containers: Reopen in
   Container* from the Command Palette). The first start builds the image, which takes a few minutes.
3. The compilers, tools and VS Code extensions are installed in the container; nothing is needed on the host.

In the container:

- **Build, run, test, debug:** open the **CMake** view in the left activity bar. Select a configure
  preset (e.g. *Debug* or *Release*) and use its Build, Launch, Debug and Test buttons.
- **Tasks:** *Terminal → Run Task...* lists Build, Test and Run for debug and release, plus Format,
  Tidy and Coverage report. **Ctrl+Shift+B** builds the debug preset.
- **Debugging:** set the launch target to `app` in the CMake view, set a breakpoint and press **F5**
  (*Debug launch target (gdb)*). Program arguments go in `args` in `.vscode/launch.json`.

## Manual Build and test

```bash
cmake --workflow --preset debug     # configure, build and test
./build/debug/apps/app/app --version
```

Or step by step:

```bash
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

| Preset        | Compiler | Build type     | Notes                 |
|---------------|----------|----------------|-----------------------|
| `debug`       | GCC      | Debug          | ASan + UBSan          |
| `debug-clang` | Clang    | Debug          | ASan + UBSan          |
| `tsan`        | Clang    | RelWithDebInfo | ThreadSanitizer       |
| `coverage`    | GCC      | Debug          | Coverage instrumented |
| `release`     | GCC      | Release        |                       |

Build output goes to `build/<preset>/`. Warnings are errors; to relax this locally, configure with
`--compile-no-warning-as-error`. Pass `-DBUILD_TESTING=OFF` to skip the tests and the GoogleTest download.

## Code quality

```bash
./scripts/format.sh           # format all sources
./scripts/format.sh --check   # check only
./scripts/tidy.sh             # clang-tidy
```

Coverage report:

```bash
cmake --workflow --preset coverage
gcovr --root . --filter 'libs/' --filter 'apps/' --exclude '.*/generated/.*' \
  --html-details coverage/index.html build/coverage
```

## Layout

```
apps/app/     example application
libs/core/    example library, including the generated version header
tests/        unit tests
cmake/        warnings, sanitizers, options, version and dependencies
scripts/      format and clang-tidy helpers
```

See [docs/project-structure.md](docs/project-structure.md) for how libraries, apps and tests fit
together and why.

## Starting a new project

1. Set the name, version and description in `project()` in `CMakeLists.txt`.
2. Replace the example code in `libs/core`, `apps/app` and `tests` with your own.
3. Call `project_warnings(<target>)` on each of your targets.
4. Add third-party dependencies to `cmake/Dependencies.cmake`, pinned by version and hash.

Coding guidelines: [guidelines.md](guidelines.md).

## License

[MIT](LICENSE)
