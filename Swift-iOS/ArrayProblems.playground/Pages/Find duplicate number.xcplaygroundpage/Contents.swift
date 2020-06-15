
func printDuplicate(_ array: [Int]) {
    var map = [Int: Int]()
    for num in array {
        if map[num] == 1 {
            print(num)
        } else {
            map[num] = 1
        }
    }
}

printDuplicate([1,2,2,4,5,5,6])
