//: [Previous](@previous)


/*
 
 ARC
 
 ARC is a compile time feature that is Apple's version of automated memory management. It stands for Automatic Reference Counting. This means that it only frees up memory for objects when there are zero strong references to them.
 
  - Non class type can not be marked as weak
  - UIBUtton -> UIControl -> UIVIew -> UIResponder -> NSObject
  - Property default - atomic,readwrite,strong / assign (for non class)
 
 Method Swizling
 
------------- Swizzling should always be done in +load.
 ------------- Swizzling should always be done in a dispatch_once.



 There are two methods that are automatically invoked by the Objective-C runtime for each class. +load is sent when the class is initially loaded, while +initialize is called just before the application calls its first method on that class or an instance of that class. Both are optional, and are executed only if the method is implemented.

 
 */
