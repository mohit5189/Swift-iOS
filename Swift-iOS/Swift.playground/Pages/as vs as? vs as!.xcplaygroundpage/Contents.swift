/*
 
 as - As operator is used to convert one type to another when compiler is guaranteeing the success of desired cast. With this operator, the source and destination are convertible to each other, and if not compiler will produce an error asking to avoid the incompatible cast.

However, if you really want to force cast, you can use optional cast operators as? or as! which will produce successful casted value if cast is successful, otherwise will produce nil value and cause crash respectively.
 
 */

// var x = "hello" as Double // WIll give compile warning

// var x = "hello" as! Double // WIll give runtime crash

// var x = "hello" as? Double // WIll avoid crash
