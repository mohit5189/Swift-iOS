
class A {
    
    func Test() {
        let b = B()
        b.aInstance = self
    }
    
    deinit {
        print("A dinit called")
    }
}

class B {
    var aInstance: A?
    
    deinit {
        print("B dinit called")
    }
}

var a: A?
a = A()
a?.Test()

// Question 1 - What if we don't set nil to A

// Answer - will print "B dinit called" because b scope is function only


// Question 2 - What if we set a to nil
a = nil

//Answer -  Above will print, B first then A
/*
 B dinit called
 A dinit called
 */
