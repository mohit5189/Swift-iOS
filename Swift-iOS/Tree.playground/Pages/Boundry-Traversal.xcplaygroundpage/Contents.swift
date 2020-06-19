//: [Previous](@previous)

/*
 We break the problem in 3 parts:
 1. Print the left boundary in top-down manner.
 2. Print all leaf nodes from left to right, which can again be sub-divided into two sub-parts:
 …..2.1 Print all leaf nodes of left sub-tree from left to right.
 …..2.2 Print all leaf nodes of right subtree from left to right.
 3. Print the right boundary in bottom-up manner.
 */
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
    
    
    
    func printBoundries(_ node: Node?) {
        guard let node = node else {
            return
        }
        
        print(" \(node.value)")
        
        printLeftBoundries(node.left)
        
        printLeaves(node.left)
        
        printLeaves(node.right)
        
        printRightBoundries(node.right)
    }
    
    func printLeftBoundries(_ node: Node?) {
        guard let node = node else {
            return
        }
        
        if node.left != nil {
            print(" \(node.value)")
            printLeftBoundries(node.left)
        }
    }
    
    func printLeaves(_ node: Node?) {
        guard let node = node else {
            return
        }

        printLeaves(node.left)
        
        if node.left == nil, node.right == nil {
            print(" \(node.value)")
        }
        
        printLeaves(node.right)
    }
    
    func printRightBoundries(_ node: Node?) {
        guard let node = node else {
            return
        }

        if node.right != nil {
            printLeftBoundries(node.right)
            print(" \(node.value)") // to make sure down to up manner
        }

    }
    
}

var testArray = [10, 5, 1, 7, 40, 50, 60]
var obj = Test()
var node = obj.construct(testArray)
obj.printBoundries(node)
//: [Next](@next)
