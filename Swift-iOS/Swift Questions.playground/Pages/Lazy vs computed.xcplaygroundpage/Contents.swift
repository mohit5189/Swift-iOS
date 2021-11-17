
// Q - Does lazy and computed call every time when we access

// Lazy example
// Call just once

class Lazy {
    lazy var x: [Int] =  {
        print("lazy called")
        return [1,2]
    }()
    
    func test() {
        var y = x
        var z = x
    }
}

Lazy().test()
