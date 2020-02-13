/*
 Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval. For example, you access elements in an Array instance as someArray[index] and elements in a Dictionary instance as someDictionary[key].
 */

//subscript(index: Int) -> Int {
//    get {
//        // Return an appropriate subscript value here.
//    }
//    set(newValue) {
//        // Perform a suitable setting action here.
//    }
//}


class Multiplier {
    subscript(value: Int, multiplyBy: Int) -> Int{
        get {
            return value * multiplyBy
        }
    }
}

var multiplier = Multiplier()

print(multiplier[5,6])


// Optional chaining

class TestOptional {
    var name: String
    
    init() {
        name = "MOHIT"
    }
}

class TestOptional2 {
    var age: Int
    var testOptional = TestOptional()
    
    init() {
        age = 12
    }
}


class Test {
    var testOptional: TestOptional2?
    
    init() {
        testOptional = TestOptional2()
    }
}

var obj = Test()
print(obj.testOptional?.testOptional.name) // SINCE testOptional.name IS NOT OPTIONAL, no need of ?
