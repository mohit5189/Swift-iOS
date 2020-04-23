
// Usecase 1
var unSortedArray = [3,5,2,6,77,22,44,55,66]
func sortFunction(left: Int, right: Int) -> Bool {
    return left > right
}
var sortedArray = unSortedArray.sorted(by: sortFunction)

// changes using closure

var sortedArray2 = unSortedArray.sorted(by: {(left: Int, right: Int) -> Bool in
    return left > right
} )

/*
 Inferring Type From Context
 Because the sorting closure is passed as an argument to a method, Swift can infer the types of its parameters and the type of the value it returns. The sorted(by:) method is being called on an array of strings, so its argument must be a function of type (Int, Int) -> Bool. This means that the (Int, Int) and Bool types do not need to be written as part of the closure expression’s definition. Because all of the types can be inferred, the return arrow (->) and the parentheses around the names of the parameters can also be omitted:

 */
var sortedArray3 = unSortedArray.sorted(by: {left, right in return left > right})
print(sortedArray3)

/*
 Implicit Returns from Single-Expression Closures
 Single-expression closures can implicitly return the result of their single expression by omitting the return keyword from their declaration, as in this version of the previous example:

 --------- we don't need return for single line function
 */

var sortedArray4 = unSortedArray.sorted(by: {left, right in left > right})

/*
 Shorthand Argument Names
 Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on
 */

var sortedArray5 = unSortedArray.sorted(by: { $0 > $1 })
print(sortedArray5)

/*
 Operator Methods
 */
var sortedArray6 = unSortedArray.sorted(by: >)
print(sortedArray6)


/*
 =============================================================
 Passing closure to function
 ============================================================
 */

func testClosure1(completion: (Int) -> Void ) {
    completion(1)
}

testClosure1{ value in // No need to write Completion here
    print("closure complete \(value)")
}

func testClosure(value: Int, completion: (Int) -> Void ) {
    completion(value)
}

testClosure(value: 5, completion: { value in
    print("closure complete \(value)")
})


/*
 AutoClosure
 
 An autoclosure is a closure that is automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it. This syntactic convenience lets you omit braces around a function’s parameter by writing a normal expression instead of an explicit closure.


 */

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"


// With autoclosure
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"

