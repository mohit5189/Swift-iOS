// https://www.geeksforgeeks.org/search-an-element-in-a-sorted-and-pivoted-array/


/*
Algo: for assending order array eg [4,5,6,7,8,1,2,3]

1. Find pivot index first, where we start rotation. This can be done by find mid, then compare previous and next element, based on that keep running recursion

2. Once we have pivot, run binary search
*/

func search(array: [Int]) {
    let pivot = findPivot(array: array, low: 0, high: array.count - 1)
    print(pivot)
    // perform binary search with array now
}

func findPivot(array: [Int], low: Int, high: Int) -> Int {
    if low == high {
        return low
    }
    let mid = (low + high)  / 2
    if array[mid] > array[mid + 1] {
        return mid
    } else if array[mid] < array[mid + 1] {
        return mid - 1
    } else if array[low] > array [mid]{
        return findPivot(array: array, low: low, high: mid-1)
    } else {
        return findPivot(array: array, low: mid + 1, high: high)
    }
}

search(array: [4,5,6,7,8,1,2,3])
