
/*
Open -> Public -> Internal -> filePrivate -> Private


Open - can be acceee within OR out of module. Can be sunclassed and overide.

Public -> Same as open, just can't be subclassed OR overide out of module, can be in module but not out

Internal (Default access level) -> When we don't wana expose method from a module, can be used anywhere within same module

Fileprivate -> the functionality defined with a fileprivate access level can only be accessed from within the swift file where it is defined

Private -> Private access restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file
*/


// Private example

// A.swift
class A {
 file var name = "First Letter"
}
extension A {
func printName(){
print(name) // you may access it here from swift 4. Swift 3 will throw error.
}
}
A()
A().name // Error even if accessed from outside the class A{} of A.swift file.
