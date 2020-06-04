
// Example 1

/*
 static and class both associate a method with a class, rather than an instance of a class. The difference is that subclasses can override class methods; they cannot override static methods.
 */

// https://borgs.cybrilla.com/tils/global-vs-static-function-swift/

class MyClass1 {
    
    class var count: Int { // cannot override with a stored property, so make computed
        return 3
    }
    
    func printValue() {
        print(Self.count)
    }
}


class MyClass2: MyClass1 {
    override class var count: Int {
        return 1
    }
}

var obj = MyClass1()
obj.printValue() // 3


var obj2 = MyClass2()
obj2.printValue() // 1
