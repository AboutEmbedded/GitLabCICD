#include <gtest/gtest.h>  //tests

#include "functions.hpp"  //functions for test
#include "iostream"

TEST(FuncTests, sum) { ASSERT_EQ(sum(3, 5), 8); }
TEST(FuncTests, mux) { ASSERT_EQ(mux(3, 5), 15); }

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
