// What is wrong

/*
 Below approach is wrong, because in init method it expect A instance, so when passing A instance that will again ask for A instance. This create recursive issue.
 */
struct A {
    init(a: A) {
    }
}

//var a = A(a: A(a: A())) // Its recirsive here




/*
 Another example for recursive, We can not create stored property of same type
 */

struct B {
    var b: B // Recursive property not allowed
    init(b: B?) {
    
    }
}


// Correct example that is not correct but can be handle without compilation error

struct B {
    init(b: B?) {
    
    }
}

var b = B(b: nil)
