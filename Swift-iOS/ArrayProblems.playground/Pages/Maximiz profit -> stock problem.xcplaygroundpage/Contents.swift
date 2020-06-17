
// [100, 180, 260, 310, 40, 535, 695]

// Buy once sell once

/*
 In this method, instead of taking difference of the picked element with every other element, we take the difference with the minimum element found so far. So we need to keep track of 2 things:
 1) Maximum difference found so far (max_diff).
 2) Minimum number visited so far (min_element).
 */

func maximumProfit(_ array: [Int]) {
    var minElement: Int = array[0]
    var maxProfit = -1
    var buyPositionTemp = 0
    var buyPosition = 0
    var sellPosition = 0

    for (index, num) in array.enumerated() {
        if minElement > num {
            buyPositionTemp = index
            minElement = num
        }
        if (num - minElement) > maxProfit {
            sellPosition = index
            buyPosition = buyPositionTemp
            maxProfit = num - minElement
        }
    }
    
    print("buy at \(buyPosition) sell at \(sellPosition) profit \(maxProfit)")
    
}

maximumProfit([100, 180, 260, 310, 40, 535, 695])


// Buy and sell multiple time


func maximumProfit2(_ array: [Int]) {
    var buyPrice = array[0]
    var maxProfit = 0
    for (index, num) in array.enumerated() {
        if index < array.count - 1,  num > array[index + 1] {
            maxProfit += num - buyPrice
            buyPrice = array[index + 1]
        } else {
            if index == array.count - 1, num > buyPrice {
                maxProfit += num - buyPrice
            }
        }
    }
    
    print("profit \(maxProfit)")
    
}

maximumProfit2([100, 180, 260, 310, 40, 100, 240, 55, 100, 355])
