func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLength = 0
    var subString = ""

    if s.length == 1 {
        return 1
    } else if s.length == 0 {
        return 0
    }

    for char in s {
        // Check if char available is substring, if yes generate substring after char
        if let range = subString.range(of: String(char)) {
            subString = String(subString[range.upperBound...])
        }
        subString += String(char)
        maxLength = subString.length > maxLength ? subString.length : maxLength
    }
    return maxLength
}

