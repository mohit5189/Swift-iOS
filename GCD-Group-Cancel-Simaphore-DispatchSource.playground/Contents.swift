import UIKit


//  ===================== Cancelable Disptch Queue using DispatchWorkItem ======================
// DispatchQueue generally accept DispatchWorkItem to execute which contains method to cancel()

struct TestClass {
    func searchResult(searchString: String) -> DispatchWorkItem {
        let workItem = DispatchWorkItem {
            print(searchString)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000), execute: workItem)
        return workItem
    }
}

var stringArray = ["a","b","c","d","e","f","g","h","i"]
var testObj = TestClass()
var dispatchItems: [DispatchWorkItem] = []
stringArray.forEach { value in
    dispatchItems.append(testObj.searchResult(searchString: value))
}
// Now test to stop random queue
dispatchItems[3].cancel() // it will cancel thread to print D




// ========================= DispatchGroup Example ======================================
// ========== Use in case if we need event after multiple api call are processed =======================

class DispatchGroupTest {
    typealias SuccessClosure = () -> ()

    func fetchMultipleResponses (onSuccess: @escaping SuccessClosure) {
        let dispatchGroup = DispatchGroup()

        dispatchGroup.enter()
        testApiCall1 {
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        testApiCall2 {
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        testApiCall3 {
            dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) {
            onSuccess()
        }
    }

    func testApiCall1(onSuccess: @escaping SuccessClosure) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            print("test 1 called")
            onSuccess()
        }
    }

    func testApiCall2(onSuccess: @escaping SuccessClosure) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
            print("test 2 called")
            onSuccess()
        }
    }

    func testApiCall3(onSuccess: @escaping SuccessClosure) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
            print("test 3 called")
            onSuccess()
        }
    }
}

var groupTestObj = DispatchGroupTest()
groupTestObj.fetchMultipleResponses {
    print("All group executed, Now we can execute further operations")
}


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


/*
 ================================================================================================
                        Observing changes in a file with DispatchSource
 ================================================================================================
 The final “lesser known” feature of GCD that I want to bring up is how it provides a way to observe changes in a file on the file system. Like DispatchSemaphore, this is something which can be super useful in a script or command line tool, if we want to automatically react to a file being edited by the user. This enables us to easily build developer tools that have “live editing” features.
==================================================================================================
 */

class FileObserver {
    private let file: File
    private let queue: DispatchQueue
    private var source: DispatchSourceFileSystemObject?

    init(file: File) {
        self.file = file
        self.queue = DispatchQueue(label: "com.myapp.fileObserving")
    }

    func start(closure: @escaping () -> Void) {
        // We can only convert an NSString into a file system representation
        let path = (file.path as NSString)
        let fileSystemRepresentation = path.fileSystemRepresentation

        // Obtain a descriptor from the file system
        let fileDescriptor = open(fileSystemRepresentation, O_EVTONLY)

        // Create our dispatch source
        let source = DispatchSource.makeFileSystemObjectSource(
            fileDescriptor: fileDescriptor,
            eventMask: .write,
            queue: queue
        )

        // Assign the closure to it, and resume it to start observing
        source.setEventHandler(handler: closure)
        source.resume()
        self.source = source
    }
}

let observer = try FileObserver(file: file)

observer.start {
    print("File was changed")
}

