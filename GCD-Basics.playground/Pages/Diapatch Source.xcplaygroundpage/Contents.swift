//: [Previous](@previous)

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


//: [Next](@next)
