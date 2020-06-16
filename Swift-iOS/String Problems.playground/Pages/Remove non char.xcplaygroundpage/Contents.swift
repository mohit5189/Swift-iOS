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
