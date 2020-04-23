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
        
        var rootNode = Node(value: array[0])

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
    
    func height(_ node: Node?) -> Int {
        guard let node = node else {
            print("\n nil node")
            return 0
        }
        
        print("\(node.value)")
        let leftHeight = height(node.left)
        let rightHeight = height(node.right)
      
        print("\n \(leftHeight)  \(rightHeight) \n")
        
        return 1 + max(leftHeight, rightHeight)
        
    }
    
    func printBFS(_ node: Node?) {
        guard let node = node else {
            return
        }
        
        let height = self.height(node)
        for index in 1...height {
            printLevel(node, index)
        }
        
    }
    
    func printLevel(_ node: Node?, _ level: Int) {
        guard let node = node else {
            return
        }
        
        if level == 1 {
            print("\(node.value)")
        } else {
            printLevel(node.left, level - 1)
            printLevel(node.right, level - 1)
        }
    }
    
}

var testArray = [10, 5, 1, 7, 40, 50, 60]
var obj = Test()
var node = obj.construct(testArray)
print("height = \(obj.height(node))")
obj.printBFS(node)
