/*
 The filter function loops over every item in a collection, and returns a collection containing only items that satisfy an include condition
 */

var array = [1,2,3,4,5,6,7,8,9]
var even = array.filter { $0 % 2 == 0}
print(even)

// Expended version

var even2 = array.filter({ num in
    return num % 2 == 0
})
