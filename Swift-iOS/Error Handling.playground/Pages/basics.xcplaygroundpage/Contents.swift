



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


