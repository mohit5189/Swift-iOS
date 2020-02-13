//: [Previous](@previous)

import Foundation


/*
 An operation can have dependencies to other operations and that is a powerful feature Grand Central Dispatch lacks. If there is need to perform several tasks in a specific order, then operations are a good solution.
 
 Operation States:
 Operation objects maintain states internally to determine when it is safe to execute and also to notify external clients of the progress through the operation’s life cycle.
 isReady: It informs client when an operation is ready to execute. This keypath returns true when the operation is ready to execute now or false if there are still unfinished operations on which it is dependent.
 isExecuting: This keypath tells us whether the operation is actively working on its assigned task. isExecuting returns true if the operation is working on its task or false if it is not.
 isFinished: It informs that an operation finished its task successfully or was cancelled. An operation object does not clear a dependency until the value at the isFinished key path changes to true. Similarly, an operation queue does not dequeue an operation until the isFinished property contains the value true
 isCancelled: The isCancelled key path inform clients that the cancellation of an operation was requested.
 If you cancel an operation before its start() method is called, the start() method exits without starting the task.
 
 Operation type:
 1. Block Operation- An operation that manages the concurrent execution of one or more blocks. BlockOperation class extends from Operation class.
 2 NSInvocationOperation - not available in swift
 3. Asynchronous Operation = Asynchronous operations can be created by subclassing Operation class, can use custom operation approach
 */

/*
 block operation
 */

func blockOperation() {
    var queue = OperationQueue()
    let blockOperation = BlockOperation()
    blockOperation.addExecutionBlock {
        !blockOperation.isCancelled {
            print("hello")
        }
    }
    
    let dependentOperation = BlockOperation()
    dependentOperation.addExecutionBlock {
        if !dependentOperation.isCancelled {
            print("dependent")
        }
    }
    dependentOperation.queuePriority = .high

    blockOperation.addDependency(dependentOperation)
    
    blockOperation.queuePriority = .high
    queue.addOperation(blockOperation)
    queue.maxConcurrentOperationCount = 2
    queue.waitUntilAllOperationsAreFinished()
    queue.cancelAllOperations()
}
