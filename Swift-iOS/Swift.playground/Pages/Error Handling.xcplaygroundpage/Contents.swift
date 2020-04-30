

/*
 ==========================================
 try vs try? vs try!
 
 
 try -  try is simply a way of dealing with a possible error in any given function. Often times we have functions that “throw”, meaning they have the ability to throw an error
 
 try? - try? let’s us ignore our error and allow them to become nil whenever our function throws them. For this reason, we do not have to wrap our code in a do-catch statement. We do however, have to unwrap our variable if we are ever assigning a try? value to it.
 
 Using try? is helpful when the error that may be thrown is of little importance and we want to avoid assigning any actions to the error that was thrown.
 
 try! -  Lastly we have try!, which operates like a forced-unwrapped optional. This variant basically makes the assertion that although the function has the ability to throw an error, this will never happen because the information we are trying to receive is guaranteed to be there. In other words, try! is used when we know there is no possible way our method will fail, or if this line of code is so fundamental that our whole app might as well crash if there is in fact an error.

 */


/*
 ====================================================================
 Basic Error Handling
 ====================================================================
 */

enum ErrorType: Error {
    case negativeNotAllowed
    case largeNumber
}

enum ErrorType2: Error {
    case negativeNotAllowed
    case largeNumber
}



class Test {
    
    func testError(_ value: Int) throws {
        if value < 0 {
            throw ErrorType.negativeNotAllowed
        } else if value > 100 {
            throw ErrorType.largeNumber
        }
        
        print("no error")
    }
}


var obj = Test()
do {
    try obj.testError(-4) // if use try? then no catch will call
} catch ErrorType.negativeNotAllowed{
    print("error found for negative no")
} catch ErrorType.largeNumber{
    print("error found for large no")
}

do {
    try obj.testError(1000) // if use try? then no catch will call
} catch ErrorType.negativeNotAllowed{
    print("error found for negative no")
} catch ErrorType.largeNumber{
    print("error found for large no")
}



/*
 ====================================================================
 try Example
 ====================================================================
 */

func tryExample() throws {
    throw ErrorType.largeNumber
}

// tryExample() It will terminate since error not caught


// Beloe code will also terminate since we didn't catch required error

/*
do {
    try tryExample() // Will throw exception since we don't handle error
} catch is ErrorType2{
    print("error found")
}
 */
 
// Belo code will work since we catched error

do {
    try tryExample() // Will throw exception since we don't handle error
} catch is ErrorType{
    print("error found ")
}


/*
 ====================================================================
 try? Example
 ====================================================================
 */

func tryOptional() throws -> String {
    throw ErrorType.largeNumber
}

if let value = try? tryOptional() {
    print("value found \(value)")
} else {
    print("Value not found")
}

/*
====================================================================
try! Example
====================================================================
*/


func tryForce() throws -> String{
    return "test"
}
let value = try! tryForce()

print(value)
