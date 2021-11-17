
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

        var maxNumber = myPow(2, 31)
        if isPositive {
            maxNumber -= 1
        }
        for char in finalString {
           var intValue = char.unicodeScalars.first!.value - "0".unicodeScalars.first!.value
            var result = finalNumber * 10 + Int(intValue)
           finalNumber = result > maxNumber ? maxNumber : result
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
