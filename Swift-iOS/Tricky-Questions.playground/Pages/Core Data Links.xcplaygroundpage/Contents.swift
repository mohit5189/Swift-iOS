// https://code.tutsplus.com/tutorials/core-data-from-scratch-core-data-stack--cms-20926
// https://cocoacasts.com/core-data-and-concurrency
// https://five.agency/how-to-import-a-large-data-set-using-core-data/
// https://medium.com/@shakya4577/heavyweight-core-data-migration-51570555124b#:~:text=%E2%80%9CUse%20heavyweight%20(manual)%20migration,the%20capabilities%20of%20lightweight%20migration.%E2%80%9D&text=In%20such%20cases%2C%20lightweight%20migration,so%20is%20called%20heavyweight%20migration.


NSManagedObjectModel - Model schema

NSPersistentStoreCoordinator - tell path to DB, layer betwen NSManagedObjectModel and NSPersistentStore

ManagedObjectContext - Managed collection of NSManagedObjectModel, instances of the NSManagedObject class, It's perfectly possible to have multiple managed object contexts. Each managed object context is backed by a persistent store coordinator


You can see a managed object context as a workbench on which you work with your model objects. You load them, you manipulate them, and save them on that workbench



Rules in Multithreaded:

1. NSManagedObject instances should never be passed from one thread to another. If you need to pass a managed object from one thread to another, you use a managed object's objectID property.

. There are three methods you need to know about:

object(with:)
existingObject(with:)
registeredObject(for:)

The first method, object(with:), returns a managed object that corresponds to the NSManagedObjectID instance. If the managed object context doesn't have a managed object for that object identifier, it asks the persistent store coordinator. This method always returns a managed object.

Know that object(with:) throws an exception if no record can be found for the object identifier it receives. For example, if the application deleted the record corresponding with the object identifier, Core Data is unable to hand your application the corresponding record. The result is an exception.

The existingObject(with:) method behaves in a similar fashion. The main difference is that the method throws an error if it cannot fetch the managed object corresponding to the object identifier.

The third method, registeredObject(for:), only returns a managed object if the record you're asking for is already registered with the managed object context. In other words, the return value is of type NSManagedObject?. The managed object context doesn't fetch the corresponding record from the persistent store if it cannot find it.


let objectID = managedObject.objectID

DispatchQueue.main.async {
    let managedObject = managedObjectContext?.object(with: objectID)
    ...
}

========================================
    
Rule 2- Creating an NSManagedObjectContext instance is a cheap operation. You should never share managed object contexts between threads. This is a hard rule you shouldn't break. The NSManagedObjectContext class isn't thread safe. Plain and simple.


=========================================

Rule 3 - Even though the NSPersistentStoreCoordinator class isn't thread safe either, the class knows how to lock itself if multiple managed object contexts request access, even if these managed object contexts live and operate on different threads.

It's fine to use one persistent store coordinator, which is accessed by multiple managed object contexts from different threads. This makes Core Data concurrency a little bit easier ... a little bit.


// Example


private lazy var privateManagedObjectContext: NSManagedObjectContext = {
    // Initialize Managed Object Context
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)

    // Configure Managed Object Context
    managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator

    return managedObjectContext
}()


private(set) lazy var managedObjectContext: NSManagedObjectContext = {
    let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    managedObjectContext.parent = self.privateManagedObjectContext -------- Tb be noted

    return managedObjectContext
}()


@objc func saveChanges(_ notification: NSNotification) {
    managedObjectContext.perform {
        do {
            if self.managedObjectContext.hasChanges {
                try self.managedObjectContext.save()
            }
        } catch {
            let saveError = error as NSError
            print("Unable to Save Changes of Managed Object Context")
            print("\(saveError), \(saveError.localizedDescription)")
        }

        self.privateManagedObjectContext.perform {
            do {
                if self.privateManagedObjectContext.hasChanges {
                    try self.privateManagedObjectContext.save()
                }
            } catch {
                let saveError = error as NSError
                print("Unable to Save Changes of Private Managed Object Context")
                print("\(saveError), \(saveError.localizedDescription)")
            }
        }

    }
}

