//: [Previous](@previous)
// ==========================  DispatchSemaphore  ======================================
// DispatchSemaphore provides a way to synchronously wait for a group of asynchronous tasks.
// Making above example using DispatchSemaphore
// If don't use semaphore.wait() then it will print test 3, test 2, test 1 in reverse order.

/*
 
 Calling wait() perform the following work:
    Decrement semaphore counter by 1.
    If the resulting value is less than zero, thread is blocked and will go into waiting state.
    If the resulting value is equal or bigger than zero, code will get executed without waiting.
 Calling signal() perform the following work:
    Increment semaphore counter by 1.
    If the previous value was less than zero, this function unblock the thread currently waiting in the thread queue.
    If the previous value is equal or bigger than zero, it means thread queue is empty, no one is waiting.

 */

import UIKit

class DispatchSemaphoreTest {
    typealias SuccessClosure = () -> ()
    
    func fetchMultipleResponses (onSuccess: @escaping SuccessClosure) {
        let semaphore = DispatchSemaphore(value: 0)
        var counter = 1
        let queue = DispatchQueue.global()
        queue.async { [weak self] in
            while counter <= 3 {
                self?.testApiCall(message: "test \(counter)", waitTime: 3 - counter, onSuccess: {
                    semaphore.signal()
                })
                semaphore.wait()
                counter += 1
            }
        }
        onSuccess()
    }
    
    func testApiCall(message: String, waitTime: Int, onSuccess: @escaping SuccessClosure) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(waitTime * 1000)) {
            print(message)
            onSuccess()
        }
    }
    
    func test2() {
        var value: Int = 2

        let concurrentQueue = DispatchQueue(label: "queue", attributes: .concurrent)
        let semaphore = DispatchSemaphore(value: 1)

        for j in 0...4 {
            concurrentQueue.async {
                print("\(j) waiting")
                semaphore.wait()
                print("\(j) wait finished")
                value = j
                print("\(value) ✡️")
                print("\(j) Done with assignment")
                semaphore.signal()
            }
        }

    }
}

var semaphoreTestObj = DispatchSemaphoreTest()
//semaphoreTestObj.fetchMultipleResponses {
//    print("All group executed, Now we can execute further operations")
//}
semaphoreTestObj.test2()
//: [Next](@next)
