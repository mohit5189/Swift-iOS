//: [Previous](@previous)


func moveNonZeroToLast(_ arr: inout [Int]) {
    var count = 0
    for (index, value) in arr.enumerated() {
        if value != 0 {
            arr[count] = value // fill all non zero values
            count += 1
        }
    }
    
    while (count < arr.count) {
        arr[count] = 0
        count += 1
    }
    
    print(arr)
}

func moveNonZeroToLast2(_ arr: inout [Int]) {
    var count = 0
    for (index, value) in arr.enumerated() {
        if value != 0 {
            var temp = arr[count]
            arr[count] = value
            arr[index] = temp
            count+=1
        }
    }
    
    print(arr)
}

var arr = [3,5,4,3,2,3,3,0,2,0,0,333,3,0]
moveNonZeroToLast(&arr)
var arr2 = [3,5,4,4,6,34,3,0,2,0,0,0,0,1]
moveNonZeroToLast2(&arr2)
var arr3 = [1,1,1,0,0,1,1,0,1,0,0,1,1,0]
moveNonZeroToLast2(&arr3)

