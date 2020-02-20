
// Single line string (using ")

var myString1 = "Test String"

//========================= Multi line Strings (using """) ===========================

let myString2 = """
Hello
this is multiline string test
"""

print(myString2)

//========================= Making line Continue using \  ============================

let myString3 = """
Hello \
this is multiline string test
"""

print(myString3)


// ========================Checking if string empty===============================

if !myString3.isEmpty {
    print("not empty")
}

// =========================== Print characters =======================
var charArray: [Character] = []
for char in myString1 {
    print(char)
    charArray.append(char)
}

// ======================== String from Char Array ====================
print(String(charArray))

// ================== Counting Characters ===========
print("\(myString2) ====   \(myString2.count)")

// =================== Access string character ============
print(myString2[myString2.startIndex])

print(myString1[myString1.index(after: myString1.startIndex)])

print(myString1[myString1.index(before: myString1.endIndex)])

// ================ Access any particular index ======================
print(myString1[myString1.index(myString1.startIndex, offsetBy: 5)])


// ================= Insert ================
myString1.insert("h", at: myString1.endIndex)

print(myString1)


// ============================== SubString (most dislike feature of swift) ===============================

let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
