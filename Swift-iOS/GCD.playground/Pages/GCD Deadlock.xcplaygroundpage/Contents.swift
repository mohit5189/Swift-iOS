//: [Previous](@previous)

import Foundation

class Cases {
    func case1() { // output - 4,5,6 - will block on sync
        var value: Int = 2

        DispatchQueue.main.async {
            for i in 0...3 {
                value = i
                print("\(value) ✴️")
            }
        }

        for i in 4...6 {
            value = i
            print("\(value) ✡️")
        }

        // Do not call the dispatch_sync function from a task that is executing on the same queue that you pass to your function call. Doing so will deadlock the queue
        /*
         sync queues the block in the main queue.
         sync blocks the thread of the main queue until the block finishes executing.
         sync waits forever because the thread where the block is supposed to run is blocked.

        == The key to understanding this is that dispatch_sync does not execute blocks, it only queues them ==
         */
        DispatchQueue.main.sync {
            value = 9
            print(value)
        }

    }
    
    func case2() { // Output - 1,5,2 - it will stop during sync execution
        DispatchQueue.main.async {
            print("1")
            DispatchQueue.main.async {
                print("2")
                DispatchQueue.main.sync {
                    print("4")
                }
            }
            DispatchQueue.main.async {
                print("3")
            }
        }
        DispatchQueue.main.async {
            print("5")
        }
    }
    
    func case3() { // Output - will give errorsince it will be a deadlock
        DispatchQueue.main.sync {
            print("1")
            DispatchQueue.main.async {
                print("2")
                DispatchQueue.main.async {
                    print("4")
                }
            }
            DispatchQueue.main.async {
                print("3")
            }
        }
        DispatchQueue.main.async {
            print("5")
        }
    }

}

var obj = Cases()
obj.case3()


// test multiple dispatch hierarchy


//: [Next](@next)
