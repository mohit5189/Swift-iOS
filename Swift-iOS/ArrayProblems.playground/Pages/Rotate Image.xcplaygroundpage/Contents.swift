//: [Previous](@previous)

// https://leetcode.com/problems/rotate-image/

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count {
            for j in 0..<i {
                var temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }

        for i in 0..<matrix.count {
            for j in 0..<(matrix.count / 2) {
                var temp = matrix[i][j]
                matrix[i][j] = matrix[i][matrix.count - 1 - j]
                matrix[i][matrix.count - 1 - j] = temp
            }
        }
    }
}
