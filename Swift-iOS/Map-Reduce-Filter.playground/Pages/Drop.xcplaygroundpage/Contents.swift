/*
 Throw out elements from your array while condition returns true, stop when returning false.
 */

var fruits = ["Kiwi","Pineapple","Coconut","papaya","Banana","Rambutan"]
var fruitDrop:[String] = fruits
while fruitDrop.count>0 && fruitDrop.first!.contains("a") {
  fruitDrop.remove(at: 0)
} //["Coconut", "papaya", "Kiwi", "Rambutan"]




let fruitDrop2 = fruits.drop { $0.contains("a") }
//["Coconut", "papaya", "Kiwi", "Rambutan"]
