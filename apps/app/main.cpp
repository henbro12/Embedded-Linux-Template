/**
 * SPDX-License-Identifier: MIT
 *
 * @file main.cpp
 * @brief Example application entry point; replace with your own.
 */

#include <cstdio>
#include <cstdlib>
#include <format>
#include <span>
#include <string_view>

#include "core/greeter.h"
#include "core/version.h"

int main(int argc, char** argv)
{
    const std::span<char*> args{argv, static_cast<std::size_t>(argc)};

    std::string_view name;
    for (const std::string_view arg : args.subspan(1)) {
        if (arg == "--version") {
            std::puts(std::format("{} {} ({})", core::PROJECT_NAME, core::PROJECT_VERSION, core::GIT_DESCRIBE).c_str());
            return EXIT_SUCCESS;
        }
        name = arg;
    }

    std::puts(core::greet(name).c_str());
    return EXIT_SUCCESS;
}
