protocol Indentifiable {
    associatedtype ID
    func indentifier() -> ID
}

protocol PersonProtocol: Indentifiable {
    var name: String { get }
    var age: Int { get }
}

struct Person: PersonProtocol {
    let name: String
    let age: Int
    func indentifier() -> String {
        return "\(name)_\(age)"
    }
}

struct Person2: PersonProtocol {
    let name: String
    let age: Int
    func indentifier() -> Int {
        return 1
    }
}

struct Car <T: PersonProtocol> where T.ID == String {
    let owner: T
    init(owner: T) {
        self.owner = owner
    }

    func getID() -> String {
        return owner.indentifier()
    }
}

var obj = Car<Person2>()


// Define a generic protocol where few method are available in all class that confirm to protocol and a particular method available only to specific class



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

var obj2 = MyClass<String>()
obj2.printLength(item: "hello")

obj1.printText()
obj2.printText()
