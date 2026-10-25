#!/usr/bin/env bash
# Formats all C/C++ sources with clang-format. Use --check to only report (CI).
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

mapfile -t files < <(git ls-files --cached --others --exclude-standard -- \
  '*.c' '*.cpp' '*.h' '*.hpp' '*.h.in')

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No files to format."
  exit 0
fi

if [[ "${1:-}" == "--check" ]]; then
  clang-format --dry-run --Werror "${files[@]}"
  echo "Formatting OK (${#files[@]} files)."
else
  clang-format -i "${files[@]}"
  echo "Formatted ${#files[@]} files."
fi
