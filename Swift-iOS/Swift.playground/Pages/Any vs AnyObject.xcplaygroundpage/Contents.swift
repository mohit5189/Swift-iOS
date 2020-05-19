
/*
 1- Any -> To hold any type
 2- AnyObject -> To hold class object
 */


var anyExample: [Any] = [1,2,"hello"]
print(anyExample)
// var anyObjectExample: [AnyObject] = [1,2,"hello"] // error - cannot convert value of type 'Int' to expected element type 'AnyObject'

var anyObjectExample: [Any] = [1 as! AnyObject,2 as! AnyObject,"hello" as! AnyObject]
print(anyObjectExample) // will print hello without quotes.

// -- It user NSString and NSNumber class in above case typecasting

/*
 It is of type String! Then how could it be casted to AnyObject? Again, Strings in Swift are Structs, not Class types. Thus in theory, I shouldn’t be able to cast them as AnyObject.

 */

