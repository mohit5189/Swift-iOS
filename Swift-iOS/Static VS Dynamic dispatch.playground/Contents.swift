// https://medium.com/flawless-app-stories/static-vs-dynamic-dispatch-in-swift-a-decisive-choice-cece1e872d#:~:text=Dynamic%20dispatch%20increases%20language%20expressivity,constant%20amount%20of%20runtime%20overhead.&text=And%20since%20memory%20to%20all,does%20not%20have%20this%20problem.

/*
 Dispatch techniques:
 1. Inline (Fastest)
 2. Static
 3. Virtual
 4. Dynamic (slowest)
 
 It is up to the compiler to decide which dispatch technique should be used, giving preference to Inline and then going down as and when required
 */


/*
 1. Static diapctch is support by value and reference type both bhil;e Dynamic dispatch is support by refereence type only
  
  2. Dynamic dispatch increases language expressivity at the cost of a constant amount of runtime overhead
  
  3. in case of dynamic dispatch, our compiler will have to look inside what we call a witness table, for checking the implementation of that particular method. The compiler needs to determine whether you referring to the superclasses’ implementation or are you referring to the implementation of the subclass. And since memory to all the objects is allocated at runtime, the compiler can only perform that check at runtime.
  
  4. Static dispatch, however, does not have this problem. With this dispatch technique, the compiler knows, at compile-time, which method implementation is to be called for a method.
  
  5. To achieve Dynamic Dispatch, we use inheritance, subclass a base class and then override an existing method of the base class. Also, we can make use of dynamic keyword and we need to prefix it with @objc keyword so as to expose our method to Objective-C runtime
  
  6. To achieve Static Dispatch, we need to make use of final and static as both of them ensures that the class and method cannot be overridden
 */

 /*
  Since dynamic dispatch gives flexibility of overide, Polymorphism, Inheritence etc, but it come at cost
  */

 /*
  1. Value type. e.g struct/enum is Static dispatch
  2. Protocol extension is static dispatch
  3. class extension method is static while class method is dynamic, while method with @objc in class extension is dynamic
  4. Final class methods are all static, so prefer final class
  5. Finally anything if can overide is dynamic
  */
 
 // Example to check class method
 
 class A {
    func test() {
        
    }
 }
 
 extension A {
    func test2() {
        
    }
 }
 
 class B: A {
    // This will give error overriding non-@objc declarations from extensions is not supported
    // add '@objc' to make this declaration overridable
//    override func test2() {
//
//    }
    
    override func test() {
        
    }
 }
 
// https://miro.medium.com/max/1400/1*ElYFjYKzF_67Q5s2N8s2Gg.png
 
