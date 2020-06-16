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
