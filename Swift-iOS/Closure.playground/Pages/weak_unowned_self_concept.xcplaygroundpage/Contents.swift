
/*
 ===========================================
 Case 1 - Check what will happen if we using strong self in closure (Not holding closure instamce in self)
 ===========================================
 */

import Foundation

class Book {
    var bookName: String
    
    init(bookName: String) {
        self.bookName = bookName
    }
    
    func printName() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print(self.bookName)
        }
    }
    
    deinit {
        print("Book deleted")
    }
}

var bookObj: Book?
bookObj = Book(bookName: "Objective C")
bookObj?.printName()
bookObj = nil

/*
 Above code will print following output, NO RETAIN CYCLE HERE SINCE WE DON'T HOLD CLOSURE INSTANCE:
 
 Objective C
 Book deleted
 */

/*
===========================================
Case 2 - Check what will happen if we using strong self in closure ( holding closure instamce in self)
===========================================
*/

class Book2 {
    var bookName: String
    var myClosure: (() -> Void)?
    
    init(bookName: String) {
        self.bookName = bookName
        setupClosure()
    }
    
    func setupClosure() {
        myClosure = {
            print(self.bookName)
        }
    }
    
    func printName() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.myClosure?()
        }
    }
    
    deinit {
        print("Book deleted")
    }
}

var bookObj2: Book2?
bookObj2 = Book2(bookName: "Objective C")
bookObj2?.printName()
bookObj2 = nil

/*
Above code will print following output,  RETAIN CYCLE HERE SINCE WE HOLD CLOSURE INSTANCE:

Objective C
*/


/*
===========================================
Case 3 - Check what will happen if we using weak self in closure ( holding closure instamce in self)
===========================================
*/

class Book3 {
    var bookName: String
    var myClosure: (() -> Void)?
    
    init(bookName: String) {
        self.bookName = bookName
        setupClosure()
    }
    
    func setupClosure() {
        myClosure = { [weak self] in
            print(self?.bookName)
        }
    }
    
    func printName() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.myClosure?()
        }
    }
    
    deinit {
        print("Book deleted")
    }
}

var bookObj3: Book3?
bookObj3 = Book3(bookName: "Objective C")
bookObj3?.printName()
bookObj3 = nil

/*
Above code will print following output, NO RETAIN CYCLE HERE SINCE WE HOLD CLOSURE INSTANCE WHICH HOLD WEAK INSTANCE:

Optional("Objective C")
Book deleted
*/


/*
===========================================
Case 4 - Check what will happen if we using strong self in closure but closure is weakk ( holding closure instamce in self)
===========================================
*/

/*
class Book4 {
    var bookName: String
    weak var myClosure: (() -> Void)?
    
    init(bookName: String) {
        self.bookName = bookName
        setupClosure()
    }
    
    func setupClosure() {
        myClosure = {
            print(self.bookName)
        }
    }
    
    func printName() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.myClosure?()
        }
    }
    
    deinit {
        print("Book deleted")
    }
}

var bookObj4: Book4?
bookObj4 = Book4(bookName: "Objective C")
bookObj4?.printName()
bookObj4 = nil
*/


/*
 Above code will give error 'weak' may only be applied to class and class-bound protocol types, not '() -> Void
 
 
 */

