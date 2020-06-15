//: [Previous](@previous)

/*
 Given an array of integers, and a number ‘sum’, find the number of pairs of integers in the array whose sum is equal to ‘sum’.

 Examples:

 Input  :  arr[] = {1, 5, 7, -1},
           sum = 6
 Output :  2
 Pairs with sum 6 are (1, 5) and (7, -1)

 Input  :  arr[] = {1, 5, 7, -1, 5},
           sum = 6
 Output :  3
 Pairs with sum 6 are (1, 5), (7, -1) &
                      (1, 5)
 */

func pairs(_ arr: [Int], _ sum: Int) -> Int {
    var map = [Int:Int]()
    var totalPairs = 0
    for value in arr {
        if let count = map[value] {
            map[value] = count + 1
        } else {
            map[value] = 1
        }
    }
    
    for value in arr {
        if map[sum - value] != nil {
            print("\(value) + \(sum - value)")
            totalPairs += 1
        }
        
        if sum - value == value { // To svoid case like for sum 10 we will have only one key 5 then this logic required
            totalPairs -= 1
        }
    }
    
    return totalPairs / 2 // to avoid combination like 5,7 and 7,5
}

var arr = [1, 5, 7, -1]
let pair = pairs(arr, 12)
