
// Find missing number in an array from 1-100


// Find Only 1 missing number from array 1 to n

// Fopr sum from 1 to n, formula is sum = n*(n+1) / 2, so we can substract total from expected sum
func printMissing(array: [Int], length: Int) {
    let total = length * (length + 1) / 2
    var sum = 0
    for num in array {
        sum += num
    }
    print("missing number = \(total - sum)")
}

printMissing(array: [1,2,4,3,5,6,7], length: 8)


// Above can create overflow of integer while calculating sum, if number are very large



// Missing from sorted array
func printMissingSorted(array: [Int]) {
    var sum = 0
    for i in 0..<array.count {
        if array[i] != i+1 {
            print("missing number = \(i+1)")
            break
        }
    }
}

printMissingSorted(array: [1,2,4,5,6,7])

// Can use map as well
