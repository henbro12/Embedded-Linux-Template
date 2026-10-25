#!/usr/bin/env bash
# Builds and tests the coverage preset, then writes coverage/index.html (HTML) and coverage/coverage.xml (Cobertura).
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

cmake --workflow --preset coverage

rm -rf coverage
mkdir -p coverage
gcovr --root . --filter 'libs/' --filter 'apps/' --exclude '.*/generated/.*' \
  --print-summary --xml-pretty --output coverage/coverage.xml \
  --html-details coverage/index.html \
  build/coverage

echo "Coverage report: coverage/index.html"
