//: [Previous](@previous)

import Foundation



func selectionSort<T: Comparable>(_ arr: inout [T]) {
    for index1 in 0..<arr.count - 1 {
        for index2 in index1 + 1..<arr.count {
            if arr[index1] > arr[index2] {
                let temp = arr[index1]
                arr[index1] = arr[index2]
                arr[index2] = temp
            }
        }
    }
    
    print("after selection sort \(arr)")
}

func bubbleSort<T: Comparable>(_ arr: inout [T]) {
    for index1 in 0..<arr.count - 1 {
        for index2 in 0..<arr.count - index1 - 1 {
            if arr[index2] > arr[index2 + 1] {
                let temp = arr[index2]
                arr[index2] = arr[index2 + 1]
                arr[index2 + 1] = temp
            }
        }
    }
    
    print("after bubble sort \(arr)")
}

func insertionSort<T: Comparable>(_ arr: inout [T]) {
    for index in 1..<arr.count - 1 {
        let value = arr[index]
        var currentIndex = index
       
        while currentIndex > 0, value < arr[currentIndex - 1] {
            arr[currentIndex] = arr[currentIndex - 1]
            currentIndex -= 1
        }
        
        arr[currentIndex] = value
    }
    
    print("after insertion sort \(arr)")

}

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
  guard array.count > 1 else {
    print("returning \(array)")
    return array
    }

  let middleIndex = array.count / 2
  print("merge sort = \(array)")
  let leftArray = mergeSort(Array(array[0..<middleIndex]))
  let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
  
    print("merge = \(leftArray)    \(rightArray)")
  return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
  var leftIndex = 0
  var rightIndex = 0

  var orderedArray: [T] = []
  
  while leftIndex < left.count && rightIndex < right.count {
    let leftElement = left[leftIndex]
    let rightElement = right[rightIndex]

    if leftElement < rightElement {
      orderedArray.append(leftElement)
      leftIndex += 1
    } else if leftElement > rightElement {
      orderedArray.append(rightElement)
      rightIndex += 1
    } else {
      orderedArray.append(leftElement)
      leftIndex += 1
      orderedArray.append(rightElement)
      rightIndex += 1
    }
  }

  while leftIndex < left.count {
    orderedArray.append(left[leftIndex])
    leftIndex += 1
  }

  while rightIndex < right.count {
    orderedArray.append(right[rightIndex])
    rightIndex += 1
  }
  
  return orderedArray
}


var arrayToSort = [3,6,4,2,3,8,9,2,11,23,54]
selectionSort(&arrayToSort)
arrayToSort = [3,6,4,2,3,8,9,2,11,23,54]
bubbleSort(&arrayToSort)
arrayToSort = [3,6,4,2,3,8,9,2,11,23,54]
insertionSort(&arrayToSort)
arrayToSort = [3,6,4,2,3,8,9,2,11,23,54]
print("\(mergeSort(arrayToSort))")
