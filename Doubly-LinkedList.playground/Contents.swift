/*
 Advantages over singly linked list
 1) A DLL can be traversed in both forward and backward direction.
 2) The delete operation in DLL is more efficient if pointer to the node to be deleted is given.
 3) We can quickly insert a new node before a given node.
 In singly linked list, to delete a node, pointer to the previous node is needed. To get this previous node, sometimes the list is traversed. In DLL, we can get the previous node using previous pointer.

 Disadvantages over singly linked list
 1) Every node of DLL Require extra space for an previous pointer. It is possible to implement DLL with single pointer though (See this and this).
 2) All operations require an extra pointer previous to be maintained. For example, in insertion, we need to modify previous pointers together with next pointers. For example in following functions for insertions at different positions, we need 1 or 2 extra steps to set previous pointer.

 */

class Node<T> {
    var value: T
    var next: Node<T>?
    var prev: Node<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

class DoublyLinkedList<T> {
    var head: Node<T>?
    var currentNode: Node<T>?

    func append(_ value: T) {
        if head == nil {
            head = Node(value)
            head?.prev = nil
            head?.next = nil
            currentNode = head
        } else {
            var newNode = Node(value)
            newNode.next = nil
            newNode.prev = currentNode
            currentNode?.next = newNode
            currentNode = newNode
        }
    }
    
    func printValues() {
        var headCopy = head
        while headCopy != nil {
            print("\t \(headCopy?.value)")
            headCopy = headCopy?.next
        }
    }
    
    func reverse() {
        var headCopy = head
        var temp: Node<T>?
        var lastNode: Node<T>?
        
        // Just swap next and previous
        while headCopy != nil {
            temp = headCopy?.next
            if temp == nil { // if we start with temp = headCopy?.prev, then we can skip this extra element
                lastNode = headCopy
            }
            headCopy?.next = headCopy?.prev
            headCopy?.prev = temp
            
            headCopy = headCopy?.prev
            print("value \(headCopy?.value)")
        }
        
        // Shift head
        head = lastNode
    }
}

var obj = DoublyLinkedList<Int>()
obj.append(1)
obj.append(2)
obj.append(3)
obj.append(4)
obj.append(6)
obj.printValues()
obj.reverse()
obj.printValues()
