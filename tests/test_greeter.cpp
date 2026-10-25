/**
 * SPDX-License-Identifier: MIT
 *
 * @file test_greeter.cpp
 * @brief Example unit tests; replace with your own.
 */

#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include "core/greeter.h"

TEST(Greeter, GreetsByName)
{
    EXPECT_EQ(core::greet("Linux"), "Hello, Linux!");
}

TEST(Greeter, FallsBackToWorld)
{
    EXPECT_EQ(core::greet(""), "Hello, world!");
}

TEST(Greeter, KeepsNameIntact)
{
    EXPECT_THAT(core::greet("embedded C++"), ::testing::HasSubstr("embedded C++"));
}
