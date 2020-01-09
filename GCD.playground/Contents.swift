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
