bool is_sub_arr(int arr1[], int size1, int sub_arr[], int size2) {
    if (size2 > size1) return false;

    for (int i = 0; i <= size1 - size2; i++) {
        bool flag = true;
        for (int j = 0; j < size2; j++) {
            if (arr1[i + j] != sub_arr[j]) {
                flag = false;
                break;
            }
        }
        if (flag) return true; 
    }
    return false; 
}
