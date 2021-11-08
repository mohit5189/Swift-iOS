
class Solution {
    func myAtoi(_ s: String) -> Int {
        var finalString = ""
        var isPositive = true
        var finalNumber = 0
        var decimalIndex = -1

        for (index, char) in s.enumerated() {
            if char == " " {
                continue
            } else if char == "." {
                decimalIndex = index
                continue
            } else if char == "-" {
                isPositive = false
            } else if decimalIndex == -1 { // avoid all after .
                var intValue = Int(char.unicodeScalars.first!.value - "0".unicodeScalars.first!.value)
                if intValue >= 0, intValue <= 9 {
                    finalString += String(char)
                } else if finalString.length == 0 {
                    return 0
                }
            }
        }

        var length = finalString.length
        for char in finalString {
           var intValue = char.unicodeScalars.first!.value - "0".unicodeScalars.first!.value
           finalNumber += Int(intValue) * myPow(10, length-1)
           length -= 1
        }

        var maxNumber = myPow(2, 31)

        if finalNumber > maxNumber {
            finalNumber = maxNumber
        }

        return isPositive ? finalNumber : finalNumber * -1
    }

    private func myPow(_ num: Int, _ pow: Int) -> Int {
        var finalResult = 1
        if pow == 0 {
            return finalResult
        }
        for _ in 1...pow {
            finalResult *= num
        }
        return finalResult
    }
}
