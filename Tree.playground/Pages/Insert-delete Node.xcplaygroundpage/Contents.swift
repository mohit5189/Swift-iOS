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
    
    @discardableResult
    func insertValue(_ root: Node?, _ value: Int) -> Node {
        guard let node = root else {
            return Node(value: value)
        }
        
        if value < node.value {
            node.left = insertValue(node.left, value)
        } else if value > node.value {
            node.right = insertValue(node.right, value)
        }
        return node
    }
    
    /*
     1. if not child just delete
     2. if one child just use tem variable to delete, swap value
     3. if 2 child find inorder successor and swap and delete successor
     */
    @discardableResult
    func deleteNode(_ root: Node?, _ value: Int) -> Node? {
        guard let root = root else {
            return nil
        }
        print("delete node root \(root.value)")
        if value < root.value {
            root.left = deleteNode(root.left, value)
        } else if value > root.value {
            root.right = deleteNode(root.right, value)
        } else { // if node found
            if root.left == nil { // with one child OR no only
                let temp = root.right
                return temp
            } else if root.right == nil {
                let temp = root.left
                return temp
            }
            // handle with 2 child
            let temp = minSuccessor(root.right)
            root.value = temp.value
            root.right = deleteNode(root.right, temp.value)
        }
        return root
    }
    
    func minSuccessor(_ node: Node?) -> Node {
        var nodeCopy = node
        while nodeCopy?.left != nil {
            nodeCopy = nodeCopy?.left
        }
        return nodeCopy!
    }
    
    func preOrder(_ node: Node?) {
        guard let node = node else {
            return
        }
        
        print("\t \(node.value)")
        preOrder(node.left)
        preOrder(node.right)
    }
}

var testArray = [10, 5, 1, 7, 40, 50, 60]
var obj = Test()
var node = obj.construct(testArray)
obj.insertValue(node, 15)
obj.insertValue(node, 45)
obj.preOrder(node)
obj.deleteNode(node, 40)
obj.preOrder(node)

//: [Next](@next)
