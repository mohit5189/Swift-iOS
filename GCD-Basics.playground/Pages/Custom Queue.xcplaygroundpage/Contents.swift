//: [Previous](@previous)

import Foundation

/*
 Output:
 
 other thread execution
 execution completed 1
 other thread execution
 out of queue ------------------- this can be at any order
 execution completed 2
 other thread execution
 execution completed 3
 other thread execution
 execution completed 4
 other thread execution
 execution completed 5
 0
 1
 2
 3

 Note - printed in serial queue one by one

 */
func custom1() {
    var serialQueue = DispatchQueue(label: "mohit.test1")
    for i in 1...5 {
        serialQueue.async {
            if Thread.isMainThread {
                print("main thread execution")
            } else {
                print("other thread execution")
            }
            
            print("execution completed \(i)")
        }
    }
    
    print("out of queue")
    

    serialQueue.async {
        for i in 0...3 {
            print("\(i)")
        }
    }

}

/*
 
 Output -
 
 main thread execution
 execution completed 1
 main thread execution
 execution completed 2
 main thread execution
 execution completed 3
 main thread execution
 execution completed 4
 main thread execution
 execution completed 5
 out of queue
 0
 1
 2
 3
 */

func custom2() {
    var serialQueue = DispatchQueue(label: "mohit.test2")
    for i in 1...5 {
        serialQueue.sync { // used to force sync
            if Thread.isMainThread {
                print("main thread execution")
            } else {
                print("other thread execution")
            }
            
            print("execution completed \(i)")
        }
    }
    
    print("out of queue")
    

    serialQueue.async {
        for i in 0...3 {
            print("\(i)")
        }
    }

}

/*
 other thread execution
 other thread execution
 other thread execution
 other thread execution
 execution completed 1
 execution completed 3
 other thread execution
 execution completed 5
 execution completed 4
 execution completed 2
 0
 out of queue
 1
 2
 3

 */
func custom3() {
    var concurrentQueue = DispatchQueue(label: "mohit.test3", attributes: .concurrent)
    for i in 1...5 {
        concurrentQueue.async {
            if Thread.isMainThread {
                print("main thread execution")
            } else {
                print("other thread execution")
            }
            
            print("execution completed \(i)")
        }
    }
    
    print("out of queue")
    

    concurrentQueue.async {
        for i in 0...3 {
            print("\(i)")
        }
    }

}

/*
 main thread execution
 execution completed 1
 main thread execution
 execution completed 2
 main thread execution
 execution completed 3
 main thread execution
 execution completed 4
 main thread execution
 execution completed 5
 out of queue
 0
 1
 2
 3
 */

func custom4() {
    var concurrentQueue = DispatchQueue(label: "mohit.test4", attributes: .concurrent)
    for i in 1...5 {
        concurrentQueue.sync {
            if Thread.isMainThread {
                print("main thread execution")
            } else {
                print("other thread execution")
            }
            
            print("execution completed \(i)")
        }
    }
    
    print("out of queue")
    

    concurrentQueue.async {
        for i in 0...3 {
            print("\(i)")
        }
    }

}


/*
 =================================Target Queue======================
 
 A custom dispatch queue doesn’t execute any work, it just passes work to the target queue. By default, target queue of custom dispatch queue is a default-priority global queue. Since Swift 3, once a dispatch queue is activated, it cannot be mutated anymore
 
 The target queue of a custom queue can be set by the setTarget(queue:) function. Setting a target on an activated queue will compile but then throw an error in runtime. Fortunately, DispatchQueue initializer accepts other arguments. If for whatever reason, you still need to set the target on an already created queue, you can do that by using the initiallyInactive attribute available since iOS 10.
 DispatchQueue(label: "queue", attributes: .initiallyInactive)

 */
/*
 output
 0
 1
 2
 3
 4
 5
 6
 7

 */
func custom5() {
    
    let serialQueue = DispatchQueue(label: "com.mohit5")
    let concurrentQueue = DispatchQueue(label: "com.concurrent1", attributes: [.initiallyInactive, .concurrent])
    concurrentQueue.setTarget(queue: serialQueue)
    concurrentQueue.activate()
    
    concurrentQueue.async {
    for j in 0...4 {
            print("\(j)")
        }
    }

    concurrentQueue.async {
    for j in 5...7 {
            print("\(j)")
        }
    }
}
//custom1()
custom5()
