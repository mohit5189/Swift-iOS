import UIKit


func search(_ array: [Int], _ number: Int) {
    
    if array.count == 1, array[0] != number {
        print("not found \(number)")
        return
    }
    
    let middle = array.count / 2
    if number > array[middle] {
        search(Array(array[(middle+1)...(array.count - 1)]), number)
    } else if number < array[middle] {
        search(Array(array[0...(middle - 1)]), number)
    } else if number == array[middle] {
        print("found \(number)")
    }
}

var arr = [1,2,3,4,5,6,7,8,9]
search(arr, 2)
