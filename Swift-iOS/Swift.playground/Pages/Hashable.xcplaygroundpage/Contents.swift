
/*
 THis will cover working of hashable protocol, we use for dictionary and set
 */

/*
 Example 1 - making Struct as hashable / Hasher
 
 ------------------------------------------
1. Hasher is defined as the universal hash function used by Set and Dictionary. Hasher is actually a Struct, example:

 2. Hasher can be used to map an arbitrary sequence of bytes to an integer hash value
 
 var hasher = Hasher()
 hasher.combine(23)
 hasher.combine("Hello")
 let hashValue = hasher.finalize()

 
 3. We should never called finalized() explicity because compiler do it automatically when access hashValue:
 
 var hashValue: Int {
     var hasher = Hasher()
     self.hash(into: &hasher)
     return hasher.finalize()
 }

 
 4. The combine(_:) method is just a convenience operation that takes in a Hashable value, such as an integer or string. Behind the scenes, this combine(_:) method calls the hash(into:) method to mix its value into the Hasher state.
 
 5. Hashable also confirms to Equalable protocol, so any class which confirms to hashable, should also confirm to Equalable protocol
 
 */

struct Student: Hashable {
    var name: String
    var age: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
        hasher.combine(id)
    }
}

var set: Set = [Student(name: "Mohit", age: "30", id: 1), Student(name: "Mohit", age: "30", id: 2)]
var searchItem = Student(name: "Mohit", age: "30", id: 2)
if set.contains(searchItem) {
    print("found")
}

/*
 Compound DS
 */

struct Team: Hashable {
    var captain: Student
    var coach: Student
    var players: [Student]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(captain.hashValue)
        hasher.combine(coach.hashValue)
        hasher.combine(players.hashValue)
    }
}

var dict = [Team: Int]()

/*
 With above code we can achieve our goal, but issue with code is:
 ------- Execution time will be very high in this case since ---hashValue-- will always call .finalize() which is a heavy operation. So this way it will call .finalize() 4 times.
 
 We can solve above problen in following manner
 */

struct Team2: Hashable {
    var captain: Student
    var coach: Student
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(captain.name)
        hasher.combine(captain.age)
        hasher.combine(captain.id)
        
        hasher.combine(coach.name)
        hasher.combine(coach.age)
        hasher.combine(coach.id)

    }
}

var dict1 = [Team2: Int]()


/*
 Automatic synthesis - Swift 4.1 provide Automatic synthesis without inheriting hashInto. This is for specific datatype
 */

struct Team3: Hashable {
var captain: Student
var coach: Student
}


/*
 ====================
 equalable example
 */

struct College: Hashable {
    var name: String
    var city: String
    
    static func == (lhs: College, rhs: College) -> Bool {
        return lhs.name == rhs.name && lhs.city == rhs.city
    }
}

var college1 = College(name: "DU", city: "Delhi")
var college2 = College(name: "DU", city: "Delhi")

if college1 == college2 {
    print("is equal")
} else {
    print("not equal")
}
