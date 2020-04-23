func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

print(anotherInt) // 3

/*
 Generic Types
 In addition to generic functions, Swift enables you to define your own generic types. These are custom classes, structures, and enumerations that can work with any type, in a similar way to Array and Dictionary.
 */

struct Queue<T> {
    var queueArray: [T] = [T]()
    
    mutating func insert(element: T) {
        queueArray.append(element)
    }
    
    mutating func remove() {
        if queueArray.count > 0 {
            queueArray.remove(at: 0)
        }
    }
    
    func printQueue() {
        print(queueArray)
    }
}

var obj = Queue<Int>() // if use let ---- error-- error: Generics.xcplaygroundpage:37:1: error: cannot
obj.insert(element: 3)
obj.insert(element: 5)
obj.printQueue()
obj.remove()
obj.printQueue()


/*
 ===========================================
            Type Constraints
 ===========================================
 
 Syntex:
 
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
     // function body goes here
 }
 
 Apple example for failed case:
 /
 func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
     for (index, value) in array.enumerated() {
         if value == valueToFind { ----------------------- This will failed since T can be of any type and we can't match
 
             return index
         }
     }
     return nil
 }
 
 
 To fix above issue:
 
 func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
     for (index, value) in array.enumerated() {
         if value == valueToFind {
             return index
         }
     }
     return nil
 }
 */

protocol TestProtocol1 {
    func getvalue() -> Int
}

protocol TestProtocol2 {
    func getvalue() -> Int
}

struct Test1: TestProtocol1 {
    func getvalue() -> Int {
        return 1
    }
}

struct Test2: TestProtocol2 {
    func getvalue() -> Int {
        return 2
    }
}

struct Test<T: TestProtocol1, U: TestProtocol2> {
    func printValues(_ object1: T, _ object2: U) {
        print(object1.getvalue())
        print(object2.getvalue())
    }
}

var testObj = Test<Test1, Test2>()
//testObj.printValues(Test1(), Test1()) // Will give error -- cannot convert value of type 'Test1' to expected argument type 'Test2'
testObj.printValues(Test1(), Test2())


/*
 Associated Types
 
 When defining a protocol, it’s sometimes useful to declare one or more associated types as part of the protocol’s definition. An associated type gives a placeholder name to a type that is used as part of the protocol. The actual type to use for that associated type isn’t specified until the protocol is adopted. Associated types are specified with the associatedtype keyword.
 

 */

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
//    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

var stackObj  = IntStack()
stackObj.push(5)


// With Generics ---- Apple example

struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

/*
Adding Constraints to an Associated Type
You can add type constraints to an associated type in a protocol to require that conforming types satisfy those constraints. For example, the following code defines a version of Container that requires the items in the container to be equatable.
 */

protocol Container2 {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
}




// Where clause apple example

func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {

        // Check that both containers contain the same number of items.
        if someContainer.count != anotherContainer.count {
            return false
        }

        // Check each pair of items to see if they're equivalent.
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }

        // All items match, so return true.
        return true
}


var stack1Obj = Stack<Int>()
var stack2Obj = Stack<String>()

//allItemsMatch(stack1Obj, stack2Obj) // Error - global function 'allItemsMatch' requires the types 'Int' and 'String' be equivalent

allItemsMatch(stack1Obj, Stack<Int>())
