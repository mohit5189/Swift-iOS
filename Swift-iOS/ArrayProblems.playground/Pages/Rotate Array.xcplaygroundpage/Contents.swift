/**
 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 */
class Solution {
    // First rotate whole array, then rotate first and second half
    /**
    [1,2,3,4,5,6,7]  -> [5,6,7,1,2,3,4] -> required
    [1,2,3,4,5,6,7]  -> [7,6,5,4,3,2,1] -> first rotate
    divide from count passed
    [7,6,5][4,3,2,1]
    reverse
    [5,6,7][1,2,3,4]

    */
    func rotate(_ nums: inout [Int], _ k: Int) {
        var i = 0
        var j = nums.count - 1

        if nums.count != 1 {
        while i < j {
            var temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
            i += 1
            j -= 1
        }

        i = 0
        j = k - 1

        while i < j {
            var temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
            i += 1
            j -= 1
        }

        i = k
        j = nums.count - 1

        while i < j {
            var temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
            i += 1
            j -= 1
        }
        }
    }
}
