/*=========================
 Common in Struct and class
 =========================*/

/*
 1. Both can have init()
 2. Both can have properties and function
 3. Both support extension
 4. Both can have subscript
 5. Both can confirm protocol
 */

/*=========================
 When use struct
 =========================*/

/*
 1. In multithreaded environment to keep thread safe. We can use class too but need more careful and need to make threadsafe
 2. Struct is faster in memory storage since this store in stack O(1) time, while class in heap O(logn) time. Also with class heap has overhead to maintain retain count as well.
 */

/*=========================
 When use Class
 =========================*/

/*
 1. Where we need inheritence
 2. Classes come with the built-in notion of identity, because they’re reference types. With the identity operator === you can check if two references (variables, constants, properties, etc.) refer to the same object.
 */

/*
 Example 1
 
 Use struct in below case since storing class on heap is more time consuming
 */

struct A {
    var age: Int
}

class A {
    var age: Int
}


/*
 Example 2
 
 Use class in this case, reason:
 
 String is a reference type so it’s contents will be stored on Heap which means that there will be a copy of struct object in each case and also twice the allocation on Heap for String type with more reference counting overhead.
 */

struct B {
    var name: String
    var company: String
    var address: String
}

class B {
    var name: String
    var company: String
    var address: String
}

// NOTE - Use struct only when have one refenrece type, if have may reference type properties, allocation cost will be too much for struct too


/*=================
 Heap
 ===================*/

/*
 While creating class object:
 1- It store address of object in stack
 2- Store information for address in heap
 
 You have to get the address on stack and then find the block of memory on Heap. which is slow.
 
 Whenever an object is created/allocated on Heap, there is a map-search process needed. In essence, the system needs to find an empty slot of memory that is large enough to accommodate object and store the object there. Same for deallocation, system again needs to find the same block of memory and clear it
 */


/*=======================
 Does struct always create on Stack -------- NOOOOOOO--------------- explaind below:
 */


/*
 Example 1 - 1 word memory - will sotre in Stack
 */

struct SomeStruct: SomeProtocol {
    public let int: Int // 1 word memory
}

/*
 Example 2 -> more then 3 mord memory
 
 AnotherStruct which contains more than 3 words of memory will be forced by the system to have it created on the Heap instead of on the Stack.
(Apple WWDC) https://medium.com/@linhairui19/struct-vs-class-understanding-swift-performance-part-2-adfe0eb73d81
 
 */

struct AnotherStruct: AnotherProtocol {
    public let first: Int // 1 word memory
    public let second: Int // 1 word memory
    public let third: Int // 1 word memory
    public let fourth: Int // 1 word memory
    // in total 4 words of memories
}

/*
 Just imagine you have such a struct and it is being passed around the app, in functions, in viewControllers and other places. Every time it is passed, it will create a copy of itself due to its Value-Semantic nature. But we also know that such a struct will always be allocated on Heap and we also know that allocation and deallocation on Heap is expensive. As compared to class, the only thing that is copied when it is passed around is its address (a maximum of 32 bits memory) Thus using struct in this case will greatly hinder your App performance than using a class.
 
 But we have a solution for it which is the Copy-and-Write technique just as stated in the WWDC video of Understanding Swift Performance.

 What it basically does is this
 */

struct AnotherStruct2: AnotherProtocol {
    private class Storage {
        public let first: Int // 1 word memory
        public let second: Int // 1 word memory
        public let third: Int // 1 word memory
        public let fourth: Int // 1 word memory
       // in total 4 words of memories
    }
    public var storage: Storage
}
