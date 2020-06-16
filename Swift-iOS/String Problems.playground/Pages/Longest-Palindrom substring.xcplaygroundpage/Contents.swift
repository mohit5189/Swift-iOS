
// Run loop through string, then inner loop in both direction to check palindrom O(n^2)

func finaLongestPalindrom(_ string: String) {
    var length = 1
    var subString = ""
    for i in 1..<string.count - 1 {
        var start = i - 1
        var end = i + 1
        var innerLength = 1
        while start >= 0, end < string.count,
            string[string.index(string.startIndex, offsetBy: start)] == string[string.index(string.startIndex, offsetBy: end)]
        {
            innerLength += 2
            start -= 1
            end += 1
        }
        
        if innerLength > length {
            length = innerLength
            // reset to prev state
            start += 1
            end -= 1
            var startIndex = string.index(string.startIndex, offsetBy: start)
            var endIndex = string.index(string.startIndex, offsetBy: end)
            let range = startIndex...endIndex
            subString = String(string[range])
        }
        
    }
    
    print(length)
    print(subString)
}


finaLongestPalindrom("abcdedcijhabcdedcba")
