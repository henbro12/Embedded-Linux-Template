#!/usr/bin/env bash
# Runs clang-tidy on the project's sources, using the compile database of a Clang preset.
# Usage: ./scripts/tidy.sh [preset] [-- extra run-clang-tidy args]   (default preset: debug-clang)
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

PRESET="debug-clang"
if [[ $# -gt 0 && "$1" != "--" ]]; then
  PRESET="$1"
  shift
fi
[[ "${1:-}" == "--" ]] && shift

# Configuring is enough: it generates compile_commands.json, generated headers and fetches dependencies
cmake --preset "$PRESET" > /dev/null

run-clang-tidy -quiet -p "build/$PRESET" "$@" "$PWD/(libs|apps|tests)/"
