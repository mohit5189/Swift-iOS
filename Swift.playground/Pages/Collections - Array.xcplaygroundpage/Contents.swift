
/* ==============================================================================================
                                            Array
 ================================================================================================
 
 */
// Empty Array
var emptyArray = [Int]()
emptyArray.append(4)
print(emptyArray) // [4]

emptyArray += [5]
print(emptyArray) // [4,5]

emptyArray.insert(2, at: 1)
print(emptyArray) // [4, 2, 5]

// Array with defailt value
var defaultValueArray1 = Array(repeating: 3, count: 5)
print(defaultValueArray1) // [3, 3, 3, 3, 3]

var defaultArray2 = [3,5,6]

// Add Array
var thirdArray = emptyArray + defaultValueArray1 + defaultArray2
print(thirdArray) // [4, 2, 5, 3, 3, 3, 3, 3, 3, 5, 6]

// Check if array empty
if thirdArray.isEmpty {
    print("array is empty")
}

// check Count
print(thirdArray.count) // print 11

// Modifying array
thirdArray[1...2] = [1]
print(thirdArray) // [4, 1, 3, 3, 3, 3, 3, 3, 5, 6]

thirdArray.remove(at: 1)
print(thirdArray) // [4, 3, 3, 3, 3, 3, 3, 5, 6]

thirdArray.removeLast()
print(thirdArray) // [4, 3, 3, 3, 3, 3, 3, 5]

// iterating Array
for number in thirdArray {
    print(number)
}
for (index, number) in thirdArray.enumerated() {
    print("\(index) = \(number)")
}







