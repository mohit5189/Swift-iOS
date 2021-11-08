/*
 Throw out elements from your array while condition returns true, stop when returning false.
 */

var fruits = ["Kiwi","Pineapple","Coconut","papaya","Banana","Rambutan"]
var fruitDrop:[String] = fruits
while fruitDrop.count>0 && fruitDrop.contains("a") {
  fruitDrop.remove(at: 0)
} //["Coconut", "papaya", "Kiwi", "Rambutan"]

print(fruitDrop)



let fruitDrop2 = fruits.drop { $0.contains("a") }
print(fruitDrop2)
//["Coconut", "papaya", "Kiwi", "Rambutan"]
