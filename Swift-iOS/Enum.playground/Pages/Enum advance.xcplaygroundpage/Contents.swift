
/*
 How .rawvalue works in enum?
 */

/*
 1. A Swift enum can either have raw values or associated values.
 */

/*
 ============================================================
 By default enum start with 0
 =============================================================
 */

enum Test: Int {
    case one
    case two
}

print(Test.one.rawValue) // 0


/*
============================================================
How enum with defined type detect wrong datatype inside enum
=============================================================
 
 public protocol RawRepresentable {
     associatedtype RawValue
     init?(rawValue: Self.RawValue)
     var rawValue: Self.RawValue { get }
 }
 
 defining :DataType, set RawValue to particular type, ENum don't support inheritence,
 
 if we mentions :Int then it mean all data type is of Int type. This is by using associatedType.
 
*/


enum Test2: Int, RawRepresentable {
    case one
    case two //  = "two" --------- this will give error declares raw type 'Int', but does not conform to RawRepresentable and conformance could not be synthesized
}


/*
 ============================================================
 Define struct as enum type
 =============================================================

 https://andybargh.com/custom-enumeration-raw-values/
 */

struct MyStruct: ExpressibleByStringLiteral, Equatable {
    var name: String
    
    public init(stringLiteral value: String) {
        name = value
    }

    public static func == (lhs: MyStruct, rhs: MyStruct) -> Bool {
        return (lhs.name == rhs.name)
    }

    var rawValue: String {
        return name
    }
    
}


enum StructTest: MyStruct {
    case struct1 = "Test"
    case struct2 = "mohit kumar"
}

print(StructTest.struct1.rawValue)
