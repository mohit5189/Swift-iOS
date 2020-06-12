
/*
1- Classes are reference types, while enumerations and structures are value types .

Mutability:

struct is value type, it means if we make object as let then all properties will be immutable, in class it make immutable to object ref only
 */

struct Test {
    var name: String
}

let obj = Test(name: "test")
//obj.name = "mohit" // give error

class Test2 {
    var name: String = ""
}

let obj2 = Test2()
obj2.name = "mohit" // works


//Even when declared as a variable (var), a struct cannot modify itself. and to do so, we need to use mutating keyword. which is not available for classes

struct Cat {
   private var vaccinated:Bool
   init() {
      self.init()
   }
   // Will not work without mutating keyword
   mutating func vaccinate() {
      self.vaccinated = true
   }
}
var cat1 = Cat()
cat1.vaccinate()

/*
 deinit method does not exist for value types. knowing that they are not concerned by reference counting :
 */

struct Cat2 {
   var name:String
   deinit {
   }
}
// Compiler Error : Deinitializers may only be declared within a class

/*
 Generated init
 An option possible only with structs. “Generated init methods” that are based on properties :
 
 struct Cat {
 var name:String
 var age:Int
 }
 let cat1 = Cat(name: "Lucy", age: 3)
 */



/*
 Inheritance
 Also note that only classes supports inheritance :

 
 struct Pet {
      var name:String
 }
 struct Cat : Pet {
 }
 // ERROR : Inheritance from non-protocol type 'Pet'

 */


/*
 enum Pet {
     
     var name:String
 //  error: enums must not contain stored properties
 }

 
 
 Enum
 An enum or enumeration is a data type that allows you to define a list of possible values. If you are a web developer then the easiest way to think of an enum is anywhere you would use a dropdown. A dropdown consists of a limited set of values from which you can choose one.


 */
