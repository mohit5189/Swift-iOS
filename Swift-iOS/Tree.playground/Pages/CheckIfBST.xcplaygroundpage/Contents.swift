//: [Previous](@previous)

import Foundation

import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class Test {
    func construct(_ array: [Int]) -> Node? {
        
        if array.count <= 0 {
            return nil
        }
        
        let rootNode = Node(value: array[0])

        if array.count == 1 {
            return rootNode
        }
        
        var rightIndex = 0
        
        for number in array {
            if number <= rootNode.value {
                rightIndex += 1
            }
        }
        
        if (rightIndex - 1) >= 1 { // to avoid crash situation
            let leftArray = array[1...(rightIndex - 1)]
            rootNode.left = construct(Array(leftArray))
        }

        if (array.count - 1) >= rightIndex {
            let rightArray = array[rightIndex...(array.count - 1)]
            rootNode.right = construct(Array(rightArray))
        }
        
        return rootNode
    }
    
    func checkIfBST(_ node: Node?, _ min: Int, _ max: Int) -> Bool {
        guard let node = node else {
            return true
        }
        
        if node.value < min, node.value > max {
            return false
        }
        
        return checkIfBST(node.left, min, node.value - 1) && checkIfBST(node.right, node.value + 1, max)
    }
}

var testArray = [10, 5, 1, 7, 40, 50, 60]
var obj = Test()
var node = obj.construct(testArray)
print("\(obj.checkIfBST(node, Int(INT8_MIN), Int(INT8_MAX)))")
//: [Next](@next)
