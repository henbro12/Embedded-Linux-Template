/**
 * SPDX-License-Identifier: MIT
 *
 * @file greeter.h
 * @brief Example library code; replace with your own.
 */

#pragma once

#include <string>
#include <string_view>

namespace core {

// Returns "Hello, <name>!", or "Hello, world!" when name is empty
[[nodiscard]] std::string greet(std::string_view name);

} // namespace core
