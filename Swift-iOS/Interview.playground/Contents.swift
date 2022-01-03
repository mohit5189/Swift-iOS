import UIKit

/**
 Question 1 -> Difference in Struct and Class
 */

/**
 Question 2 - How to check obj1 and obj2 are equal
 */
struct Person {
    var name: String
    var age: Int
    var email: String
}

var obj1 = Person(name: "test", age: 22, email: "test@gmail.com")
var obj2 = Person(name: "test2", age: 32, email: "test2@gmail.com")

/**
 Quesstion 3 -> How to make struct as key if Dictionary.
 */

/**
 Question 4 ->
 What is wrong in following implementation:
 */

/*
struct Person {
    var person: Person
    init(person: Person) {

    }
}
 */

/**
 Question 5 -> Write implementation of Map/Reduce/Filter any one of these
 */

/**
 Question 6 -> Issue with code below

 // Output - 1,5,2 - it will stop during sync execution
 */

func test() {
    DispatchQueue.main.async {
        print("1")
        DispatchQueue.main.async {
            print("2")
            DispatchQueue.main.sync {
                print("4")
            }
        }
        DispatchQueue.main.async {
            print("3")
        }
    }
    DispatchQueue.main.async {
        print("5")
    }
}

/**
 Question 7 -> DS
 */
/*
 Given an array of integers, and a number ‘sum’, find the number of pairs of integers in the array whose sum is equal to ‘sum’.

 Examples:

 Input  :  arr[] = {1, 5, 7, -1},
           sum = 6
 Output :  2
 Pairs with sum 6 are (1, 5) and (7, -1)

 Input  :  arr[] = {1, 5, 7, -1, 5},
           sum = 6
 Output :  3
 Pairs with sum 6 are (1, 5), (7, -1) &
                      (1, 5)
 */



/**
 Search element in sorted rotated array
 [4,5,6,7,8,1,2,3]
 */
