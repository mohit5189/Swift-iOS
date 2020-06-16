func firstNonRepeatingCharacter(_ string: String) {
    var map = [Character: Int]()
    for char in string {
        if map[char] != nil {
            var count = map[char]!
            count += 1
            map[char] = count
        } else {
            map[char] = 1
        }
    }
    
    for char in string {
        if map[char] == 1 {
            print("first non repeating char = \(char)")
            break
        }
    }
}
