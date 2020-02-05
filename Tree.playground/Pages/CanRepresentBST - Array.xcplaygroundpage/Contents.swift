//: [Previous](@previous)

import Foundation

// =========PreOrder ============

// we make root only if get big element then stacks element, once we have root, we should never have any element bigger than root
func canRepresentBST(_ array: [Int]) {

    var stack = [Int]()
    
    var root = INT8_MIN
    
    for item in array {
        
        if item < root {
            print("\(array)   -  False")
            return
        }
        
        while stack.count != 0, stack[stack.count - 1] < item {
            root = Int32(stack[stack.count - 1])
            print("root = \(root),   Item = \(item)")
            stack.popLast()
        }
        stack.append(item)
    }
    
    print("\(array)   -  True")
}

canRepresentBST([10,8,5,2,12,15,16,11])
canRepresentBST([2, 4, 3])
canRepresentBST([2, 4, 1])

//: [Next](@next)
