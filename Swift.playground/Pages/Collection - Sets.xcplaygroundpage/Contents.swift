/*
 A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.

 Hash Values for Set Types
 
 A type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that is the same for all objects that compare equally, such that if a == b, it follows that a.hashValue == b.hashValue.

 All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as set value types or dictionary key types. Enumeration case values without associated values (as described in Enumerations) are also hashable by default.

 
 .....................
 
 Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
 Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
 Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
 Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
 Use the isDisjoint(with:) method to determine whether two sets have no values in common.

 */

var set1 = Set<Int>()
print("\(set1.count)")
set1.insert(3)
print(set1) // [3]


var duplicateRemoval: Set = [1,1,2,2,3,3]
print(duplicateRemoval) // 1,2,3

var arrayWithDuplicate = [3,4,5,5,5,5,5,2]
duplicateRemoval = Set(arrayWithDuplicate)
print(duplicateRemoval) // [4, 2, 3, 5]

// check for empty

if duplicateRemoval.isEmpty {
    print("set is empty")
} else {
    print("set not empty")
}

// remove elemebt by value
duplicateRemoval.remove(2)
print(duplicateRemoval) // [4,3,5] order doesn't matters

// check if element exist
if duplicateRemoval.contains(4) {
    print("found")
}

// Iteration
for i in duplicateRemoval {
    print(i)
}

for i in duplicateRemoval.sorted() {
    print(i) // will print in ascending order
}

// Set operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]



var superSet: Set = [1,2,3,4,5,6,7,8,9,0]
var subSet: Set = [2,3,4,5]
var thirdSet: Set = [11,11,22,33,44]

superSet.isSuperset(of: subSet) // true

subSet.isSubset(of: superSet) // true

superSet.isDisjoint(with: thirdSet) // true
