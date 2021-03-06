//How do you restrict a protocol such that only a certain set of classes can implement it.

class MyClass {
    
}

class MyClass2 {
    
}

protocol MyProtocol where Self: MyClass {
    func test()
}

/* CODE WILL GIVE ERROR
 
class Test: MyProtocol {
    
}
*/

// Expose protocol methods based on class type

// Solution for exposing method to particular type only

class MyClass<Element> {
    func printText() {
        print("item")
    }
}

extension MyClass where Element == String {
    func printLength(item: Element){
        print(item.count)
    }
}

extension MyClass where Element == Int {
    func increment(item: Element) -> Element {
        return item + 1
    }
}

var obj1 = MyClass<Int>()
print(obj1.increment(item: 5))
//     obj1.printLength(item: "Text") // This will give Error since we accessing String method

