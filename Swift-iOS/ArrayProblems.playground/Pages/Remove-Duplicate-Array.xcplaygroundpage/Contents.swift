//: [Previous](@previous)


// Remove without considering order
var arrayWithSuplicate = ["mohit", "mohit"]
var removeDuplicateSet = Set(arrayWithSuplicate)


// remove by keeping order in mind, from sorted array

func sortArray(_ arr: inout [Int]) {
    var j=0
    for index in 0..<arr.count - 1 {
        if arr[index] != arr[index + 1] {
            arr[j] = arr[index]
            j += 1
        }
    }
    
    // Put last number that was missed in loop
    arr[j] = arr[arr.count - 1]
  
    // remove last numbers
    while arr.count > j + 1 {
        arr.removeLast()
    }
    print(arr)
}
var arr = [1,1,2,2,3,3,4]
sortArray(&arr)


// Unsorted array

func unSortArray(_ arr: inout [Int]) {
    var map = [Int: Bool]()
    var finalArray = [Int]()
    for num in arr {
        if map[num] == nil {
            finalArray.append(num)
            map[num] = true
        }
    }
    
    print(finalArray)
}

var arr2 = [1,1,2,2,3,3,4]
unSortArray(&arr2)
