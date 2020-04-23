import UIKit


// Simple Stack implementation

class Stack {
    
    var stackArray: [Int] = []
    
    func push(_ number: Int) {
        if stackArray.count >= 5 {
            print("stack overflow")
            return
        }
        stackArray.append(number)
    }
    
    func pop() {
        if stackArray.count == 0 {
            print("no more element to pop")
            return
        }
        print("removed \(stackArray.removeLast())")
    }
}

var obj = Stack()
obj.push(1)
obj.push(2)
obj.push(3)
obj.push(4)
obj.push(5)
obj.push(6)
obj.pop()
obj.pop()


// =====================================================================================
// Implement 2 stack using single array
// Approach 1 - divide array in 2 part, store data, but this will not be space efficient since let say we inserted all element in second stack, then it will overflow after array last index, but we have first half array available
// Approach 2 - Start stack1 from 0th to last and stack2 from last to 0th (better one)

class TwoStack {
    var sizeOfArray = 10
    var arrayStack: [Int] = []
    var top1 = -1
    var top2 = 10
    
    func push1(_ number: Int) {
        if top2 - top1 == 0 {
            print("stack overflow")
            return
        }
        top1 += 1
        arrayStack[top1] = number
    }
    
    func push2(_ number: Int) {
        if top2 - top1 == 0 {
            print("stack overflow")
            return
        }
        top2 -= 1
        arrayStack[top2] = number
    }
    
    func pop1() {
        if top1 < 0 {
            print("empty stack 1")
            return
        }
        print("removed stack1 \(arrayStack.remove(at: top1))")
        top1 -= 1
    }
    
    func pop2() {
        if top2 > 9 {
            print("empty stack 2")
            return
        }
        print("removed stack2 \(arrayStack.remove(at: top2))")
        top2 += 1
    }
}

// ========================================== Queue using stack ========================================================
/*
 1. On push method call, pop all element from stack1 to stack 2 and push in stack 1
 2. Now pop all element from stack 2 to stack 1
 */

// ================================ Stack Using Queue ============================================
/*
 push(s, x) operation:
    Enqueue x to q1 (assuming size of q1 is unlimited).
 pop(s) operation:
    One by one dequeue everything except the last element from q1 and enqueue to q2.
    Dequeue the last item of q1, the dequeued item is result, store it.
    Swap the names of q1 and q2
    Return the item stored in step 2.
 */

