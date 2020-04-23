import UIKit

/*
 Main, global and custom queues
 The main queue is a serial one, every task on the main queue runs on the main thread.

 Global queues are system provided concurrent queues shared through the operating system. There are exactly four of them organized by high, default, low priority plus an IO throttled background queue.

 Custom queues can be created by the user. Custom concurrent queues always mapped into one of the global queues by specifying a Quality of Service property (QoS). In most of the cases if you want to run tasks in parallel it is recommended to use one of the global concurrent queues, you should only create custom serial queues.
 */

/*
============================================================================================================
                                Type Of DispatchQueue
============================================================================================================
 */

/*
 ===========================================================================================================
                                            1. MainQueue
 ===========================================================================================================
 */

class MainQueueExample {
    func executeTask() {
        DispatchQueue.main.async {
            // Perform main queue tasks here
        }
    }
}


/*
=============================================================================================================
                                           2.Global Queue
 
 Global queues: concurrent queues that are shared by the whole system. There are four such queues with different priorities : high, default, low, and background. The background priority queue has the lowest priority and is throttled in any I/O activity to minimize negative system impact.
=============================================================================================================

 When sending tasks to the global concurrent queues, you don’t specify the priority directly. Instead, you specify a Quality of Service (QoS) class property. This indicates the task’s importance and guides GCD in determining the priority to give to the task.
 
 Qos classes -
 User-interactive - for imidiate, Use it for UI updates, event handling and small workloads that require low latency
 User-initiated - The user initiates these asynchronous tasks from the UI. Use them when the user is waiting for immediate results and for tasks required to continue user interaction. They execute in the high priority global queue
 Utility - Long running tasks, eg show loading icon
 Background - This is lowest priority
 
===============================================================================================================
 */

class Test {
    func TestGlobal() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
          guard let self = self else {
            return
          }
          DispatchQueue.main.async { [weak self] in // render on UI
          }
        }
    }
}




/*
 =============================================================================================================
                                            2.Custom Queue

 queues that you create which can be serial or concurrent. Requests in these queues actually end up in one
 of the global queues
 =============================================================================================================
 Read-Write Problem Solution using ------- barrier -------- barrier task will run alone rest will work concurrent
 =============================================================================================================
 */

class Photo {}

class ThreadSafeExample {
    var unsafePhotos:[Photo] = []
    
    private let concurrentPhotoQueue =
    DispatchQueue(
      label: "com.raywenderlich.GooglyPuff.photoQueue",
      attributes: .concurrent)

    func addPhoto(_ photo: Photo) {
      concurrentPhotoQueue.async(flags: .barrier) { [weak self] in
        guard let self = self else {
          return
        }
        self.unsafePhotos.append(photo)
      }
    }

    var photos: [Photo] {
      var photosCopy: [Photo]!
      concurrentPhotoQueue.sync {
        photosCopy = self.unsafePhotos
      }
      return photosCopy
    }
}


