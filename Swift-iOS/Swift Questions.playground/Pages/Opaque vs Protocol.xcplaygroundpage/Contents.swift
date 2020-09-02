// https://www.hackingwithswift.com/articles/187/how-to-use-opaque-return-types-in-swift-5-1
// Lets take one example


protocol Plane {
}

struct Xplane: Plane {
}


struct Yplane: Plane {
}

    func getPlaneProtocol(_ value: Int) -> Plane {
        value == 1 ? Xplane() : Yplane() // This will work
    }
    
/*
 From the caller’s perspective that still gets back a Fighter, which might be an XWing, a YWing, or something else that conforms to the Fighter protocol. But from the compiler’s perspective it knows exactly what is being returned, so it can make sure we follow all the rules correctly.

 */
    func getPlaneOpaque(_ value: Int) -> some Plane {
     //   value == 1 ? Xplane() : Yplane() // This will give error, since with some type swift strictly allow only one type return
        
        Xplane() // this will work
    }



//================================= Summary ==========================

/*
1. With protocol, a method can return any type which confirm to particular protocol, So let's assume case of "Equalable" protocol, String and Int both confirm to this, so if a method return randomely String and Int, Although both are same but it doesn't mean that we can perform == operation on them.
 
 2. This problem solved by opaque type, it force to return only one time, so compiler can optimise and is aware about this. SO when performing equalable (assume 2 method return equalable, but one return string and another integer), compiler will gove error
 
 
 Example if you return Equatable protocol from method, it will first give error "Protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements"
 
 Reason - It has defined associated type, any protocol with associated type can be used as generic only
 

 
 */
