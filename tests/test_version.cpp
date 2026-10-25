/**
 * SPDX-License-Identifier: MIT
 *
 * @file test_version.cpp
 * @brief Checks the generated version header.
 */

#include <gtest/gtest.h>

#include "core/version.h"

TEST(Version, IsFilledInByCMake)
{
    EXPECT_FALSE(core::PROJECT_NAME.empty());
    EXPECT_FALSE(core::PROJECT_VERSION.empty());
    EXPECT_FALSE(core::GIT_DESCRIBE.empty());
    EXPECT_EQ(core::PROJECT_VERSION.find('@'), std::string_view::npos);
}
