
class Testlazy {
    init() {
        print("init called")
    }
    
    func printvalue() {
        print("hello")
    }
}

class Test {
    lazy var testObj = Testlazy()
    
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }

//    lazy var testObj2: Testlazy { // This will give error --- lazy properties must have an initializer / lazy' must not be used on a computed property
//      return Testlazy()
//    }

    func testLazy() {
        testObj.printvalue()
        testObj.printvalue()
        testObj.printvalue()
        
        totalSteps = 5
        totalSteps = 6
        totalSteps = 7
    }
}

var obj = Test()
obj.testLazy()
/*
 init called
 hello
 hello
 hello
 About to set totalSteps to 5
 Added 5 steps
 About to set totalSteps to 6
 Added 1 steps
 About to set totalSteps to 7
 Added 1 steps
 */


/*
 =========================================================================================
                        Property Wrapper
 
 A property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property. For example, if you have properties that provide thread-safety checks or store their underlying data in a database, you have to write that code on every property. When you use a property wrapper, you write the management code once when you define the wrapper, and then reuse that management code by applying it to multiple properties.


 =========================================================================================
 */

@propertyWrapper
struct ZeroOneWrapper {
    private var number: Int
    init() {
        self.number = 0
    }
    
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = newValue > 0 ? 1 : 0
            
        }
    }
}

struct TestWrapper {
    @ZeroOneWrapper var number: Int
    
    mutating func verifyWrapper() {
        print(number)
        number = 7
        print(number)
        number = 0
        
        print(number)
    }
}

var wrapperObj = TestWrapper()
wrapperObj.verifyWrapper()
/*
 output
 
 0
 1
 0

 */

/*
 Property wrappers can also have properties of their own, which enables further customization, and even makes it possible to inject dependencies into our wrapper types.

Example - User default
 */

@propertyWrapper
struct UserDefaultsBacked<T> {
    var key: String
    var storage: UserDefaults = .standard
    
    var wrappedValue: T? {
        get { storage.value(forKey: key) as? T }
        set { storage.setValue(newValue, forKey: key) }
    }
}

/*
 Just like any other struct, our above UserDefaultsBacked type will automatically get a memberwise initializer with default arguments for all properties that have a default value — which means that we’ll be able to initialize instances of it by simply specifying which UserDefaults key that we want each property to be backed by:

 */
struct SettingsViewModel {
    @UserDefaultsBacked(key: "mark-as-read")
    var autoMarkMessagesAsRead: Bool

    @UserDefaultsBacked(key: "search-page-size")
    var numberOfSearchResultsPerPage: Int
}

