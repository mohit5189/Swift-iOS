import UIKit

/**
 Write a Function that takes 2 Generic Parameters as input and returns the Sum of these Parameters.
 Input 1: "hello", "world"
 Output 1: "helloworld"
 Input 2: 10, 20
 Output 2: 30
 Input 3: 2.4, 3.6
 Output 3: 6.0
 */

protocol Calculatable {
    associatedtype T
    static func add(_ input1: T, input2: T) -> T
}

extension String: Calculatable {
    static func add(_ input1: String, input2: String) -> String {
        return input1 + input2
    }
}

extension Int: Calculatable {
    static func add(_ input1: Int, input2: Int) -> Int {
        return input1 + input2
    }
}

extension Double: Calculatable {
    static func add(_ input1: Double, input2: Double) -> Double {
        return input1 + input2
    }
}

func sum<P: Calculatable>(_ input1: P, input2: P) -> P where P.T == P {
    return P.add(input1, input2: input2)
}

sum("test", input2: "test")
sum(2, input2: 3)
sum(2.2, input2: 3.2)
