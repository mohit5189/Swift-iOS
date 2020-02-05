//: [Previous](@previous)

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
