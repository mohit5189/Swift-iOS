/**
 Example 2:

 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Incrementing by one gives 4321 + 1 = 4322.
 Thus, the result should be [4,3,2,2].
 Example 3:

 Input: digits = [0]
 Output: [1]
 Explanation: The array represents the integer 0.
 Incrementing by one gives 0 + 1 = 1.
 Thus, the result should be [1].
 Example 4:

 Input: digits = [9]
 Output: [1,0]
 Explanation: The array represents the integer 9.
 Incrementing by one gives 9 + 1 = 10.
 Thus, the result should be [1,0].
 */
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var index = digits.count - 1
        var editableDigits = digits
        var carried = 1
        if editableDigits[index] != 9 {
            editableDigits[index] = editableDigits[index] + 1
            return digits
        }
        while index >= 0 {
        if editableDigits[index] + carried == 10 {
            editableDigits[index] = 0
        } else {
           editableDigits[index] = editableDigits[index] + carried
           carried = 0
        }
            index -= 1
        }

        if carried == 1 {
            editableDigits.insert(1, at: 0)
        }

        return editableDigits
    }
}
