
// ref - https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/

func largestConsecutiveSum(_ arr: [Int]) {
    var currentSum  = arr[0]
    var maxSum = arr[0]
    
    for num in arr {
        currentSum = num > (currentSum + num) ? num : (currentSum + num)
        maxSum = currentSum > maxSum ? currentSum : maxSum
    }
    
    print(maxSum)
    print(currentSum)
}


var arr = [-4, -1, -2, -4, 1, 2, -1] // output should be 3
largestConsecutiveSum(arr)
largestConsecutiveSum([-1,2,3,4, -5,100])
