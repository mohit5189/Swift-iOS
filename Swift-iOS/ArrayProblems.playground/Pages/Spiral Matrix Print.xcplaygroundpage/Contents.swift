// https://www.geeksforgeeks.org/print-a-given-matrix-in-spiral-form/
func printSpiral() {
    var arr: [[Int]] = [[1,2,3,4],
                        [5,6,7,8],
                        [9,10,11,12],
                        [13,14,15,16]]
    
    var startRowPoint = 0
    var endRowPoint = 3
    var startColumnPoint = 0
    var endColumnPoint = 3

    while startRowPoint < endRowPoint, startColumnPoint < endColumnPoint {
        // print first row
        for i in startColumnPoint...endColumnPoint {
            print(arr[startRowPoint][i])
        }
        startRowPoint += 1
        
        // print last column
        for i in startRowPoint...endRowPoint {
            print(arr[i][endColumnPoint])
        }
        endColumnPoint -= 1
        
        // Print last row
        if startRowPoint <= endRowPoint {
            for k in stride(from: endColumnPoint, to: startColumnPoint - 1, by: -1)  {
                print(arr[endRowPoint][k])
            }
            endRowPoint -= 1
        }
        
        // print first columns
        if startColumnPoint < endColumnPoint {
            for k in stride(from: endRowPoint, to: startRowPoint - 1 , by: -1)  {
                print(arr[k][0])
            }
            startColumnPoint += 1
        }
        
    }
}

printSpiral()
