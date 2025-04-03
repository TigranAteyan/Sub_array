#include <stdio.h>
#include <gtest/gtest.h>
#include "func.h"

TEST(SubArrayTest, SubArray_EmptySubArray_ReturnsTrue) {
    const int size1 = 1;
    int arr1[] = {2};
    const int size2 = 0;
    int sub_arr[] = {};
    EXPECT_EQ(is_sub_arr(arr1, size1, sub_arr, size2), true);
}

TEST(SubArrayTest, SubArray_IdenticalArrays_ReturnsTrue) {
    const int size1 = 1;
    int arr1[] = {2};
    const int size2 = 1;
    int sub_arr[] = {1};
    EXPECT_EQ(is_sub_arr(arr1, size1, sub_arr, size2), false);
}

TEST(SubArrayTest, SubArray_IdenticalArrays_ReturnsTrue2) {
    const int size1 = 1;
    int arr1[] = {2};
    const int size2 = 1;
    int sub_arr[] = {1};
    EXPECT_EQ(is_sub_arr(arr1, size1, sub_arr, size2), false);
}

TEST(SubArrayTest, NotFound) {
    const int size1 = 4;
    int arr[] = {1, 2, 3, 4};
    const int size2 = 2;
    int sub_arr[] = {3, 2};  
    EXPECT_EQ(is_sub_arr(arr, size1, sub_arr, size2), false);
}
