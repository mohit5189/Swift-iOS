//: [Previous](@previous)

extension Array {
    func enumerate(callback: (Element, Int, inout Bool) -> Void) {
        var stop = false
        for (index, item) in self.enumerated() where stop == false {
            callback(item, index, &stop)
        }
    }
}

var arr = [1,2,3,4,5,6]
arr.enumerate{ (item, index, stop) in
    print(item)
    if item == 5 {
        stop = true
    }
}
