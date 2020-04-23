//: [Previous](@previous)

class A {
let b: B
init() {
b = B()
b.closure = foo
}

func foo() { }
}

class B {
var closure: (() -> Void)?
}
