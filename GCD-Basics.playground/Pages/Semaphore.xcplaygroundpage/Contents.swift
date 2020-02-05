//: [Previous](@previous)
// ==========================  DispatchSemaphore  ======================================
// DispatchSemaphore provides a way to synchronously wait for a group of asynchronous tasks.
// Making above example using DispatchSemaphore
// If don't use semaphore.wait() then it will print test 3, test 2, test 1 in reverse order.


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
}

var semaphoreTestObj = DispatchSemaphoreTest()
semaphoreTestObj.fetchMultipleResponses {
    print("All group executed, Now we can execute further operations")
}
//: [Next](@next)
