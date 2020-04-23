
var t1 = (1,2)

switch t1 { // will print case 2
case (1,0):
    print("case 1")
case (1, _):
    print("case 2")
default:
    print("default")
}

switch t1 { // will print case 2 2
case (1,0):
    print("case 1")
case (1, let x):
    print("case 2 \(x)")
default:
    print("default")
}


switch t1 { // will print case 1
case let (x,y) where x == y-1:
    print("case 1")
case let (x, y) where x == y:
    print("case 2 \(x)")
default:
    print("default")
}

switch t1 { // will print case 1 \n case 2 1
case let (x,y) where x == y-1:
    print("case 1")
    fallthrough
case let (x, y) where x == y:
    print("case 2 \(x)")
default:
    print("default")
}

switch t1 { // will print case 1 \n case 2 1 \ n default
case let (x,y) where x == y-1:
    print("case 1")
    fallthrough
case let (x, y) where x == y:
    print("case 2 \(x)")
    fallthrough
default:
    print("default")
}



