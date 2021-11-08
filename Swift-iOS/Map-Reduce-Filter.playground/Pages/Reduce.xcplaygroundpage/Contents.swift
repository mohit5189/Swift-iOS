/*
 The reduce function loops over every item in a collection, and combines them into one value

 */

// Sum of all number in array
var array = [1,2,3,4,5,6]
var sum = array.reduce (0,+) // first element is default value, second is closure. We use + which will treat like closure
print(sum)

// Expended version
var sum2 = array.reduce(1) { $0 + $1 }
print(sum2)

// More expended

var sum3 = array.reduce(0) { (result: Int, num: Int) -> Int in
    return result + num
}

print(sum3)


var sum4 = array.myReduce(0) { (result: Int, num: Int) -> Int in
    return result + num
}
print(sum4)

// Reduce custom
extension Array {
    public func myReduce(_ initialValue: Element, _ closure: (Element, Element) -> Element) -> Element {
        var result = initialValue
        for num in self {
            result = closure(result, num)
        }
        return result
    }
}
