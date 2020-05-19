
/*
 Map, Reduce and Filter are often called higher-order functions, because these functions take a function (a closure) as input and return functions as output. Strictly speaking, Swift will return the results of an operation (i.e. a mapped array) when using higher-order functions, whereas a “pure” functional language will return a collection of functions
 
 The map function loops over every item in a collection, and applies an operation to each element in the collection

 */

// Example 1 - return another array by multiplying each element by 2

var mapArray1 = [1,2,3,4,5,6,7,8,9]
var mapArray2 = mapArray1.map { $0 * 2 }
print(mapArray2)


// Extended version of above function

var mapArray3 = mapArray1.map ({(value: Int) -> Int in
    return value * 2
})

var mapArray4 = mapArray1.myMap ({(value: Int) -> Int in
    return value * 2
})

print(mapArray4)

// Writing own map function

extension Array {
    public func myMap(_ closure: (Element) -> Element) -> [Element] {
        var mappedArray: [Element] = []
        for num in self {
            mappedArray.append(closure(num))
        }
        return mappedArray
    }
}
