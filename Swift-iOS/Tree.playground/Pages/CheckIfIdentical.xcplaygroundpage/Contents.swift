//: [Previous](@previous)

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
    
}

func checkIfIdentical(_ root1: Node?, _ root2: Node?) -> Bool {
    guard let node1 = root1, let node2 = root2 else {
        return true
    }
    
    return (node1.value == node2.value && checkIfIdentical(node1.left, node2.left) && checkIfIdentical(node1.right, node2.right))
    
}

var testArray = [10, 5, 1, 7, 40, 50, 60]
var testArray2 = [10, 5, 1, 7, 40, 50, 60, 70]
var obj1 = Test()
var obj2 = Test()
var node1 = obj1.construct(testArray)
var node2 = obj2.construct(testArray2)

var identical = checkIfIdentical(node1, node2)
