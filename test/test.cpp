#include <Math/Factorial.hpp>

#include <gtest/gtest.h>

// NOLINTNEXTLINE
TEST(MyProject, Factorial)
{
    EXPECT_EQ(math::factorial(1), 1);
    EXPECT_EQ(math::factorial(2), 2);
    EXPECT_EQ(math::factorial(3), 6);
    EXPECT_EQ(math::factorial(10), 3628800);
}

int main(int argc, char** argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}