
/*
Like arrays, Linked List is a linear data structure. Unlike arrays, linked list elements are not stored at a contiguous location; the elements are linked using pointers.

Array Vs LinkedList:
1. Size of array is fixed , while linkedlist size not fix
2. Insertion and deletion take more effort in array because we need to shift elements
3. In an array, memory is assigned during compile time while in a Linked list it is allocated during execution or runtime
4. In addition memory utilization is inefficient in the array. Conversely, memory utilization is efficient in the linked list
5.

LinkedList Drawback:
1. can't access element direct without traverse
2. extra memory space for pointer

*/

//=========  Construct Linkedlist / Traverse /Insert / Delete / Delete LinkedList  =================================

class Node <T>: Equatable {
    
    // Can't have struct since struct will cause recursive issue
    var value: T
    var next: Node <T>?
    
    init(value: T) {
        self.value = value
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs == rhs
    }
}

class SinglyLinkedList <T> {
    var head: Node<T>?
    var currentNode: Node<T>?
    
    func appensElement(value: T) {
        if head == nil {
            head = Node(value: value)
            currentNode = head
        } else {
            let newNode = Node(value: value)
            currentNode?.next = newNode
            currentNode = newNode
        }
    }
    
    func printLinkedList() {
        var headCopy = head
        while headCopy != nil {
            print(" \t \(String(describing: headCopy?.value))")
            headCopy = headCopy?.next
        }
        print("\n")
    }
    
    func insertValue(value: T, index: Int) {
        var headCopy = head
        var currentIndex = 0
        while currentIndex != index - 1 {
            headCopy = headCopy?.next
            currentIndex += 1
        }
        
        let nodeToInsert = Node<T>(value: value)
        nodeToInsert.next = headCopy?.next
        headCopy?.next = nodeToInsert
    }
    
    func delete(_ index: Int) {
        var headCopy = head
        var currentIndex = 0
        while currentIndex != index - 1 {
            headCopy = headCopy?.next
            currentIndex += 1
        }
        headCopy?.next = headCopy?.next?.next
    }
    
    func deleteLinkedList() {
        head = nil
        currentNode = nil
    }
    
    func findMiddleElement() {
        /*
         Method 1:
         Traverse the whole linked list and count the no. of nodes. Now traverse the list again till count/2 and return the node at count/2.
         Method 2:
         Traverse linked list using two pointers. Move one pointer by one and other pointer by two. When the fast pointer reaches end slow pointer will reach middle of the linked list.
         */

        var headCopy1 = head
        var headCopy2 = head
        
        while headCopy2 != nil {
            headCopy1 = headCopy1?.next
            headCopy2 = headCopy2?.next?.next
        }
        print("middle = \(String(describing: headCopy1?.value))")
    }
    
    func isLoopExist() -> Bool {
        /*
         Traverse the list one by one and keep putting the node addresses in a Hash Table. At any point, if NULL is reached then return false and if next of current node points to any of the previously stored nodes in Hash then return true.
         */
        var nodes = [Node<T>]()
        var headCopy = head
        while headCopy != nil {
            if nodes.contains(headCopy!) {
                return true
            } else {
                nodes.append(headCopy!)
            }
            headCopy = headCopy?.next
        }
        return false
    }
}

var linkedList = SinglyLinkedList<String>()
linkedList.appensElement(value: "test 1")
linkedList.appensElement(value: "test 2")
linkedList.appensElement(value: "test 3")
linkedList.appensElement(value: "test 4")
linkedList.appensElement(value: "test 6")
linkedList.printLinkedList()
linkedList.insertValue(value: "test 5", index: 4)
linkedList.printLinkedList()
linkedList.printLinkedList()
linkedList.printLinkedList()
linkedList.findMiddleElement()
print("\n loop exist = \(linkedList.isLoopExist())")
