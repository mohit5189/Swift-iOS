
class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        self.data = value
        self.left = nil
        self.right = nil
    }
}

enum Direction {
    case left
    case right
}

class TreeExample {
    var head: Node?
    
    func createTree() {
        head = Node(10)
        head?.left = Node(5)
        head?.left?.right = Node(7)
        head?.right = Node(15)
        head?.right?.left = Node(12)
    }
    
    func preOrder(_ node: Node?) {
        guard let node = node else {
            return
        }
        
        print("\t \(node.data)")
        preOrder(node.left)
        preOrder(node.right)
    }
    
    func postOrder(_ node: Node?) {
        guard let node = node else {
            return
        }
        
        postOrder(node.left)
        postOrder(node.right)
        print("\t \(node.data)")
    }

    func inOrder(_ node: Node?) {
        guard let node = node else {
            return
        }
        
        inOrder(node.left)
        print("\t \(node.data)")
        inOrder(node.right)

    }
    
    func inOrderWithoutRecursion() {
        /*
         1) Create an empty stack S.
         2) Initialize current node as root
         3) Push the current node to S and set current = current->left until current is NULL
         4) If current is NULL and stack is not empty then
              a) Pop the top item from stack.
              b) Print the popped item, set current = popped_item->right
              c) Go to step 3.
         5) If current is NULL and stack is empty then we are done.
         */
        var current = head
        var stack: [Node] = []
        
        while (current != nil || stack.count != 0) {
            while current != nil {
                stack.append(current!)
                current = current?.left
            }
            
            current = stack.popLast()
            print("\t \(String(describing: current?.data))")
            current = current?.right
        }
    }
    
    func search(_ node: Node?, _ value: Int) -> Node? {

        if node == nil {
            return node
        }

        if let nodeData = node?.data {
            if value == nodeData {
                return node
            }
            if value < nodeData {
                return search(node?.left, value)
            } else if value > nodeData {
                return search(node?.right, value)
            }
        }
        return nil
    }
}

var obj = TreeExample()

obj.createTree()
obj.preOrder(obj.head)
print("\n")
obj.postOrder(obj.head)
print("\n")
obj.inOrder(obj.head)
print("\n")
obj.inOrderWithoutRecursion()
print("found = \(String(describing: obj.search(obj.head, 12)?.data))")
