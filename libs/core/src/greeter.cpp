/**
 * SPDX-License-Identifier: MIT
 *
 * @file greeter.cpp
 * @brief Example library code; replace with your own.
 */

#include "core/greeter.h"

#include <format>

namespace core {

std::string greet(std::string_view name)
{
    return std::format("Hello, {}!", name.empty() ? std::string_view{"world"} : name);
}

} // namespace core
