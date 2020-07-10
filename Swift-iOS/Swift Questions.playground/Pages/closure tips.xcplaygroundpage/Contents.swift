
// what is output in this case?

var x = 10
var myClosure = {
    print(x)
}
x = 20
myClosure() // Will print 20, updated value


var x2 = 10
var myClosure2 = { (x2)
    print(x2)
}
x2 = 20
myClosure2() // Will print 20, updated value


var x3 = 10
var myClosure3 = { [x3] in
    print(x3)
}
x3 = 20
myClosure3() // Will print 10, updated value

var x4 = 10
var myClosure4 = { [x4] in
    x4 = 20 // Error, x4 in this case is immutable
}
myClosure4() // Will print 10jkioJ,K.     .,MNBVÍ, updated value

// Note we can capture as many element we want by coma separated

// link https://marcosantadev.com/capturing-values-swift-closures/
