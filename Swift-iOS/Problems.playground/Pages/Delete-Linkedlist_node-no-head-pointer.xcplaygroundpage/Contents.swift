
// Delete a singly linkedlist node without head pointer

struct Node {
    var value: Int
    var ref: Node?
}

func deleteNode(node: Node) {
    if node != nil {
        var temp = node.ref
        node.value = temp.value
        node.ref = temp.ref.ref
        temp = nil
    }
}
