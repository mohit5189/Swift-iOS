//: [Previous](@previous)


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

// input - 1qqq@ , output - qqq
func removeNonCharacterFromString(_ str: String) -> String {
    var chars = [Character]()
    for char in str.lowercased() {
        if char >= "a", char <= "z" {
            chars.append(char)
        }
    }
    return String(chars)
}

// input - abcde , abcfg - - outoput - defg
func foundDifferentCharacters(string1: String, string2: String) {
    var set1 = Set<Character>()
    var set2 = Set<Character>()

    for char in string1 {
        set1.insert(char)
    }
    for char in string2 {
        set2.insert(char)
    }

    set1.symmetricDifference(set2)
}

// remove extra parenthasis "((())" -> "(())", ")(a)()" -> (a)()
func removeExtraParenthasis(_ value: inout String) -> String {
    var stack = [String.Index]()
    for index in value.indices {
        if value[index] == "(" {
            stack.append(index)
        } else if value[index] == ")" {
            if stack.count == 0 || value[stack.last!] == ")"{ // close bracket should remove in this case
                print("insert )")
                stack.append(index)
            } else {
                print("pop (")
                stack.removeLast()
            }
        }
    }
    return value.removeCharacters(at: stack)
}

extension String.Index {
  func distance<S: StringProtocol>(in string: S) -> Int { string.distance(from: string.startIndex, to: self) }
}
extension String {
  mutating func removeCharacters(at indexs: [String.Index]) -> String {
    var offSet = 0
    for item in indexs.map({ $0.distance(in: self) }) {
      remove(at: index(startIndex, offsetBy: item - offSet))
      offSet += 1
    }
    return self
  }
}



var value1 = isPangram("abcdefghiJKLMNOPQRSTUVwxyz")
var value2 = isPangram("abcdefghiJKLMNOPQRSTUVwxzz")
var missed = missingPangramChar("abcdefghiJKLMNOPQRSTUVwxzz")
var stringValue = "333qqq$r"
var charString = removeNonCharacterFromString(stringValue)
foundDifferentCharacters(string1: "abcdef", string2: "fghia")
var p = "(((aa(bb))))"
var string1 = removeExtraParenthasis(&p)
//var string2 = removeExtraParenthasis(")((a))")

