
// what is output in this case?

var x = 10
var myClosure = { (x)
    print(x)
}
x = 20
myClosure() // Will print 20, updated value
