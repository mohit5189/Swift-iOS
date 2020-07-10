struct Person: CustomStringConvertible {
    fileprivate var name: String = ""
    fileprivate var age: Int = 0
    
    var description: String {
        return ("name \(name) age \(age)")
    }
}

protocol PersonUpdater: class {
    var data: Person {get set}
    func update()
}

extension PersonUpdater {
    func update() {
        data.name = "mohit"
        data.age = 30
    }
}

class PersonUpdateClass {
    private var _data: Person = Person()
}

extension PersonUpdateClass: PersonUpdater {
    var data: Person {
        get {
            return _data
        }
        set {
            print(newValue.description)
            _data = newValue
        }
    }
}

PersonUpdateClass().update()

// output name mohit age 0
// name mohit age 30

