// Pangram string - which contains all characters (a-z)

func isPangram(_ str: String) -> Bool {
    var charSet = Set<Character>()
    
    for char in str.lowercased() {
        if char >= "a", char <= "z" {
            charSet.insert(char)
        }
    }
    
    return charSet.count == 26
}

func missingPangramChar(_ str: String) -> [Character] {
    var charMap = [Character : Bool]()
    var missedChars = [Character]()
    
    for char in "abcdefghijklmnopqrstuvwxyz" {
        charMap[char] = true
    }
    for char in str.lowercased() {
        charMap[char] = false
    }
    
    for (key, value) in charMap {
        if value {
            missedChars.append(key)
        }
    }
    
    return missedChars
}

var value1 = isPangram("abcdefghiJKLMNOPQRSTUVwxyz")
var value2 = isPangram("abcdefghiJKLMNOPQRSTUVwxzz")
var missed = missingPangramChar("abcdefghiJKLMNOPQRSTUVwxzz")
