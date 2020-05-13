

// Example 1
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// Example 2
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

/* associated values*/

enum AssociatedEnum {
    case value(Int, Int)
    case valueString(String) // We can't keep same name different param here, if do so then it will fail during switch execution ----- tuple pattern cannot match values of the non-tuple type 'String'
}

var objEnum = AssociatedEnum.valueString("test")

//switch objEnum {
//case let .value(_, _):
//    print("integer found")
//case let .valueString(value):
//    print("String found")
//}


// Raw value
enum RawEnum: Int {
    case first = 1
    case second = 2
    case third
}

var value = RawEnum.third.rawValue // It will make 3 by default

enum RawEnum2: Int {
    case first = 1
    case second = 5
    case third
}

var value2 = RawEnum2.third.rawValue // It will make 6 by default

// Making enum with raw value
var obj = RawEnum2(rawValue: 6) // will pick third

var obj2 = RawEnum2(rawValue: 7) // will pick nil
