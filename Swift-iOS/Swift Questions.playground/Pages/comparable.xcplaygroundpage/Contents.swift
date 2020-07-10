struct Person: Comparable {
    var name: String

    static func <(lhs: Person, rhs: Person) -> Bool {
        print(lhs.name)
        print(rhs.name)
        print("--------------")
        return lhs.name < rhs.name
    }
}

let taylor = Person(name: "Taylor Swift")
let justin = Person(name: "Justin Bieber")

var array = [taylor, justin]
print(array.sorted())
print(taylor < justin)

