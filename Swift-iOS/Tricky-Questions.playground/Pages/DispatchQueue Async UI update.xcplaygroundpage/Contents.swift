
import Foundation

/*
 
 When you use async it lets the calling queue move on without waiting until the dispatched block is executed. On the contrary sync will make the calling queue stop and wait until the work you've dispatched in the block is done. Therefore sync is subject to lead to deadlocks. Try running DispatchQueue.main.sync from the main queue and the app will freeze because the calling queue will wait until the dispatched block is over but it won't be even able to start (because the queue is stopped and waiting)

 When to use sync? When you need to wait for something done on a DIFFERENT queue and only then continue working on your current queue

 Example of using sync:

 On a serial queue you could use sync as a mutex in order to make sure that only one thread is able to perform the protected piece of code at the same time.


 */
struct UIController {
    
    func testAsync() {
        print("before")
        DispatchQueue.main.async {
            self.updateUI()
        }
        print("after")
    }
    
    func testSync() {
        // DispatchQueue.main.sync can't be used in main thread
        DispatchQueue.global(qos: .userInitiated).async{
            print("before")
            DispatchQueue.main.sync {
                self.updateUI()
            }
            print("after")
        }
    }

    // Won't work
    func testSync2() {
        DispatchQueue.main.async {
            DispatchQueue.main.sync {
                self.updateUI()
            }
        }

    }
    
    func updateUI() {
        print("UI updated")
    }
}

/*
 before
 after
 UI updated
 */
//UIController().testAsync()

/*
 before
 UI updated
 after
 */
//UIController().testSync()


UIController().testSync2()
