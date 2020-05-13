
/*
 Closure with return type
 */

func checkEnum(myClosure: (Int) -> Bool) {
   print(myClosure(4))
    print(myClosure(5))
}

checkEnum{ num in
    if num % 2 == 0 {
        return true
    }
    return false
}

/*
 Write array closure to iterate values in array. Cancel when return false.
 */


extension Array {
    func iterate(closure: (Element) -> Bool) {
        for i in self {
            print(i)
            if closure(i) == false {
                break
            }
        }
    }
}

var arr = [1,2,3,4,5,6,7,8,9,10]
arr.iterate { num in
    if num == 5 {
        return false
    }
    return true
}

/*
 Auto closure :
 
 A closure which is marked with @autoclosure keyword is known as autoclosure. @autoclosure keyword creates an automatic closure around the expression by adding a {}. Therefore, you can omit braces {} when passing closures to a function.

 */


func testAutoClosure(block: @autoclosure () -> Void) {
    print("hello")
}

testAutoClosure(block: ())

// With return type


func testAutoClosure2(_ block: @autoclosure () -> String) {
    print(block())
}

testAutoClosure2("hello return")

// with param and return type

/*
// argument type of @autoclosure parameter must be, we can not pass argument params in autoclosure

*/

//func testAutoClosure3(block: @autoclosure (String) -> (String)) {
//    print(block())
//}

//testAutoClosure3(block: ("hello return"))

