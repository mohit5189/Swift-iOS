
/*
 from https://blog.usejournal.com/swift-performance-tips-55dc5688808b#:~:text=Structs%20vs%20Classes%20(When%20to,objects%20are%20stored%20on%20heap.&text=Struct%20object%20is%20allocated%20on,was%20much%20faster%20than%20Heap.
 
 
 Method Dispatch (Static vs Dynamic)
Next thing you would want to infer is whether my method will be statically or dynamically dispatched. Dynamic dispatch is costly as it has to implement a vTable or witnessTable but at the same time we also want to achieve dynamism in our code.


Use Protocol Oriented Programming over Inheritance

Inheritance uses dynamic dispatch where as if you write a method in a Protocol extension it is statically dispatched. Methods with Protocol types are also dynamically dispatched. Protocols allow us to define methods with either static or dynamic dispatch. Protocol extensions are not bound to single inheritance.


Use Generics
Generics gives you the power of polymorphism without dynamic dispatch. Example:
Generic specialization creates a type specific version of method. If Generic implementation is a struct you can also get allocation on Stack with no reference counting if there are no reference semantics involved. You can get the power of Polymorphism even by allocating objects on Stack.


Use Final classes
Use Final when you are sure about the class not being inherited any where in the project. All methods become statically dispatched when a class is Final.


Use private and fileprivate
Applying the private or fileprivate keywords restricts the visibility of the declaration to the file . Thus the absence of any such declarations enables the compiler to infer the final keyword automatically and remove indirect calls.


Use Enums over Strings
Enums are allocated on the Stack whereas Strings are allocated on Heap. Enums do not incur a reference type like Strings. Enums are also type safe.
 
 */
