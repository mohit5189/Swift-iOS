
func increment(value: Int) -> Int {
    return value + 1
}

print(increment(value: 2))

// using _

func increment2(_ value: Int) -> Int {
    return value + 1
}

print(increment2(2))

// multiple return values
func multipleIncrement(_ value1: Int, _ value2: Int) -> (Int, Int) {
    return(value1 + 1, value2 + 1 )
}
print(multipleIncrement(1,1)) // (2,2)

// default values

func increment3(_ value: Int = 1) -> Int {
    return value + 1
}

print(increment3())

/*
 ======================================================
 Variadic Parameters
 ======================================================
 
 A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters (...) after the parameter’s type name.

 */
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers


// Inoput Parameters
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


/*
======================================================
Function type
======================================================
*/

var incrementFunction: (Int) -> Int = increment2 // we define function variable
print(incrementFunction(2))

// we can assign to other variable too
var test = incrementFunction


// Passing function to function

func testFunc( _ increamentFunction: (Int) -> Int) -> Int {
    return incrementFunction(2)
}

print(testFunc(incrementFunction)) // you need to pass variable

// return function

func returnTest() -> (Int) -> Int {
    return increment2
}

print(returnTest()(2)) // print 3



/*
 Nested Functions
 */

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
// stepForward(input: 2) -- can't call direct
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!

