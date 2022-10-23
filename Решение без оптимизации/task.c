#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int Task(int arr[], int length, int *B) {
    int k, j;
    j = 0;
    if (length == 1) {
        B[0] = arr[0];
        j = 1;
    } else {
        for (k = 0; k < length - 1; ++k) {
            B[j] = arr[k] + arr[k + 1];
            ++j;
        }
    }
    return j;
}
