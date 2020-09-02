//: [Previous](@previous)

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

    func findLendth(_ root: Node?, _ elem: Int, _ currentDist: Int) -> Int {
        guard let root = root else {
            return -1
        }

        if root.value == elem {
            return currentDist
        } else if root.value >= elem {
            return findLendth(root.left, elem, currentDist + 1)
        } else {
            return findLendth(root.right, elem, currentDist + 1)
        }
    }
}

var testArray = [10, 5, 1, 7, 40, 50, 60]
var obj = Test()
var node = obj.construct(testArray)

print(obj.findLendth(node, 60, 0))
